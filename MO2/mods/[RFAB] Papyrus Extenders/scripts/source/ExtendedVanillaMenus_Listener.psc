Scriptname ExtendedVanillaMenus_Listener extends ObjectReference 

String Property SnapToSearchMenuTarget Auto
string[]  Property keyCodeCharacters Auto

Event OnInit() 
    ;Debug.Notification("EVM_Listener Attached to " + Self.GetDisplayName())
    RegisterEvents()
EndEvent

Function RegisterEvents() 
    RegisterForModEvent("ExtendedVanillaMenus_Copy", "OnExtendedVanillaMenus_Copy")
    RegisterForModEvent("ExtendedVanillaMenus_Paste", "OnExtendedVanillaMenus_Paste")
    ;RegisterForModEvent("ExtendedVanillaMenus_Debug", "OnExtendedVanillaMenus_Debug")
    UnRegisterForModEvent("ExtendedVanillaMenus_Debug") ;only used during development.
    Debug.Notification("evm listener registered events")
EndFunction

Event OnExtendedVanillaMenus_Copy(string a_eventName, string a_strArg, float a_numArg, form a_sender)
    JsonUtil.SetStringValue("../ExtendedVanillaMenus/EVM_Data.json", "CopiedText", a_strArg)
    JsonUtil.Save("../ExtendedVanillaMenus/EVM_Data.json")
    
    If DbSkseFunctions.GetVersion() >= 4.6 
        DbSkseFunctions.SetClipBoardText(a_strArg)
    Endif
    ;dbMiscFunctions.PrintN("EVM Copy:", a_strArg)
EndEvent

Event OnExtendedVanillaMenus_Paste(string a_eventName, string a_strArg, float a_numArg, form a_sender)
    If DbSkseFunctions.GetVersion() >= 4.6 
        UI.InvokeString("CustomMenu", "_root.EVMTextInput_MC.PastePapyrus", DbSkseFunctions.GetClipBoardText())
    Else 
        UI.InvokeString("CustomMenu", "_root.EVMTextInput_MC.PastePapyrus", a_strArg) ;a_strArg is flash saved copied text
    Endif
    ;dbMiscFunctions.PrintN("EVM Paste:", a_strArg)
EndEvent

Event OnExtendedVanillaMenus_Debug(string a_eventName, string a_strArg, float a_numArg, form a_sender)
    ; if a_numArg == 0 
    ;     debug.trace(a_strArg)
    ; Elseif a_numArg == 1
    ;     debug.notification(a_strArg)
    ; Elseif a_numArg == 2
    ;     debug.MessageBox(a_strArg)
    ; Endif
Endevent

Function SetKeyCodeCharacterStrings_old()
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt")

    keyCodeCharacters = Utility.CreateStringArray(74)
    keyCodeCharacters[2] = DbMiscFunctions.GetStringFromFile("[2]", Settings, Default = "1")
    keyCodeCharacters[3] = DbMiscFunctions.GetStringFromFile("[3]", Settings, Default = "2")
    keyCodeCharacters[4] = DbMiscFunctions.GetStringFromFile("[4]", Settings, Default = "3")
    keyCodeCharacters[5] = DbMiscFunctions.GetStringFromFile("[5]", Settings, Default = "4")
    keyCodeCharacters[6] = DbMiscFunctions.GetStringFromFile("[6]", Settings, Default = "5")
    keyCodeCharacters[7] = DbMiscFunctions.GetStringFromFile("[7]", Settings, Default = "6")
    keyCodeCharacters[8] = DbMiscFunctions.GetStringFromFile("[8]", Settings, Default = "7")
    keyCodeCharacters[9] = DbMiscFunctions.GetStringFromFile("[9]", Settings, Default = "8")
    keyCodeCharacters[10] = DbMiscFunctions.GetStringFromFile("[10]", Settings, Default = "9")
    keyCodeCharacters[11] = DbMiscFunctions.GetStringFromFile("[11]", Settings, Default = "0")
    keyCodeCharacters[12] = DbMiscFunctions.GetStringFromFile("[12]", Settings, Default = "-")
    keyCodeCharacters[13] = DbMiscFunctions.GetStringFromFile("[13]", Settings, Default = "=")
    keyCodeCharacters[16] = DbMiscFunctions.GetStringFromFile("[16]", Settings, Default = "Q")
    keyCodeCharacters[17] = DbMiscFunctions.GetStringFromFile("[17]", Settings, Default = "W")
    keyCodeCharacters[18] = DbMiscFunctions.GetStringFromFile("[18]", Settings, Default = "E")
    keyCodeCharacters[19] = DbMiscFunctions.GetStringFromFile("[19]", Settings, Default = "R")
    keyCodeCharacters[20] = DbMiscFunctions.GetStringFromFile("[20]", Settings, Default = "T")
    keyCodeCharacters[21] = DbMiscFunctions.GetStringFromFile("[21]", Settings, Default = "Y")
    keyCodeCharacters[22] = DbMiscFunctions.GetStringFromFile("[22]", Settings, Default = "U")
    keyCodeCharacters[23] = DbMiscFunctions.GetStringFromFile("[23]", Settings, Default = "I")
    keyCodeCharacters[24] = DbMiscFunctions.GetStringFromFile("[24]", Settings, Default = "O")
    keyCodeCharacters[25] = DbMiscFunctions.GetStringFromFile("[25]", Settings, Default = "P")
    keyCodeCharacters[26] = DbMiscFunctions.GetStringFromFile("[26]", Settings, Default = "[")
    keyCodeCharacters[27] = DbMiscFunctions.GetStringFromFile("[27]", Settings, Default = "]")
    keyCodeCharacters[30] = DbMiscFunctions.GetStringFromFile("[30]", Settings, Default = "A")
    keyCodeCharacters[31] = DbMiscFunctions.GetStringFromFile("[31]", Settings, Default = "S")
    keyCodeCharacters[32] = DbMiscFunctions.GetStringFromFile("[32]", Settings, Default = "D")
    keyCodeCharacters[33] = DbMiscFunctions.GetStringFromFile("[33]", Settings, Default = "F")
    keyCodeCharacters[34] = DbMiscFunctions.GetStringFromFile("[34]", Settings, Default = "G")
    keyCodeCharacters[35] = DbMiscFunctions.GetStringFromFile("[35]", Settings, Default = "H")
    keyCodeCharacters[36] = DbMiscFunctions.GetStringFromFile("[36]", Settings, Default = "J")
    keyCodeCharacters[37] = DbMiscFunctions.GetStringFromFile("[37]", Settings, Default = "K")
    keyCodeCharacters[38] = DbMiscFunctions.GetStringFromFile("[38]", Settings, Default = "L")
    keyCodeCharacters[39] = DbMiscFunctions.GetStringFromFile("[39]", Settings, Default = ";")
    keyCodeCharacters[40] = DbMiscFunctions.GetStringFromFile("[40]", Settings, Default = "'")
    keyCodeCharacters[43] = DbMiscFunctions.GetStringFromFile("[43]", Settings, Default = "\\")
    keyCodeCharacters[44] = DbMiscFunctions.GetStringFromFile("[44]", Settings, Default = "Z")
    keyCodeCharacters[45] = DbMiscFunctions.GetStringFromFile("[45]", Settings, Default = "X")
    keyCodeCharacters[46] = DbMiscFunctions.GetStringFromFile("[46]", Settings, Default = "C")
    keyCodeCharacters[47] = DbMiscFunctions.GetStringFromFile("[47]", Settings, Default = "V")
    keyCodeCharacters[48] = DbMiscFunctions.GetStringFromFile("[48]", Settings, Default = "B")
    keyCodeCharacters[49] = DbMiscFunctions.GetStringFromFile("[49]", Settings, Default = "N")
    keyCodeCharacters[50] = DbMiscFunctions.GetStringFromFile("[50]", Settings, Default = "M")
    keyCodeCharacters[51] = DbMiscFunctions.GetStringFromFile("[51]", Settings, Default = ",")
    keyCodeCharacters[52] = DbMiscFunctions.GetStringFromFile("[52]", Settings, Default = ".")
    keyCodeCharacters[53] = DbMiscFunctions.GetStringFromFile("[53]", Settings, Default = "/")
    keyCodeCharacters[57] = DbMiscFunctions.GetStringFromFile("[57]", Settings, Default = " ")
    keyCodeCharacters[82] = DbMiscFunctions.GetStringFromFile("[82]", Settings, Default = "0")
    keyCodeCharacters[79] = DbMiscFunctions.GetStringFromFile("[79]", Settings, Default = "1")
    keyCodeCharacters[80] = DbMiscFunctions.GetStringFromFile("[80]", Settings, Default = "2")
    keyCodeCharacters[81] = DbMiscFunctions.GetStringFromFile("[81]", Settings, Default = "3")
    keyCodeCharacters[75] = DbMiscFunctions.GetStringFromFile("[75]", Settings, Default = "4")
    keyCodeCharacters[76] = DbMiscFunctions.GetStringFromFile("[76]", Settings, Default = "5")
    keyCodeCharacters[77] = DbMiscFunctions.GetStringFromFile("[77]", Settings, Default = "6")
    keyCodeCharacters[71] = DbMiscFunctions.GetStringFromFile("[71]", Settings, Default = "7")
    keyCodeCharacters[72] = DbMiscFunctions.GetStringFromFile("[72]", Settings, Default = "8")
    keyCodeCharacters[73] = DbMiscFunctions.GetStringFromFile("[73]", Settings, Default = "9")
    
EndFunction

function ShowkeyCodeCharacters()
    int i = 0 
    string s
    While i < keyCodeCharacters.length 
        if (keyCodeCharacters[i] != "")
            s += ("[" + i + "] " + " [" + keyCodeCharacters[i] + "]\n")
        endif
        i += 1
    EndWhile 

    ExtendedVanillaMenus.MessageBox(s)
EndFunction

function SetKeyCodeCharacterStrings()
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt")
    int dxStart = StringUtil.Find(Settings, "(dxScanCodesStart)")
    if dxStart == -1
        return;
    endif

    int dxEnd = StringUtil.Find(Settings, "(dxScanCodesEnd)")
    if dxEnd == -1 || dxEnd <= dxStart
        return;
    endif

    Settings = StringUtil.SubString(Settings, dxStart, (dxEnd - dxStart))

    string[] lines = Stringutil.Split(Settings, "\n")
    int m = lines.length
    int numberOfDxCodes = -1
    string value = "";
    while (numberOfDxCodes == -1 || value == "") && m > 0
        m -= 1
        numberOfDxCodes = GetDxCodeFromSettingsStringLine(lines[m])
        if (numberOfDxCodes != -1)
            value = DbMiscFunctions.GetStringFromFile("(" + numberOfDxCodes + ")", lines[m], startKey = "(", endKey = ")", Default = "")
        Endif
    EndWhile

    if (numberOfDxCodes == -1 || value == "")
        return 
    Endif

    keyCodeCharacters = Utility.CreateStringArray(numberOfDxCodes + 1) 

    keyCodeCharacters[numberOfDxCodes] = value 

    int i = 1
    while i < m 
        int dxCode = GetDxCodeFromSettingsStringLine(lines[i])
        if (dxCode > -1)
            value = DbMiscFunctions.GetStringFromFile("(" + dxCode + ")", lines[i], startKey = "(", endKey = ")", Default = "")
            keyCodeCharacters[dxCode] = value
        endif
        i += 1
    EndWhile

    ;ShowkeyCodeCharacters()
EndFunction

int function GetDxCodeFromSettingsStringLine(string line)
    int i = StringUtil.Find(line, "(", 0)

    If i > -1
        i += 1
        int End = StringUtil.Find(line, ")", i)
        If End > -1 
            Return ( StringUtil.SubString(line, i, (End - i)) ) as int
        Endif 
    Endif 

    return -1
EndFunction 

Function RegisterAllKeys(Bool register)
    if register 
        SetKeyCodeCharacterStrings()
        int i = 0 
        while i < keyCodeCharacters.length 
            if keyCodeCharacters[i] != ""
                registerForKey(i)
            endif 
            i += 1
        EndWhile
    Else 
        unregisterForAllKeys()
        keyCodeCharacters = new string[1]
    Endif
EndFunction

Event OnKeyDown(int keyCode)
    if !UI.IsMenuOpen("CustomMenu") 
        RegisterAllKeys(false)

    elseif keyCode < 74 
        UI.InvokeString("CustomMenu", SnapToSearchMenuTarget, keyCodeCharacters[keyCode])
        ;debug.notification("key char = " + keyCodeCharacters[keyCode])
    Endif
EndEvent

