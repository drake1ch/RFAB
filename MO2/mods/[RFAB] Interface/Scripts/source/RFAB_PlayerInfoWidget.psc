Scriptname RFAB_PlayerInfoWidget extends Quest  

import PapyrusIniManipulator

string IniPath = "Data/SKSE/Plugins/[RFAB] Interface.ini"

int Property SectionID = 0 Auto Hidden
string[] Property Sections Auto Hidden
string[] _Sections

int Property X Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID], "Widget X Position")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, _Sections[SectionID], "Widget X Position", aiValue)
	EndFunction
EndProperty

int Property Y Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID], "Widget Y Position")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, _Sections[SectionID], "Widget Y Position", aiValue)
	EndFunction
EndProperty

int Property Scale Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID], "Widget scale")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, _Sections[SectionID], "Widget scale", aiValue)
	EndFunction
EndProperty

int Property Alpha Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID], "Widget alpha")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, _Sections[SectionID], "Widget alpha", aiValue)
	EndFunction
EndProperty

; ====================================================================================================

int Property X_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID] + " Default", "Widget X Position")
	EndFunction
EndProperty

int Property Y_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID] + " Default", "Widget Y Position")
	EndFunction
EndProperty

int Property Scale_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID] + " Default", "Widget scale")
	EndFunction
EndProperty

int Property Alpha_Default Hidden
	int Function Get()
		return PullIntFromIni(IniPath, _Sections[SectionID] + " Default", "Widget alpha")
	EndFunction
EndProperty

Event OnInit()
    Sections = new string[6]
    Sections[0] = "Весь виджет"
    Sections[1] = "Статус боя"
    Sections[2] = "Уровень"
    Sections[3] = "Игровое время"
    Sections[4] = "Переносимый вес"
    Sections[5] = "Золото"

    _Sections = new string[6]
    _Sections[0] = "Global"
    _Sections[1] = "Combat Status"
    _Sections[2] = "Level"
    _Sections[3] = "Clock"
    _Sections[4] = "Weight"
    _Sections[5] = "Gold"
EndEvent