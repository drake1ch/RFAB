Scriptname RFAB_AutoSaveData extends Quest  

import PapyrusIniManipulator

string Property IniPath = "data/skse/plugins/[RFAB] Autosave.ini" AutoReadOnly
string Property Section = "RFAB Autosave" AutoReadOnly
string Property DefaultSection = "RFAB Autosave Default" AutoReadOnly

bool Property EnableAutoSave
	bool Function Get()
		return PullIntFromIni(IniPath, Section, "Enable autosave") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, Section, "Enable autosave", abValue as int)
	EndFunction
EndProperty

bool Property EnableAutoSave_Default
	bool Function Get()
		return PullIntFromIni(IniPath, DefaultSection, "Enable autosave") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, DefaultSection, "Enable autosave", abValue as int)
	EndFunction
EndProperty

bool Property SaveInCombat
	bool Function Get()
		return PullIntFromIni(IniPath, Section, "Save in combat") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, Section, "Save in combat", abValue as int)
	EndFunction
EndProperty

bool Property SaveInCombat_Default
	bool Function Get()
		return PullIntFromIni(IniPath, DefaultSection, "Save in combat") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, DefaultSection, "Save in combat", abValue as int)
	EndFunction
EndProperty

bool Property SaveAfterCombat
	bool Function Get()
		return PullIntFromIni(IniPath, Section, "Save after combat") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, Section, "Save after combat", abValue as int)
	EndFunction
EndProperty

bool Property SaveAfterCombat_Default
	bool Function Get()
		return PullIntFromIni(IniPath, DefaultSection, "Save after combat") as bool
	EndFunction
	Function Set(bool abValue)
		PushIntToIni(IniPath, DefaultSection, "Save after combat", abValue as int)
	EndFunction
EndProperty

int Property MaxAutoSaveCount
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Max autosave count")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Max autosave count", aiValue)
	EndFunction
EndProperty

int Property MaxAutoSaveCount_Default
	int Function Get()
		return PullIntFromIni(IniPath, DefaultSection, "Max autosave count")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, DefaultSection, "Max autosave count", aiValue)
	EndFunction
EndProperty

int Property AutoSavePeriod
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Period for autosave (in seconds)")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Period for autosave (in seconds)", aiValue)
	EndFunction
EndProperty

int Property AutoSavePeriod_Default
	int Function Get()
		return PullIntFromIni(IniPath, DefaultSection, "Period for autosave (in seconds)")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, DefaultSection, "Period for autosave (in seconds)", aiValue)
	EndFunction
EndProperty