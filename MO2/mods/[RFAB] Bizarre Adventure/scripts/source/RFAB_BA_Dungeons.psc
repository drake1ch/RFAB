Scriptname RFAB_BA_Dungeons extends Quest  

string Property PATH_LOCATIONS = "Data/BizarreData/Dungeons/" AutoReadOnly

ImageSpaceModifier Property BlackOut Auto

GlobalVariable Property StageNumber Auto
{Начинается с 1}
GlobalVariable Property DungeonNumber Auto
{Начинается с 1}

string Property CurrentStage
	string Function Get()
		return Stages[StageNumber.GetValueInt() - 1]
	EndFunction
EndProperty

string Property CurrentDungeon
	string Function Get()
		return Dungeons[DungeonID]
	EndFunction	
EndProperty

string[] Property Stages Auto Hidden

string[] Property Dungeons Auto Hidden

int[] Property ClearedDungeons Auto Hidden

int Property DungeonID Auto Hidden

RFAB_BA_XP Property ScriptXP Auto
RFAB_BA_Radiant Property ScriptRadiant Auto
RFAB_BA_StageHandler Property ScriptStages Auto

Event OnInit()
	UpdateDungeonsData()
EndEvent

Function GoToNewDungeon()
	int iDungeonCount = GetDungeonCount()

	if (iDungeonCount == 1)
		StartDungeon(GetRandomDungeonID())
		return
	endif

	int[] iDungeonIDs = Utility.CreateIntArray(iDungeonCount, -1)
	string[] sDungeonsNames = Utility.CreateStringArray(iDungeonCount)

	int i = 0
	while (i < iDungeonCount)
		int iDungeonID = GetRandomDungeonID()
		if (iDungeonID != -1 && iDungeonIDs.Find(iDungeonID) == -1)
			iDungeonIDs[i] = iDungeonID
			if (Utility.RandomInt(0, 100) < 25)
				sDungeonsNames[i] = "Неразведанная дорога"
			else
				sDungeonsNames[i] = Dungeons[iDungeonID]
			endif
		else
			iDungeonIDs[i] = iDungeonIDs[i - 1]
		endif
		i += 1
	endwhile


	int iChoiceID = 0
	if PapyrusUtil.CountInt(iDungeonIDs, iDungeonIDs[iChoiceID]) != iDungeonCount
		iChoiceID = SkyMessage.ShowArray("И снова ты на перепутье...", sDungeonsNames, getIndex = true) as int
	endif
	StartDungeon(iDungeonIDs[iChoiceID])
EndFunction

int Function GetDungeonCount()
	int iAvailableDungeonCount = GetAvailableDungeonCount()
	int iDungeonCount = RollDungeonCount()

	if (iDungeonCount > iAvailableDungeonCount)
		iDungeonCount = iAvailableDungeonCount
	endif

	return iDungeonCount
EndFunction

int Function RollDungeonCount()
	int iRoll = Utility.RandomInt(0, 9)
	
	int iDungeonCount = 1
	if iRoll > 7
		iDungeonCount = 3
	elseif iRoll > 1
		iDungeonCount = 2
	endif

	return iDungeonCount
EndFunction

; Dungeons functions

Function StartDungeon(int aiDungeonID)
	DungeonID = aiDungeonID
	ObjectReference kMarker = GetDungeonMarker(CurrentStage, Dungeons[aiDungeonID])
	ScriptRadiant.StartDungeon(kMarker)
EndFunction

Function CompleteDungeon()
	SetCleared(DungeonID)
	int iXP = GetIntDungeonData(CurrentStage, CurrentDungeon, "Experience")
	ScriptXP.RewardForLocation(iXP)
	ModDungeonNumber()
EndFunction

Function SetCleared(int aiDungeonID)
	ClearedDungeons[aiDungeonID] = 1
EndFunction

bool Function IsCleared(int aiDungeonID)
	return ClearedDungeons[aiDungeonID] as bool
EndFunction

bool Function IsInRange(int aiDungeonID)
	int iDungeon = DungeonNumber.GetValueInt()
	return iDungeon >= GetIntDungeonData(CurrentStage, Dungeons[aiDungeonID], "MinLevel") \
		&& iDungeon <= GetIntDungeonData(CurrentStage, Dungeons[aiDungeonID], "MaxLevel") 
EndFunction

bool Function IsFinalDungeon(int aiDungeonID)
	return GetIntDungeonData(CurrentStage, Dungeons[aiDungeonID], "IsFinalDungeon") == 1
EndFunction

Function ModDungeonNumber(int aiValue = 1)
	bool bNewStage = IsFinalDungeon(DungeonID)
	if (bNewStage)
		ModStageNumber()
	else
		DungeonNumber.Mod(aiValue)
		ScriptStages.OnStageUpdate(StageNumber.GetValueInt(), DungeonNumber.GetValueInt(), bNewStage)
	endif
EndFunction

Function ModStageNumber(int aiValue = 1)
	StageNumber.Mod(aiValue)
	DungeonNumber.SetValueInt(1)
	DungeonID = -1
	ScriptStages.OnStageUpdate(StageNumber.GetValueInt(), DungeonNumber.GetValueInt(), true)
	UpdateDungeonsData()
EndFunction

Function UpdateDungeonsData()
	Stages = MiscUtil.FilesInFolder(PATH_LOCATIONS, ".ini")
	Dungeons = PapyrusIniManipulator.GetIniData(0, PATH_LOCATIONS + CurrentStage)
	ClearedDungeons = Utility.CreateIntArray(Dungeons.Length)
EndFunction

int Function GetRandomDungeonID()
	int[] iShuffledArray = CreateShuffledIntArray(Dungeons.Length)
	int i = 0
	while (i < Dungeons.Length)
		int iDungeonID = iShuffledArray[i]
		if !IsCleared(iDungeonID) && IsInRange(iDungeonID)
			return iDungeonID
		endif
		i += 1
	endwhile
	return -1
EndFunction

int Function GetAvailableDungeonCount()
	int iCount = 0
	int i = 0
	while (i < Dungeons.Length)
		if !IsCleared(i) && IsInRange(i)
			iCount += 1
		endif
		i += 1
	endwhile
	return iCount
EndFunction

; Data functions

string Function GetStringDungeonData(string asStage, string asDungeon, string asKey)
	return PapyrusIniManipulator.PullStringFromIni(PATH_LOCATIONS + asStage, asDungeon, asKey)
EndFunction

int Function GetIntDungeonData(string asStage, string asDungeon, string asKey)
	return PapyrusIniManipulator.PullIntFromIni(PATH_LOCATIONS + asStage, asDungeon, asKey)
EndFunction

ObjectReference Function GetDungeonMarker(string asStage, string asDungeon)
	string sMarkerID = GetStringDungeonData(asStage, asDungeon, "Marker")
	int iMarkerID = PO3_SKSEFunctions.StringToInt(sMarkerID)
	return Game.GetFormFromFile(iMarkerID, "RFAB_BizarreAdventure.esp") as ObjectReference
EndFunction

; Misc functions

int[] Function CreateShuffledIntArray(int aiSize)
	int[] iArray = CreateFilledArray(aiSize)
	int i = aiSize
	while (i > 1)
		i -= 1
		int iRandomIndex = PO3_SKSEFunctions.GenerateRandomInt(0, i)
		int iTemp = iArray[i]
		iArray[i] = iArray[iRandomIndex]
		iArray[iRandomIndex] = iTemp
	endwhile
	return iArray
EndFunction

int[] Function CreateFilledArray(int aiSize)
	int[] iArray = Utility.CreateIntArray(aiSize)
	int i = 0
	while (i < aiSize)
		iArray[i] = i
		i += 1
	endwhile
	return iArray
EndFunction