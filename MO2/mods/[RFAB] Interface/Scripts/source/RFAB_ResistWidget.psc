Scriptname RFAB_ResistWidget extends Quest  

import PapyrusIniManipulator

string IniPath = "Data/SKSE/Plugins/[RFAB] ResistWidget.ini"
string Section = "Widget"

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

string[] Property RotationOptions Auto Hidden
int Property RotationOptionID Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Rotation Option")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Rotation Option", aiValue)
		UpdateWidgetOption()
	EndFunction
EndProperty

string[] Property ColorOptions Auto Hidden
int Property ColorOptionID Hidden
	int Function Get()
		return PullIntFromIni(IniPath, Section, "Color Option")
	EndFunction
	Function Set(int aiValue)
		PushIntToIni(IniPath, Section, "Color Option", aiValue)
		UpdateWidgetOption()
	EndFunction
EndProperty

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


Event OnInit()
    RotationOptions = new string[4]
	RotationOptions[0] = "Вертикальный"
	RotationOptions[1] = "Горизонтальный"
	RotationOptions[2] = "Вертикальный, цифры слева"
	RotationOptions[3] = "Горизонтальный, цифры снизу"

	ColorOptions = new string[2]
	ColorOptions[0] = "Цветной"
	ColorOptions[1] = "Не цветной"
EndEvent

Function UpdateWidgetOption()
    int optionID = CalculateOptionID(RotationOptionID, ColorOptionID)
    PushIntToIni(IniPath, Section, "Widget rotation", optionID)
EndFunction

int Function CalculateOptionID(int rotationID, int colorID)
    if colorID == 0 ; Цветной
        if rotationID == 0 ; Вертикальный
            return 2
        elseif rotationID == 1 ; Горизонтальный
            return 3
        elseif rotationID == 2 ; Вертикальный, цифры слева
            return 6
        elseif rotationID == 3 ; Горизонтальный, цифры снизу
            return 7
        endif
    else ; Не цветной
        if rotationID == 0 ; Вертикальный
            return 0
        elseif rotationID == 1 ; Горизонтальный
            return 1
        elseif rotationID == 2 ; Вертикальный, цифры слева
            return 4
        elseif rotationID == 3 ; Горизонтальный, цифры снизу
            return 5
        endif
    endif
EndFunction