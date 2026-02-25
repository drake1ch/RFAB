Scriptname RFAB_DoomStoneMenu extends Quest  

Spell[] Property DoomStones Auto

String[] Property DoomStoneNames Auto Hidden
{Для менюшки}
String[] Property StandingStoneNames Auto Hidden
{Для камней в мире}

Actor Player

int _PlayerDoomStoneID
Int Property PlayerDoomStoneID
	int Function Get()
		return _PlayerDoomStoneID
	EndFunction
EndProperty 

string IniPath = "Data/SKSE/Plugins/[RFAB] DoomStones.ini"
string SkyUIConfigPath = "Data/Interface/skyui/config.txt"

Event OnInit()
	DoomStoneNames = new string[14]
    DoomStoneNames[0] = "Воин"
    DoomStoneNames[1] = "Маг"
    DoomStoneNames[2] = "Вор"
    DoomStoneNames[3] = "Змей"
    DoomStoneNames[4] = "Леди"
    DoomStoneNames[5] = "Конь"
    DoomStoneNames[6] = "Лорд"
    DoomStoneNames[7] = "Ученик"
    DoomStoneNames[8] = "Атронах"
    DoomStoneNames[9] = "Ритуал"
    DoomStoneNames[10] = "Любовник"
    DoomStoneNames[11] = "Тень"
    DoomStoneNames[12] = "Башня"
    DoomStoneNames[13] = "Рожден без Камня Хранителя"

	StandingStoneNames = new string[13]
    StandingStoneNames[0] = "Камень Воина"
    StandingStoneNames[1] = "Камень Мага"
    StandingStoneNames[2] = "Камень Вора"
    StandingStoneNames[3] = "Камень Змея"
    StandingStoneNames[4] = "Камень Леди"
    StandingStoneNames[5] = "Камень Коня"
    StandingStoneNames[6] = "Камень Лорда"
    StandingStoneNames[7] = "Камень Ученика"
    StandingStoneNames[8] = "Камень Атронаха"
    StandingStoneNames[9] = "Камень Ритуала"
    StandingStoneNames[10] = "Камень Любовника"
    StandingStoneNames[11] = "Камень Тени"
    StandingStoneNames[12] = "Камень Башни"

    Player = Game.GetPlayer()
EndEvent

int Function Open()
	int	Result = ShowMenu()
	if Result != -1
		SetDoomStoneById(Result)
	endIf
	return Result
EndFunction

int Function GetDoomStoneId()
    int i = 0
    while i < DoomStones.Length
    	if Player.HasSpell(DoomStones[i])
    		return i
    	endif
    	i += 1
    endwhile
    return 13
EndFunction

int Function GetDoomStoneIdByName(string asName)
    int i = 0
    while i < DoomStoneNames.Length
    	if asName == StandingStoneNames[i]
    		return i
    	endif
    	i += 1
    endwhile
    return -1
EndFunction

Function SetDoomStoneById(int aiIndex)
	Player.AddSpell(DoomStones[aiIndex])
	RemoveAllDoomStonesExcept(aiIndex)
	_PlayerDoomStoneID = aiIndex
EndFunction

Function RemoveAllDoomStonesExcept(int aiIndex)
    int i = 0
    while i < DoomStones.Length
    	if i != aiIndex
    		Player.RemoveSpell(DoomStones[i])
    	endif
    	i += 1
    endwhile
EndFunction

string[] Function GetTextsByKey(string asKey)
	string[] Result = Utility.CreateStringArray(DoomStoneNames.Length)
	int i = 0 
	while i < DoomStoneNames.Length
		Result[i] = PapyrusIniManipulator.PullStringFromIni(IniPath, DoomStoneNames[i], asKey)
		i += 1
	endwhile
	return ReplaceArraysEnters(Result)
EndFunction

string Function GetTextByKey(string asDoomStoneName, string asKey)
	string Result = PapyrusIniManipulator.PullStringFromIni(IniPath, asDoomStoneName, asKey)
	return ReplaceEnters(Result)
EndFunction

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

int Function ShowMenu()
	if UI.IsMenuOpen("CustomMenu")
		UI.CloseCustomMenu()
		return -1
	else
		UI.OpenCustomMenu("RFAB_DoomStoneMenu", 0)
		
		String InitParams = PapyrusIniManipulator.PullStringFromIni(SkyUIConfigPath, "Appearance", "colors.text.enabled")

		UI.InvokeString("CustomMenu", "_root.RFAB_MessageBoxMC.InitMessageBox", InitParams)
		UI.Invoke("CustomMenu", "_root.RFAB_MessageBoxMC.SetButtons")
		UI.InvokeStringA("CustomMenu", "_root.RFAB_MessageBoxMC.SetImmersiveText", GetTextsByKey("Immersive"))
		UI.InvokeStringA("CustomMenu", "_root.RFAB_MessageBoxMC.SetBonusText", GetTextsByKey("Bonus"))
		return GetMenuResultId()
	endIf
EndFunction

int Function GetMenuResultId()
	while UI.IsMenuOpen("CustomMenu") && UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") < 9
		Utility.Wait(0.2)
	endWhile
	if UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") == 9
		int result = UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.akCurrentFocusIndex")
		UI.CloseCustomMenu()
		return result
	else
		UI.CloseCustomMenu()
		return -1
	endif
EndFunction