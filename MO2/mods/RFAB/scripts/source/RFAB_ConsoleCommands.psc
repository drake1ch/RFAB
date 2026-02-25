Scriptname RFAB_ConsoleCommands extends ReferenceAlias  

string Property Console = "Console" AutoReadOnly
int Property Enter = 0x1C AutoReadOnly

Actor Player

int LastCommandID = -1

Event OnInit()
	Player = Game.GetPlayer()
	RegisterForMenu(Console)
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu(Console)  
EndEvent

Event OnMenuOpen(string asMenuName)
	RegisterForKey(Enter)
EndEvent

Event OnMenuClose(string asMenuName)
	UnregisterForAllKeys()
EndEvent

Event OnKeyDown(int aiKey)
	int iCommandID = UI.GetInt(Console, "_global.Console.ConsoleInstance.Commands.length") - 1
	string sUserInput = UI.GetString(Console, "_global.Console.ConsoleInstance.Commands." + iCommandID)

	string sCommand = StringUtil.Split(sUserInput, " ")[0]
	string[] sArguments = StringUtil.Split(StringUtil.SubString(sUserInput, StringUtil.GetLength(sCommand)), " ")

	GoToState(sCommand)
	RunCommand(sArguments)
	GoToState("")
EndEvent

Function RemoveErrorMessage()
	string History = UI.GetString(Console, "_global.Console.ConsoleInstance.CommandHistory.text")
	int i = StringUtil.GetLength(History) - 1
	while i > 0
		i -= 1
		string char = StringUtil.GetNthChar(History, i)
		if StringUtil.AsOrd(char) == 13
			i = -i
		endif
	endwhile
	History = StringUtil.Substring(History, 0, -i + 1)
	UI.SetString(Console, "_global.Console.ConsoleInstance.CommandHistory.text", History)
EndFunction

Function Print(string asText)
	UI.InvokeString(Console, "_global.Console.AddHistory", asText)
EndFunction

Function CommandAccept()
	RemoveErrorMessage()
EndFunction

; Команды ===========================================================================================

Function RunCommand(string[] asArguments)
EndFunction

State GiveExp
	Function RunCommand(string[] asArguments)
		CommandAccept()
		(Quest.GetQuest("RFAB_XP") as RFAB_XP_Handler).ModXP(asArguments[0] as int)
	EndFunction
EndState

State Test
	Function RunCommand(string[] asArguments)
		CommandAccept()
		Weapon Vorpal = PO3_SKSEFunctions.GetFormFromEditorID("RFAB_Weapon_Sword_TestVorpal") as Weapon
		if Player.GetItemCount(Vorpal) == 0
			Player.AddItem(Vorpal)
		endif
		Player.EquipItem(Vorpal)
		(Quest.GetQuest("RFAB_MCM").GetAliasByID(0) as RFAB_MCM_Alias).IsFastTravelAllowed = true
		DbSkseFunctions.ExecuteConsoleCommand("tmm 1")
		Debug.SetGodMode(true)
	EndFunction
EndState

State MacKoy
	Function RunCommand(string[] asArguments)
		CommandAccept()
		RFAB_PapyrusFunctions.ShowQuestNotification("MacKoy красава, а Deja лошара")
	EndFunction
EndState

State Deja
	Function RunCommand(string[] asArguments)
		CommandAccept()
		RFAB_PapyrusFunctions.ShowQuestNotification("MacKoy лошара, а Deja красава")
	EndFunction
EndState

State Smorch
	Function RunCommand(string[] asArguments)
		CommandAccept()
		RFAB_PapyrusFunctions.ShowQuestNotification("Smorch лох наелся блох")
	EndFunction
EndState

State GetResists
	Function RunCommand(string[] asArguments)
		CommandAccept()
		Actor kTarget = Game.GetCurrentConsoleRef() as Actor
		if (kTarget)
			GetResists(kTarget)
		endif
	EndFunction
EndState

; Alias of GetResists
State GR
	Function RunCommand(string[] asArguments)
		CommandAccept()
		Actor kTarget = Game.GetCurrentConsoleRef() as Actor
		if (kTarget)
			GetResists(kTarget)
		endif
	EndFunction
EndState

State Heal
	Function RunCommand(string[] asArguments)
		CommandAccept()
		Actor Target = Game.GetCurrentConsoleRef() as Actor
		if !Target
			return
		endif
		if (asArguments[0] as int) as bool
			Target.RestoreActorValue("Health", Target.GetActorValueMax("Health"))
		endif
		if (asArguments[1] as int) as bool
			Target.RestoreActorValue("Magicka", Target.GetActorValueMax("Magicka"))
		endif
		if (asArguments[2] as int) as bool
			Target.RestoreActorValue("Stamina", Target.GetActorValueMax("Stamina"))
		endif
	EndFunction
EndState

State Push
	Function RunCommand(string[] asArguments)
		CommandAccept()
		ObjectReference kRef = Game.GetCurrentConsoleRef()
		if (kRef)
			MiscUtil.WriteToFile("PushedObjects.txt", GetRefOrBase(kRef) + " " + kRef.GetDisplayName() + "\n")
		endif
	EndFunction
EndState

State Copy
	Function RunCommand(string[] asArguments)
		CommandAccept()
		ObjectReference kRef = Game.GetCurrentConsoleRef()
		if (kRef)
			DbSkseFunctions.SetClipBoardText(GetRefOrBase(kRef))
		endif
	EndFunction
EndState

;

Function GetResists(Actor akTarget)
	string sBody = akTarget.GetDisplayName() + "\n\nСопротивления:\n| "
	sBody += GetAvInfo(akTarget, "Броня", "DamageResist") + " |\n| "
	sBody += GetResistanceTierInfo(akTarget, "Дробящий", "Blunt") + " | "
	sBody += GetResistanceTierInfo(akTarget, "Колющий", "Pierce") + " | "
	sBody += GetResistanceTierInfo(akTarget, "Режущий", "Slash") + " |\n| "
	sBody += GetAvInfo(akTarget, "Яд", "PoisonResist") + "% | "
	sBody += GetAvInfo(akTarget, "Болезнь", "DiseaseResist") + "% | "
	sBody += GetAvInfo(akTarget, "Поглощение заклинаний", "AbsorbChance") + "% |\n| "
	sBody += GetAvInfo(akTarget, "Магия", "MagicResist") + "% | "
	sBody += GetAvInfo(akTarget, "Огонь", "FireResist") + "% | "
	sBody += GetAvInfo(akTarget, "Холод", "FrostResist") + "% | "
	sBody += GetAvInfo(akTarget, "Электричество", "ElectricResist") + "% |\n| "
	sBody += GetAvInfo(akTarget, "Устойчивость", "HeavyArmorSkillAdvance")  + "% | "
	sBody += GetAvInfo(akTarget, "Стрелы и болты", "SpeechcraftSkillAdvance")  + "% | "
	sBody += GetCustomAvInfo(akTarget, "Ту'ум", "RFAB_KW_BattleShout_Resist")  + "% |"
	sBody += "\n\nРегенерация:\n| "
	sBody += GetRegenInfo(akTarget, "Здоровье", "Health", "HealRate", "HealRateMult") + " |\n| "
	sBody += GetRegenInfo(akTarget, "Запас сил", "Stamina", "StaminaRate", "StaminaRateMult") + " |\n| "
	sBody += GetRegenInfo(akTarget, "Магия", "Magicka", "MagickaRate", "MagickaRateMult") + " |"
	SkyMessage.Show(sBody, "OK")
EndFunction

Form Function GetRefOrBase(ObjectReference akRef)
	if (PO3_SKSEFunctions.IsGeneratedForm(akRef))
		return akRef.GetBaseObject()
	else
		return akRef
	endif
EndFunction

string Function GetRegenInfo(Actor akActor, string asStatName, string asAV, string asAVRate, string asAVRateMult)
	float fNumeric = 0.0
	float fPercent = akActor.GetActorValue(asAVRate) * akActor.GetActorValue(asAVRateMult) / 100.0
	if asStatName == "Здоровье"
		fNumeric = RFAB_PapyrusFunctions.GetActorNumericHealthRegen(akActor)
	elseif asStatName == "Запас сил"
		fNumeric = RFAB_PapyrusFunctions.GetActorNumericStaminaRegen(akActor)
	elseif asStatName == "Магия"
		fNumeric = RFAB_PapyrusFunctions.GetActorNumericMagickaRegen(akActor)
	endif
	float fTotal = akActor.GetActorValueMax(asAV) * fPercent / 100.0 + fNumeric

	return asStatName + " " \
		+ NormalizeFloat(fNumeric) + " ед. + " \
		+ NormalizeFloat(fPercent) + "% = " \
		+ NormalizeFloat(fTotal)
EndFunction

string Function GetResistanceTierInfo(Actor akActor, string asResistanceName, string asResistanceEditorIdName)
	return asResistanceName + " " + GetResistanceTier(akActor, asResistanceEditorIdName)
EndFunction

string Function GetAvInfo(Actor akActor, string asStatName, string asActorValue)
	return asStatName + " " +(akActor.GetActorValue(asActorValue) as int)
EndFunction

string Function GetCustomAvInfo(Actor akActor, string asStatName, string asActorValue)
	return asStatName + " " + (RFAB_PapyrusFunctions.GetCustomActorValue(akActor, asActorValue) as int)
EndFunction

;

string Function NormalizeFloat(float afValue)
	int iWhole = afValue as int
	int iFraction = (afValue * 100) as int - (iWhole * 100)
	
	return iWhole + "." + iFraction
EndFunction

int Function GetResistanceTier(Actor akActor, string asResistanceEditorIdName)
	int i = 10
	while (i > 0)
		Keyword kTier = Keyword.GetKeyword("RFAB_KW_Armor_Resistance_" + asResistanceEditorIdName + "_Tier" + i)

		if (kTier)
			if (akActor.HasKeyword(kTier) \
				|| akActor.HasMagicEffectWithKeyword(kTier) \
				|| akActor.GetEquippedArmorInSlot(32).HasKeyword(kTier))
				return i
			endif
		endif
		i -= 1
	endwhile

	return 0
EndFunction
