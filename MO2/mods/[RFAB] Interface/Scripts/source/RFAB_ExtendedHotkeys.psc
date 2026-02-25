Scriptname RFAB_ExtendedHotkeys extends Quest  

import PapyrusIniManipulator

string IniPath = "Data/SKSE/Plugins/[RFAB] Extended Hotkeys.ini"
string Section = "RFAB Extended Hotkeys"


string[] _SpellPriority
string[] Property SpellPriorities Auto Hidden
int Property SpellPriorityID Hidden
	int Function Get()
		if (PullStringFromIni(IniPath, Section, "Spell priority") == _SpellPriority[0])
			return 0
		else
			return 1
		endif
	EndFunction
	Function Set(int aiValue)
		PushStringToIni(IniPath, Section, "Spell priority", _SpellPriority[aiValue])
	EndFunction
EndProperty

string[] _ScrollPriority
string[] Property ScrollPriorities Auto Hidden
int Property ScrollPriorityID Hidden
	int Function Get()
		if (PullStringFromIni(IniPath, Section, "Scroll priority") == _ScrollPriority[0])
			return 0
		else
			return 1
		endif
	EndFunction
	Function Set(int aiValue)
		PushStringToIni(IniPath, Section, "Scroll priority", _ScrollPriority[aiValue])
	EndFunction
EndProperty

string[] _AllowDualWield
string[] Property AllowDualWield Auto Hidden
int Property AllowDualWieldID Hidden
	int Function Get()
		if (PullStringFromIni(IniPath, Section, "Allow dual wield") == _AllowDualWield[0])
			return 0
		else
			return 1
		endif
	EndFunction
	Function Set(int aiValue)
		PushStringToIni(IniPath, Section, "Allow dual wield", _AllowDualWield[aiValue])
	EndFunction
EndProperty

string[] Property DisallowUnequipShield Auto Hidden
int Property DisallowUnequipShieldID Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Disallow Unequip Shield")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Disallow Unequip Shield", aiValue)
	EndFunction
EndProperty

int Property EmptyHandsHotkey Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Empty hands")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Empty hands", aiValue)
	EndFunction
EndProperty

Event OnInit()
    SpellPriorities = new String[2]
	SpellPriorities[0] = "Слева направо"
	SpellPriorities[1] = "Справа налево"

	ScrollPriorities = new String[2]
	ScrollPriorities[0] = "Слева направо"
	ScrollPriorities[1] = "Справа налево"

	AllowDualWield = new String[2]
	AllowDualWield[0] = "Запрещено"
	AllowDualWield[1] = "Разрешено"

	DisallowUnequipShield = new String[2]
	DisallowUnequipShield[0] = "Снимать щит"
	DisallowUnequipShield[1] = "Не снимать щит"

	_SpellPriority = new String[2]
	_SpellPriority[0] = "Left to right"
	_SpellPriority[1] = "Right to left"

	_ScrollPriority = new String[2]
	_ScrollPriority[0] = "Left to right"
	_ScrollPriority[1] = "Right to left"

	_AllowDualWield = new String[2]
	_AllowDualWield[0] = "False"
	_AllowDualWield[1] = "True"
EndEvent