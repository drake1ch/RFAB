Scriptname RFAB_WeaponMagicEquip extends Quest  

import PapyrusIniManipulator

string IniPath = "Data/SKSE/Plugins/[RFAB] Interface.ini"
string Section = "WeaponMagic"

int Property X Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Widget X Position")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Widget X Position", aiValue)
	EndFunction
EndProperty

int Property Y Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Widget Y Position")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Widget Y Position", aiValue)
	EndFunction
EndProperty

int Property Scale Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Widget scale")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Widget scale", aiValue)
	EndFunction
EndProperty

int Property Alpha Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Widget alpha")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Widget alpha", aiValue)
	EndFunction
EndProperty

; ====================================================================================================

int Property X_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section + " Default", "Widget X Position")
	EndFunction
EndProperty

int Property Y_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section + " Default", "Widget Y Position")
	EndFunction
EndProperty

int Property Scale_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section + " Default", "Widget scale")
	EndFunction
EndProperty

int Property Alpha_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section + " Default", "Widget alpha")
	EndFunction
EndProperty