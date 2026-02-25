Scriptname RFAB_BA_UniversalShrine extends ObjectReference  

String[] Property GodsList Auto
{
	Акатош
	Зенитар
	Джулианос
	Дибелла
	Кинарет
	Мара
	Аркей
	Стендарр
	Талос
	Ауриэль
	Боэтия
	Мефала
	Ноктюрнал
	Периайт
	Сангвин
	Малакат
	Азура
}

FormList Property BlessingSpells Auto
{
	Должен быть синхронизирован с списком выше
}

string IniPath = "Data/SKSE/Plugins/[RFAB] Blessings.ini"
string SkyUIConfigPath = "Data/Interface/skyui/config.txt"
string[] GodsListUTF

Event OnActivate(ObjectReference akActionRef)
	OpenBlessingMenu()
EndEvent

Function OpenBlessingMenu()
	GodsListUTF = PapyrusIniManipulator.GetIniData(0, IniPath)

	string[] ImmersiveTexts = ReplaceArraysEnters(GetGodsText("Immersive Text"))
	string[] BonusTexts = ReplaceArraysEnters(GetGodsText("Bonus Text"))

	int	Result = BlessingMenu(ImmersiveTexts, BonusTexts)
	if Result != -1
		GiveBlessing(Result)
		RemoveAllBlessingsExcept(Result)
	endIf
Endfunction

string[] Function GetGodsText(string asKey)
	string[] Result = Utility.CreateStringArray(GodsList.Length)
	int i = 0 
	while i < GodsList.Length
		Result[i] = PapyrusIniManipulator.PullStringFromIni(IniPath, GodsList[i], asKey)
		i += 1
	endwhile
	return Result
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
	string[] Array = StringUtil.Split(asString, "|")
	return PapyrusUtil.StringJoin(Array, "\n") 
EndFunction

Function GiveBlessing(int aiIndex)
	Game.GetPlayer().AddSpell(BlessingSpells.GetAt(aiIndex) as Spell)
EndFunction

Function RemoveAllBlessingsExcept(int aiIndex)
    Actor Player = Game.GetPlayer()
    int i = 0
    while i < BlessingSpells.GetSize()
    	if i != aiIndex
    		Player.RemoveSpell(BlessingSpells.GetAt(i) as Spell)
    	endif
    	i += 1
    endwhile
EndFunction

Int Function BlessingMenu(string[] asImmersiveTexts, string[] asBonusTexts)
	if UI.IsMenuOpen("CustomMenu")
		UI.CloseCustomMenu()
		return -1
	else
	
		String InitParams = PapyrusIniManipulator.PullStringFromIni(SkyUIConfigPath, "Appearance", "colors.text.enabled")
	
		UI.OpenCustomMenu("RFAB_BlessingMenu", 0)
		UI.InvokeString("CustomMenu", "_root.RFAB_MessageBoxMC.InitMessageBox", InitParams)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_MessageBoxMC.SetButtons", GodsList)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_MessageBoxMC.SetImmersiveText", asImmersiveTexts)
		UI.InvokeStringA("CustomMenu", "_root.RFAB_MessageBoxMC.SetBonusText", asBonusTexts)
		return BlessingMenuResult()
	endIf
EndFunction

Int Function BlessingMenuResult()
	while UI.IsMenuOpen("CustomMenu") && UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") < 9
		Utility.Wait(0.2)
	endWhile
	if UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") == 9
		Int result = UI.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.akCurrentFocusIndex")
		UI.CloseCustomMenu()
		return result
	else
		UI.CloseCustomMenu()
		return -1
	endIf
EndFunction