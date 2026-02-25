Scriptname RFAB_MCM_CombatDummies extends SKI_ConfigBase  

string Property MENU_JOURNAL = "Journal Menu" AutoReadOnly
string Property MENU_HUD = "HUD Menu" AutoReadOnly

string Property PATH_ROOT = "_root.ConfigPanelFader.configPanel." AutoReadOnly

int Property BUTTON_ESCAPE = 1 AutoReadOnly
int Property BUTTON_TAB = 15 AutoReadOnly

Actor Dummy

string[] Resists
string[] ResistsNames
int[] InputsIDs

RFAB_ConsoleCommands Property ConsoleCommands Auto
Spell Property ResistancesAbility Auto
Spell Property ShoutsResistAbility Auto

Perk Property SettingsPerk Auto

Event OnConfigInit()
	ModName = " RFAB Combat Dummies"
	InitResists()
	Game.GetPlayer().AddPerk(SettingsPerk)
EndEvent

Event OnPageReset(string page)
	if (!Dummy)
		return
	endif

	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("Прочее")
	AddHeaderOption("")
	AddInputOptionST("Name", "Отображаемое имя", Dummy.GetDisplayName())
	AddEmptyOption()
	AddHeaderOption("Сопротивления")
	AddHeaderOption("")
	SetCursorFillMode(TOP_TO_BOTTOM)

	int i = 0
	while (i < Resists.Length)
		InputsIDs[i] = AddInputOption(ResistsNames[i], Dummy.GetActorValue(Resists[i]) as int)
		i += 1
	endwhile

	SetCursorPosition(7)
	AddInputOptionST("Blunt", "Дробящий", ConsoleCommands.GetResistanceTier(Dummy, "Blunt"))
	AddInputOptionST("Slash", "Режущий", ConsoleCommands.GetResistanceTier(Dummy, "Slash"))
	AddInputOptionST("Pierce", "Колющий", ConsoleCommands.GetResistanceTier(Dummy, "Pierce"))
	AddInputOptionST("Shouts", "Ту'ум", RFAB_PapyrusFunctions.GetCustomActorValue(Dummy, "RFAB_KW_BattleShout_Resist") as int)
EndEvent

; ===================================================================================

Function ShowConfig(Actor akDummy)
	Dummy = akDummy
	UI.InvokeString(MENU_HUD, "_global.skse.OpenMenu", MENU_JOURNAL)
	RegisterForMenu(MENU_JOURNAL)
EndFunction

Event OnMenuOpen(string asMenuName)
	UI.Invoke(MENU_JOURNAL, "_root.QuestJournalFader.Menu_mc.ConfigPanelOpen")

	int iModIndex = GetModIndex(ModName)
	OpenModByIndex(iModIndex)
	;OpenPageByIndex(0)

	RegisterForKey(BUTTON_ESCAPE)
	RegisterForKey(BUTTON_TAB)
EndEvent

Event OnMenuClose(string asMenuName)
	Dummy = None
	UnregisterForMenu(MENU_JOURNAL)
	UnregisterForAllKeys()
EndEvent

Event OnKeyDown(int aiKeyCode)
	UI.InvokeString(MENU_HUD, "_global.skse.CloseMenu", MENU_JOURNAL)
EndEvent

Function OpenModByIndex(int aiModIndex)
	int[] iSelection = new int[2]
	iSelection[0] = aiModIndex
	iSelection[1] = 1
	string sPath = PATH_ROOT + "contentHolder.modListPanel.modListFader.list."
	UI.InvokeIntA(MENU_JOURNAL, sPath + "doSetSelectedIndex", iSelection)
	UI.InvokeIntA(MENU_JOURNAL, sPath + "onItemPress", iSelection)
EndFunction

Function OpenPageByIndex(int aiPageIndex)
	int[] iSelection = new int[2]
	iSelection[0] = aiPageIndex
	iSelection[1] = 1
	string sPath = PATH_ROOT + "contentHolder.modListPanel.subListFader.list."
	UI.InvokeIntA(MENU_JOURNAL, sPath + "doSetSelectedIndex", iSelection)
	UI.InvokeIntA(MENU_JOURNAL, sPath + "onItemPress", iSelection)
EndFunction

int Function GetModIndex(string asModName)
	string sListPath = PATH_ROOT + "contentHolder.modListPanel.modListFader.list._entryList."
	int i = 0
	int iLength = UI.GetInt(MENU_JOURNAL, sListPath + "length")
	while (i < iLength)
		string sModName = UI.GetString(MENU_JOURNAL, sListPath + i + ".modName")
		if (sModName == ModName)
			return i
		endif
		i += 1
	endwhile
EndFunction

;

Event OnOptionInputAccept(int aiOption, string asInput)
	int iInputId = InputsIDs.Find(aiOption)
	if (iInputId != -1)		
		Dummy.ForceActorValue(Resists[iInputId], asInput as int)
		SetInputOptionValue(aiOption, Dummy.GetActorValue(Resists[iInputId]) as int)
	endif
EndEvent

State Blunt
	Event OnInputAcceptST(string asInput)
		int iValue = asInput as int
		if (iValue >= 0 && iValue <= 10)
			SetResistance("Variable01", iValue)
			SetInputOptionValueST(iValue)
		endif
	EndEvent
EndState

State Slash
	Event OnInputAcceptST(string asInput)
		int iValue = asInput as int
		if (iValue >= 0 && iValue <= 10)
			SetResistance("Variable02", iValue)
			SetInputOptionValueST(iValue)
		endif
	EndEvent
EndState

State Pierce
	Event OnInputAcceptST(string asInput)
		int iValue = asInput as int
		if (iValue >= 0 && iValue <= 10)
			SetResistance("Variable03", iValue)
			SetInputOptionValueST(iValue)
		endif
	EndEvent
EndState

State Shouts
	Event OnInputAcceptST(string asInput)
		int iValue = asInput as int
		Dummy.RemoveSpell(ShoutsResistAbility)
		ShoutsResistAbility.SetNthEffectMagnitude(0, iValue)
		Dummy.AddSpell(ShoutsResistAbility)
		SetInputOptionValueST(iValue)
	EndEvent
EndState

State Name
	Event OnInputAcceptST(string asInput)
		Dummy.SetDisplayName(asInput)
		SetInputOptionValueST(asInput)
	EndEvent
	Event OnDefaultST()
		string sName = Dummy.GetBaseObject().GetName()
		Dummy.SetDisplayName(sName)
		SetInputOptionValueST(sName)
	EndEvent
EndState

;

Function InitResists()
	Resists = new string[8]
	Resists[0] = "DamageResist"
	Resists[1] = "MagicResist"
	Resists[2] = "FireResist"
	Resists[3] = "FrostResist"
	Resists[4] = "ElectricResist"
	Resists[5] = "AbsorbChance"
	Resists[6] = "PoisonResist"
	Resists[7] = "DiseaseResist"
	ResistsNames = new string[8]
	ResistsNames[0] = "Броня"
	ResistsNames[1] = "Сопротивление магии"
	ResistsNames[2] = "Сопротивление огню"
	ResistsNames[3] = "Сопротивление холоду"
	ResistsNames[4] = "Сопротивление электричеству"
	ResistsNames[5] = "Шанс поглощения заклинаний"
	ResistsNames[6] = "Сопротивление ядам"
	ResistsNames[7] = "Сопротивление болезням"
	InputsIDs = new int[8]
EndFunction

Function SetResistance(string asActorValue, int aiValue)
	Dummy.ForceActorValue(asActorValue, aiValue)
	Dummy.RemoveSpell(ResistancesAbility)
	Dummy.AddSpell(ResistancesAbility)
EndFunction