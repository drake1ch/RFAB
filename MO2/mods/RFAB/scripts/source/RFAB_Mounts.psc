Scriptname RFAB_Mounts extends Quest Conditional

import PO3_SKSEFunctions

Keyword[] Property TownsKeywords Auto
{Кейворды локаций, где игрок может открыть инвентарь маунта}
WorldSpace[] Property AllowedWorlds Auto
{Миры, где игрок может призвать маунта}

Sound[] Property Whistles Auto
float Property Loudness = 1.0 Auto Hidden

ObjectReference Property SaveMarker Auto

RFAB_Mounts_Alias Property MountsAlias Auto

Actor Property Mount Auto Hidden
Actor Property PlayerRef Auto

int Property MountCarryWeight = 0 Auto Hidden Conditional
int Property MountSpeed = 150 Auto Hidden Conditional

string _MountName = "Моя лошадь"
string Property MountName Hidden
	string Function Get()
		return _MountName
	EndFunction
	Function Set(string asName)
		_MountName = asName
		UpdateWeightInName()
	EndFunction
EndProperty

bool Property IsShowWeightInMenu Auto Hidden

bool _IsShowWeightInName = false
bool Property IsShowWeightInName Hidden
	bool Function Get()
		return _IsShowWeightInName
	EndFunction
	Function Set(bool abValue)
		_IsShowWeightInName = abValue
		UpdateWeightInName()
	EndFunction
EndProperty

int Property HotKey Hidden 
	int Function Get()
		return JsonUtil.GetPathIntValue("RFAB_MCM_Settings.json", ".Mounts.iHotKey")
	EndFunction
	Function Set(int aiValue)
		UnregisterForAllKeys()
		RegisterForKey(aiValue)
		JsonUtil.SetPathIntValue("RFAB_MCM_Settings.json", ".Mounts.iHotKey", aiValue)
		JsonUtil.Save("RFAB_MCM_Settings.json")
	EndFunction
EndProperty

Event OnInit()
	RegisterForModEvent("RFAB_PlayerStartGame", "OnPlayerStartGame")
EndEvent

Event OnPlayerStartGame()
	RegisterForKey(HotKey)
	UnregisterForAllModEvents()
EndEvent

Event OnKeyDown(int aiKeyCode)
	if !Mount || Utility.IsInMenuMode()
		return
	endif

	int iMountState = GetMountState()

	if iMountState == 1
		Mount.MoveTo(PlayerRef, -250, -250)
		Mount.Enable()
		PlayWhistle(Utility.RandomInt(0, 9))
	elseif iMountState == 2
		if (IsShowWeightInMenu || IsShowWeightInName)
			MountsAlias.RegisterForMenu("ContainerMenu")
		endif
		Mount.OpenInventory(true)
	endif
EndEvent

Function PlayWhistle(int ID)
	int whistleID = Whistles[ID].Play(PlayerRef)
	Sound.SetInstanceVolume(whistleID, Loudness)
EndFunction

int Function GetMountState()
	float fDistance = PlayerRef.GetDistance(Mount)

	if (fDistance > 500 && !PlayerRef.IsInInterior() && !IsPlayerOnMount() && IsPlayerInAllowedWorld())
		return 1
	elseif (fDistance < 500 || IsPlayerInTown() || PlayerRef.GetCurrentLocation().IsCleared())
		return 2
	endif

	return -1
EndFunction

bool Function IsPlayerInTown()
	Location CurrentLocation = PlayerRef.GetCurrentLocation()
	int i = 0
	while i < TownsKeywords.Length
		if (CurrentLocation.HasKeyword(TownsKeywords[i]))
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction

bool Function IsPlayerOnMount()
	return PO3_SKSEFunctions.GetMount(PlayerRef) == Mount
EndFunction

bool Function IsPlayerInAllowedWorld()
	return AllowedWorlds.Find(PlayerRef.GetWorldSpace()) >= 0
EndFunction

Function AddWeight(int aiValue = 250)
	MountCarryWeight += aiValue
	UpdateMountStats()
	UpdateWeightInName()
EndFunction

Function AddSpeed(int aiValue = 50)
	MountSpeed += aiValue
	UpdateMountStats()
EndFunction

Function UpdateMountStats()
	SetMountAV("CarryWeight", MountCarryWeight)
	SetMountAV("SpeedMult", MountSpeed)
EndFunction

Function SetMountAV(string asActorValue, int aiValue)
	int iDelta = aiValue - Mount.GetActorValue(asActorValue) as int
	if (iDelta > 0)
		Mount.ModActorValue(asActorValue, iDelta)
	endif
EndFunction

Function UpdateWeightInMenu()
	if (IsShowWeightInMenu)
		UI.SetString("ContainerMenu", "_root.Menu_mc.inventoryLists.tabBar.leftLabel.htmlText", GetNameWithWeight())
	else
		UI.SetString("ContainerMenu", "_root.Menu_mc.inventoryLists.tabBar.leftLabel.htmlText", MountName)
	endif
EndFunction

Function UpdateWeightInName()
	if (IsShowWeightInName)
		Mount.SetDisplayName(GetNameWithWeight(), true)
	else
		Mount.SetDisplayName(MountName, true)
	endif
	PO3_SKSEFunctions.UpdateCrosshairs()
EndFunction

string Function GetNameWithWeight()
	int TotalItemWeight = Mount.GetTotalItemWeight() as int
	int CarryWeight = Mount.GetActorValue("CarryWeight") as int
	return MountName + " (" + TotalItemWeight + "/" + CarryWeight + ")"
EndFunction
