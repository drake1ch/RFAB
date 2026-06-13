Scriptname RFAB_StartMenu extends Quest  

float[] Property DamageToPlayer Auto Hidden 
{ Урон получаемый игроком }
float[] Property DamageByPlayer Auto Hidden 
{ Урон наносимый игроком }
float Property DamageWithCurse Auto Hidden 
{ Урон наносимый проклятым игроком }

bool Property Cursed = false Auto Hidden
int Property DifficultyIndex Auto Hidden

Formlist Property DoomStones Auto
int _PlayerDoomStoneID
Int Property PlayerDoomStoneID
	int Function Get()
		return _PlayerDoomStoneID
	EndFunction
EndProperty 

RFAB_Origin[] Property Altmer Auto
RFAB_Origin[] Property Argonian Auto
RFAB_Origin[] Property Bosmer Auto
RFAB_Origin[] Property Breton Auto
RFAB_Origin[] Property Dunmer Auto
RFAB_Origin[] Property Imperial Auto
RFAB_Origin[] Property Khajiit Auto
RFAB_Origin[] Property Nord Auto
RFAB_Origin[] Property Orsimer Auto
RFAB_Origin[] Property RedGuard Auto
RFAB_Origin[] Property Common Auto

string FileName = "StartMenu.json"
string SkyUIConfigPath = "Data/Interface/skyui/config.txt"

string[] MenuSettings
Actor Player
string PlayerRace
string[] Races

RFAB_Origin[] CurrentOrigins
int CurrentOriginID = 0

Event OnInit()
	Player = Game.GetPlayer()
	DamageToPlayer = new float[3]
	DamageToPlayer[0] = 50.0 * 0.01
	DamageToPlayer[1] = 100.0 * 0.01
	DamageToPlayer[2] = 200.0 * 0.01
	DamageByPlayer = new float[3]
	DamageByPlayer[0] = 200.0 * 0.01
	DamageByPlayer[1] = 100.0 * 0.01
	DamageByPlayer[2] = 100.0 * 0.01
	DamageWithCurse = 50.0 * 0.01
EndEvent

string Function Open()
	RFAB_PapyrusFunctions.LookAtYourself()
	RegisterForModEvent("RFAB_ChangeOrigin", "OnOriginChange")
	
	PlayerRace = Player.GetRace().GetName()
	CurrentOrigins = GetOrigins()

	MenuSettings = Utility.CreateStringArray(1)
	MenuSettings[0] = PapyrusIniManipulator.PullStringFromIni(SkyUIConfigPath, "Appearance", "colors.text.enabled")
	
	string[] Page1Description = DataSetup(false, "Сложность", "Описание")
	
	string[] Page2Buttons = DataSetup(true, "Камень", "")
	string[] Page2Description = DataSetup(false, "Камень", "Описание")
	string[] Page2Bonus = DataSetup(false, "Камень", "Бонус")
	
	string[] Page3Buttons = DataSetup(true, "Предыстория." + PlayerRace, "")
	string[] Page3CommonButtons = DataSetup(true, "Предыстория.Общие", "")
	Page3Buttons = PushToArray(Page3Buttons, Page3CommonButtons)
	string[] Page3Description = DataSetup(false, "Предыстория." + PlayerRace, "Описание")
	string[] Page3CommonDescription = DataSetup(false, "Предыстория.Общие", "Описание")
	Page3Description = PushToArray(Page3Description, Page3CommonDescription)
	string[] Page3Bonus = DataSetup(false, "Предыстория." + PlayerRace, "Бонус")
	string[] Page3CommonBonus = DataSetup(false, "Предыстория.Общие", "Бонус")
	Page3Bonus = PushToArray(Page3Bonus, Page3CommonBonus)
	
	string Result = ShowMenu(MenuSettings, ReplaceArraysEnters(Page1Description), Page2Buttons, ReplaceArraysEnters(Page2Description), ReplaceArraysEnters(Page2Bonus), Page3Buttons, ReplaceArraysEnters(Page3Description), ReplaceArraysEnters(Page3Bonus))

	if (Result != "")
		PlayerChoice(Result)
	endif
	RFAB_PapyrusFunctions.SetCameraDefaultSettings()
	CurrentOriginID = 0
	UnregisterForAllModEvents()

	return Result
EndFunction

string Function PlayerChoice(string arg1)
	String[] parts = StringUtil.Split(arg1, ",")
	DifficultyIndex = parts[0] as Int
	Cursed = parts[4] == "true"
	UpdateDifficulty()
	
	SetDoomStoneById(parts[1] as Int)
	
	int Page3Choice = parts[2] as Int
	if Page3Choice >= CurrentOrigins.length
		Common[Page3Choice - CurrentOrigins.Length].Choose()
	else
		CurrentOrigins[Page3Choice].Choose()
	endif
EndFunction

Function UpdateDifficulty()
	float _damageByPlayer

	if Cursed
		_damageByPlayer = DamageWithCurse
		Game.SetGameSettingfloat("fDiffMultHPByPCL", DamageWithCurse)
	else
		_damageByPlayer = DamageByPlayer[DifficultyIndex]
		Game.SetGameSettingfloat("fDiffMultHPByPCL", DamageByPlayer[DifficultyIndex])
	endIf

	Game.SetGameSettingFloat("fDiffMultHPByPCVE", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCE", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCN", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCH", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCVH", _damageByPlayer)

	Game.SetGameSettingFloat("fDiffMultHPToPCL", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCVE", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCE", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCN", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCH", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCVH", DamageToPlayer[DifficultyIndex])
EndFunction

Function SetDifficulty(int aiIndex)
	DifficultyIndex = aiIndex
	UpdateDifficulty()
EndFunction

Function SetCurse(bool abCursed)
	Cursed = abCursed
	UpdateDifficulty()
EndFunction

string Function GetDifficultyNameById(int arg1)
    string[] DifficultyNames = DataSetup(true, "Сложность", "")
    return DifficultyNames [arg1]
EndFunction

string[] Function GetDifficultyNames()
    string[] DifficultyNames = DataSetup(true, "Сложность", "")
	return Utility.ResizeStringArray(DifficultyNames, DifficultyNames.Length - 1)
EndFunction

string Function GetDifficultyInfo(int arg1)
    string[] DifficultyInfo = DataSetup(false, "Сложность", "Описание")
    return DifficultyInfo [arg1]
EndFunction

Function SetDoomStoneById(int arg1)
	Player.AddSpell(DoomStones.GetAt(arg1) as Spell)
	RemoveAllDoomStonesExcept(arg1)
	_PlayerDoomStoneID = arg1
EndFunction

Function RemoveAllDoomStonesExcept(int arg1)
    int i = 0
    while i < DoomStones.GetSize()
    	if i != arg1
    		Player.RemoveSpell(DoomStones.GetAt(i) as Spell)
    	endif
    	i += 1
    endwhile
EndFunction

string Function GetDoomStoneNameById(int arg1)
    string[] DoomStoneNames = DataSetup(true, "Камень", "")
	return DoomStoneNames[arg1]
EndFunction

int Function GetDoomStoneIdByName(string arg1)
	string[] DoomStoneNames = DataSetup(true, "Камень в мире", "")
	int i = 0
	while arg1 != DoomStoneNames[i]
    	i += 1
    endwhile
	return i
EndFunction

string[] Function GetDoomStoneNames()
    string[] DoomStoneNames = DataSetup(true, "Камень", "")
	return DoomStoneNames
EndFunction

int Function GetDoomStoneId()
    int i = 0
    while i < DoomStones.GetSize()
    	if Player.HasSpell(DoomStones.GetAt(i) as Spell)
    		return i
    	endif
    	i += 1
    endwhile
    return 13
EndFunction

RFAB_Origin[] Function GetOrigins()
	if (PlayerRace == "Высокий эльф")
           return Altmer
    elseif (PlayerRace == "Аргонианин")
        return Argonian
    elseif (PlayerRace == "Лесной эльф")
        return Bosmer
    elseif (PlayerRace == "Бретонец")
        return Breton
    elseif (PlayerRace == "Темный эльф")
        return Dunmer
    elseif (PlayerRace == "Имперец")
        return Imperial
    elseif (PlayerRace == "Каджит")
        return Khajiit
    elseif (PlayerRace == "Норд")
        return Nord
    elseif (PlayerRace == "Орк")
        return Orsimer
    elseif (PlayerRace == "Редгард")
        return RedGuard
    endif
EndFunction

Event OnOriginChange(string eventName, string strArg, float numArg, Form formArg)
	int iCurrentID = numArg as int
	if iCurrentID != CurrentOriginID
		if iCurrentID >= CurrentOrigins.length
			RFAB_PapyrusFunctions.SetOutfitAndRefresh(Player, Common[iCurrentID - CurrentOrigins.Length].Equipment)
		else
			RFAB_PapyrusFunctions.SetOutfitAndRefresh(Player, CurrentOrigins[iCurrentID].Equipment)
		endif
		CurrentOriginID = iCurrentID
	endif
EndEvent

string[] Function ReplaceArraysEnters(string[] asArray)
	string[] Result = Utility.CreateStringArray(asArray.Length)
	int i = 0
	while i < asArray.Length
		Result[i] = ReplaceEnters(asArray[i])
		i += 1
	endwhile
	return Result
EndFunction

string Function ReplaceEnters(string asString)
	return PapyrusUtil.StringJoin(StringUtil.Split(asString, "|"), "\n") 
EndFunction

string Function ShowMenu(string[] Menu, string[] Description1, string[] Buttons2, string[] Description2, string[] Bonus2, string[] Buttons3, string[] Description3, string[] Bonus3)
	if UI.IsMenuOpen("CustomMenu")
		UI.CloseCustomMenu()
		return ""
	else
		UI.OpenCustomMenu("RFAB_StartMenu", 0)
		UI.Invoke("CustomMenu", "_root.RFAB_StartMenuMC.InitMessageBox")
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetMenu", Menu)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage1Description", Description1)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage2Buttons", Buttons2)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage2Description", Description2)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage2Bonus", Bonus2)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage3Buttons", Buttons3)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage3Description", Description3)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_StartMenuMC.SetPage3Bonus", Bonus3)
		RFAB_PapyrusFunctions.SetOutfitAndRefresh(Player, CurrentOrigins[0].Equipment)
		return GetMenuResult()
	endIf
EndFunction

string Function GetMenuResult()
	while UI.IsMenuOpen("CustomMenu") && UI.GetInt("CustomMenu", "_root.RFAB_StartMenuMC.Status") < 9
		Utility.Wait(0.2)
	endWhile
	if UI.GetInt("CustomMenu", "_root.RFAB_StartMenuMC.Status") == 9
		string result = UI.GetString("CustomMenu", "_root.RFAB_StartMenuMC.MenuResult")
		UI.CloseCustomMenu()
		return result
	else
		UI.CloseCustomMenu()
		return ""
	endif
EndFunction

string[] Function DataSetup(bool arg1, string arg2, string arg3)
	string[] firstKey = JsonUtil.PathStringElements(FileName, "." + arg2 + ".Порядок")
	if (arg1)
		return firstKey
	endIf
	string[] secondKey = Utility.CreateStringArray(firstKey.Length, "")
	int i = 0
	while (i < firstKey.Length)
		secondKey[i] = JsonUtil.GetPathStringValue(FileName, "." + arg2 + "." + firstKey[i] + "." + arg3)
		i += 1
	endWhile
	return secondKey
EndFunction

string[] Function PushToArray(string[] arg1, string[] arg2)
	int i = 0
	while (i < arg2.Length)
		arg1 = PapyrusUtil.PushString(arg1, arg2[i])
		i += 1
	endWhile
	return arg1
EndFunction
