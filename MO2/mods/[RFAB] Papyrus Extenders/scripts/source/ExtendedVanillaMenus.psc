Scriptname ExtendedVanillaMenus Hidden
    
int Function ColorPicker(Int InitialColor = 16711680, String TitleText = "", String InfoText = "", String AcceptText = "$Accept", String CancelText = "$Cancel", Bool WaitForResult = true) Global
    If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()
    Endif 
    
    Int[] HSL = DbColorFunctions.ColorIntToHSL(InitialColor)
    
    UI.OpenCustomMenu("EVM_ColorPicker") ;
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    String[] InitParams = New String[16] 
    InitParams[0] = HSL[0] as float
    InitParams[1] = HSL[1] as Float 
    InitParams[2] = HSL[2] as Float
    InitParams[3] = TitleText
    InitParams[4] = InfoText
    InitParams[5] = AcceptText
    InitParams[6] = CancelText
    InitParams[7] = WaitForResult as int
    InitParams[8] = Game.UsingGamepad() as int
    InitParams[9] = DbMiscFunctions.GetIntFromFile("[Enter]", Settings, Default = 28)
    InitParams[10] = DbMiscFunctions.GetIntFromFile("[Escape]", Settings, Default = 1)
    InitParams[11] = DbMiscFunctions.GetIntFromFile("[Tab]", Settings, Default = 15)
    InitParams[12] = DbMiscFunctions.GetIntFromFile("[Right Shift]", Settings, Default = 54)
    InitParams[13] = DbMiscFunctions.GetIntFromFile("[Left Shift]", Settings, Default = 42)
    InitParams[14] = DbMiscFunctions.GetIntFromFile("[Gamepad A]", Settings, Default = 276)
    InitParams[15] = DbMiscFunctions.GetIntFromFile("[Gamepad B]", Settings, Default = 277)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVM_ColorPickerMC.Status") == 0) ;wait for flash to load menu 
        ;;Utility.WaitMenuMode(0.1) 
    EndWhile 
   
    UI.InvokeStringA("CustomMenu", "_root.EVM_ColorPickerMC.InitColorPicker", InitParams)
    
    If WaitForResult 
        return GetColorPickerResult()
    Endif
EndFunction

;only returns new color if called while the Color Picker menu is already open.
int Function GetColorPickerResult() Global
    ;Debug.Notification("Status = " + (UI.GetInt("CustomMenu", "_root.SkyrimColorPicker_MC.Status")))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVM_ColorPickerMC.Status") == 1) ;wait for user to accept or cancel new color.
        ;Utility.WaitMenuMode(0.1)
    EndWhile 
    
    ;Debug.Notification("Status = " + (UI.GetInt("CustomMenu", "_root.SkyrimColorPicker_MC.Status")))
    
    Int ReturnColorInt = -1
    
    If UI.GetInt("CustomMenu", "_root.EVM_ColorPickerMC.Status") == 2 ;user accepted new value 
        ReturnColorInt = UI.GetInt("CustomMenu", "_root.EVM_ColorPickerMC.ColorInt")
    Endif 
    
    UI.CloseCustomMenu()
    
    return ReturnColorInt
EndFunction

float function SliderMenu(String SliderParam, Float InitialValue, String TitleText = "", String AcceptText = "$Accept", String CancelText = "$Cancel", Bool WaitForResult = true) Global    
    If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
    
    String[] SliderParamsA = New String[1]
    SliderParamsA[0] = SliderParam
    
    Float[] InitialValueA = New Float[1]
    InitialValueA[0] = InitialValue
    
    Float[] ReturnFloatA = SliderMenuMult(SliderParamsA, InitialValueA, TitleText, AcceptText, CancelText, WaitForResult)
    return ReturnFloatA[0]
EndFunction

String Function SliderParamsToString(string SliderID = "MenuSlider0", string SliderText = "", String InfoText = "", float Minimum = 0.0, float Maximum = 100.0, float Interval = 1.0, int DecimalPlaces = 0) Global
    return (SliderID + "||" + SliderText + "||" + InfoText + "||" + Minimum + "||" + Maximum + "||" + Interval + "||" + DecimalPlaces) as string
EndFunction

float[] function SliderMenuMult(String[] SliderParams, Float[] InitialValues, String TitleText = "", String AcceptText = "$Accept", String CancelText = "$Cancel", Bool WaitForResult = true) Global    
    if SliderParams.length == 0
		InitialValues
	endif
	
	If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
    
    UI.OpenCustomMenu("EVM_SliderMenu") ;
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status") == 0) ;wait for flash to load menu 
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    String[] InitParams = New String[12] 
   
    InitParams[0] = TitleText
    InitParams[1] = AcceptText
    InitParams[2] = CancelText
    InitParams[3] = WaitForResult as int
    InitParams[4] = Game.UsingGamepad() as int
    InitParams[5] = DbMiscFunctions.GetIntFromFile("[Enter]", Settings, Default = 28)
    InitParams[6] = DbMiscFunctions.GetIntFromFile("[Escape]", Settings, Default = 1)
    InitParams[7] = DbMiscFunctions.GetIntFromFile("[Tab]", Settings, Default = 15)
    InitParams[8] = DbMiscFunctions.GetIntFromFile("[Right Shift]", Settings, Default = 54)
    InitParams[9] = DbMiscFunctions.GetIntFromFile("[Left Shift]", Settings, Default = 42)
    InitParams[10] = DbMiscFunctions.GetIntFromFile("[Gamepad A]", Settings, Default = 276)
    InitParams[11] = DbMiscFunctions.GetIntFromFile("[Gamepad B]", Settings, Default = 277)
    
    UI.InvokeStringA("CustomMenu", "_root.EVMSliderMenu_MC.InitSliderMenu", InitParams)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status") == 1) ;wait for flash to finish last function call
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    UI.InvokeStringA("CustomMenu", "_root.EVMSliderMenu_MC.SetSliders", SliderParams)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status") == 2) ;wait for flash to finish last function call
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    UI.InvokeFloatA("CustomMenu", "_root.EVMSliderMenu_MC.SetSliderValues", InitialValues) 
    
    If WaitForResult 
        return GetSliderMenuMultResult(SliderParams.length, InitialValues)
    Endif
EndFunction

Float[] Function GetSliderMenuMultResult(int NumOfSliders, Float[] ReturnValues) Global
    
   ; Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status") < 9) ;wait for user to accept or cancel
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status"))
    
    If UI.GetInt("CustomMenu", "_root.EVMSliderMenu_MC.Status") == 9 ;user accepted new value 
        String ReturnString = UI.GetString("CustomMenu", "_root.EVMSliderMenu_MC.SliderResultString")
        Float[] NewValues = DbMiscFunctions.SplitAsFloat(ReturnString, NumOfSliders)
        if NewValues.length == ReturnValues.length 
            ReturnValues = NewValues 
        Endif
    Endif 
    
    UI.CloseCustomMenu()
    
    return ReturnValues
EndFunction

;For Align, 0 = left, 1 = center, 2 = right
Int Function MessageBox(String sMessage, String[] Buttons = none, Bool CancelIsFirstButton = true, Int FontSize = 22, Int Align = 1, Bool html = true, Bool WaitForResult = true) Global 
    If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
   
    String[] Button = new String[1] 
    Button[0] = "$Ok"
    
    UI.OpenCustomMenu("EVM_messagebox")
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVM_MessageBoxMC.Status") == 0) ;wait for flash to load menu 
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    String[] InitParams = new String[13] 
    InitParams[0] = sMessage
    InitParams[1] = CancelIsFirstButton as int
    InitParams[2] = WaitForResult as int
    InitParams[3] = DbMiscFunctions.GetIntFromFile("[Enter]", Settings, Default = 28)
    InitParams[4] = DbMiscFunctions.GetIntFromFile("[Escape]", Settings, Default = 1)
    InitParams[5] = DbMiscFunctions.GetIntFromFile("[Tab]", Settings, Default = 15)
    InitParams[6] = DbMiscFunctions.GetIntFromFile("[Right Shift]", Settings, Default = 54)
    InitParams[7] = DbMiscFunctions.GetIntFromFile("[Left Shift]", Settings, Default = 42)
    InitParams[8] = DbMiscFunctions.GetIntFromFile("[Gamepad A]", Settings, Default = 276)
    InitParams[9] = DbMiscFunctions.GetIntFromFile("[Gamepad B]", Settings, Default = 277)
    InitParams[10] = FontSize
    InitParams[11] = Align
    InitParams[12] = html as int
    
    UI.InvokeStringA("CustomMenu", "_root.EVM_MessageBoxMC.InitMessageBox", InitParams) 
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVM_MessageBoxMC.Status") == 1) ;wait for last flash function to finish.
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    if Buttons == none || Buttons.length < 1
        UI.InvokeStringA("CustomMenu", "_root.EVM_MessageBoxMC.SetButtons", Button) 
    else 
        UI.InvokeStringA("CustomMenu", "_root.EVM_MessageBoxMC.SetButtons", Buttons)
    endif
    
    If WaitForResult
        return  GetEVMMMessageBoxResult()
    Endif
EndFunction

Int Function GetEVMMMessageBoxResult() Global
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVM_MessageBoxMC.Status") < 9) ;wait for user to accept or cancel
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;int result = UI.GetInt("CustomMenu", "_root.EVM_MessageBoxMC.akCurrentFocusIndex")
    int result = UI.GetInt("CustomMenu", "_root.EVM_MessageBoxMC.akCurrentFocusIndex")
    
    UI.CloseCustomMenu()
    
    return result
EndFunction

;For Align, 0 = left, 1 = center, 2 = right
String Function TextInput(String Title = "", String InitialText = "", String AcceptText = "$Accept", String CancelText = "$Cancel", int Width = 414, int Height = 204, \
                          int X = 640, int Y = 360, Int ButtonAlpha = 100, Int BackgroundAlpha = 100, Int TextFieldAlpha = 100, Int TextColor = 0, Int TextBackgroundColor = 7368816,\
                          Bool ShowTextBackground = true, Bool MultiLine = true, Int Align = 1, Int FontSize = 24, Bool WaitForResult = true) Global 
         
    JsonUtil.load("../ExtendedVanillaMenus/EVM_Data.json")
       
    CheckForEVMListener()
    
    If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
    
    UI.OpenCustomMenu("EVM_TextInput")
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    
    String[] InitParams = new String[35] 
    InitParams[0] = Title
    InitParams[1] = InitialText + " "
    InitParams[2] = AcceptText
    InitParams[3] = CancelText
    InitParams[4] = Width
    InitParams[5] = Height
    InitParams[6] = X
    InitParams[7] = Y
    InitParams[8] = BackgroundAlpha
    InitParams[9] = TextFieldAlpha
    InitParams[10] = "0x" + DbMiscFunctions.ConvertIntToHex(TextColor)
    InitParams[11] = "0x" + DbMiscFunctions.ConvertIntToHex(TextBackgroundColor)
    InitParams[12] = ShowTextBackground as int
    InitParams[13] = MultiLine as int
    InitParams[14] = WaitForResult as int
    InitParams[15] = Game.UsingGamepad() as int 
    InitParams[16] = DbMiscFunctions.GetIntFromFile("[Enter]", Settings, Default = 28)
    InitParams[17] = DbMiscFunctions.GetIntFromFile("[Escape]", Settings, Default = 1)
    InitParams[18] = DbMiscFunctions.GetIntFromFile("[Tab]", Settings, Default = 15)
    InitParams[19] = DbMiscFunctions.GetIntFromFile("[Right Shift]", Settings, Default = 54)
    InitParams[20] = DbMiscFunctions.GetIntFromFile("[Left Shift]", Settings, Default = 42)
    InitParams[21] = DbMiscFunctions.GetIntFromFile("[Right Ctrl]", Settings, Default = 157)
    InitParams[22] = DbMiscFunctions.GetIntFromFile("[Left Ctrl]", Settings, Default = 29)
    InitParams[23] = DbMiscFunctions.GetIntFromFile("[A]", Settings, Default = 30)
    InitParams[24] = DbMiscFunctions.GetIntFromFile("[C]", Settings, Default = 46)
    InitParams[25] = DbMiscFunctions.GetIntFromFile("[V]", Settings, Default = 47)
    InitParams[26] = DbMiscFunctions.GetIntFromFile("[X]", Settings, Default = 45)
    InitParams[27] = DbMiscFunctions.GetIntFromFile("[Z]", Settings, Default = 44)
    InitParams[28] = DbMiscFunctions.GetIntFromFile("[Y]", Settings, Default = 21)
    InitParams[29] = DbMiscFunctions.GetIntFromFile("[Gamepad A]", Settings, Default = 276)
    InitParams[30] = DbMiscFunctions.GetIntFromFile("[Gamepad B]", Settings, Default = 277)
    
    InitParams[31] = JsonUtil.GetStringValue("../ExtendedVanillaMenus/EVM_Data.json", "CopiedText")
    InitParams[32] = Align
    InitParams[33] = FontSize
    InitParams[34] = ButtonAlpha
    
    ;Debug.notification("JsonUtil = " + InitParams[29])
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTextInput_MC.Status") == 0) ;wait for flash to load menu 
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    input.tapKey(DbMiscFunctions.GetIntFromFile("[Backspace]", Settings, Default = 14)) ;set's the caret to correct position, and active.
    
    UI.InvokeStringA("CustomMenu", "_root.EVMTextInput_MC.initTextInput", InitParams) 
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTextInput_MC.Status") == 1) ;wait for last flash function to finish.
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    If WaitForResult
        return  GetTextInputResult()
    Endif
EndFunction

String Function GetTextInputResult() Global
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTextInput_MC.Status") < 9) ;wait for user to accept or cancel
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    String Result = "EVM_TextInput_Cancelled"
    
    if UI.GetInt("CustomMenu", "_root.EVMTextInput_MC.Status") == 9
        ;Debug.Notification("Text Accepted")
        result = UI.GetString("CustomMenu", "_root.EVMTextInput_MC.ResultText")
    Endif
    
    UI.CloseCustomMenu()
    
    return result
EndFunction
                
;Mod Event Sent is EVM_ListMenuClosed
int function ListMenu(String[] Options, String[] OptionInfos = none, String TitleText = "", String AcceptText = "$Accept", \
					  String CancelText = "$Cancel", String DefaultInfo = "---", int StartIndex = 0, Bool WaitForResult = true) Global  
    
    CheckForEVMListener()
    if Options.length == 0
		return -1
	endif
	
	If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
    
    JsonUtil.Load("../ExtendedVanillaMenus/EVM_Data.json")
    ObjectReference ListenerObject = JsonUtil.GetFormValue("../ExtendedVanillaMenus/EVM_Data.json", "ListenerObj") as ObjectReference
    ExtendedVanillaMenus_Listener ListenerScript = (ListenerObject as ExtendedVanillaMenus_Listener)
    If ListenerScript
        ListenerScript.SnapToSearchMenuTarget = "_root.EVMListMenu_MC.FindAndSnapToSearchText"
        ListenerScript.RegisterAllKeys(true)
    Endif 

    UI.OpenCustomMenu("EVM_ListMenu") ;
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status") == 0) ;wait for flash to load menu 
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    String[] InitParams = New String[16] 
   
    InitParams[0] = TitleText
    InitParams[1] = AcceptText
    InitParams[2] = CancelText
    InitParams[3] = WaitForResult as int
    InitParams[4] = Game.UsingGamepad() as int
    InitParams[5] = DbMiscFunctions.GetIntFromFile("[Enter]", Settings, Default = 28)
    InitParams[6] = DbMiscFunctions.GetIntFromFile("[Escape]", Settings, Default = 1)
    InitParams[7] = DbMiscFunctions.GetIntFromFile("[Tab]", Settings, Default = 15)
    InitParams[8] = DbMiscFunctions.GetIntFromFile("[Right Shift]", Settings, Default = 54)
    InitParams[9] = DbMiscFunctions.GetIntFromFile("[Left Shift]", Settings, Default = 42)
    InitParams[10] = DbMiscFunctions.GetIntFromFile("[Gamepad A]", Settings, Default = 276)
    InitParams[11] = DbMiscFunctions.GetIntFromFile("[Gamepad B]", Settings, Default = 277)
    InitParams[12] = DefaultInfo
	InitParams[13] = StartIndex
	InitParams[14] = DbMiscFunctions.GetIntFromFile("[Left Ctrl]", Settings, Default = 29)
	InitParams[15] = DbMiscFunctions.GetIntFromFile("[Right Ctrl]", Settings, Default = 157)
	
    UI.InvokeStringA("CustomMenu", "_root.EVMListMenu_MC.InitListMenu", InitParams)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status") == 1) ;wait for flash to finish last function call
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
    UI.InvokeStringA("CustomMenu", "_root.EVMListMenu_MC.AddOptions", Options)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status") == 2) ;wait for flash to finish last function call
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
    UI.InvokeStringA("CustomMenu", "_root.EVMListMenu_MC.SetOptionInfos", OptionInfos) 
    
    If WaitForResult 
        return GetListMenuMultResult()
    Endif
EndFunction

int Function GetListMenuMultResult() Global
    
   ; Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status") < 9) ;wait for user to accept or cancel
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status"))
    
	int result = -1
	
    If UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.Status") == 9 ;user accepted new value 
        result = UI.GetInt("CustomMenu", "_root.EVMListMenu_MC.ResultInt")
    Endif 
    
    UI.CloseCustomMenu()
    
    JsonUtil.Load("../ExtendedVanillaMenus/EVM_Data.json")
    ObjectReference ListenerObject = JsonUtil.GetFormValue("../ExtendedVanillaMenus/EVM_Data.json", "ListenerObj") as ObjectReference
    ExtendedVanillaMenus_Listener ListenerScript = (ListenerObject as ExtendedVanillaMenus_Listener)
    If ListenerScript
        ListenerScript.RegisterAllKeys(false)
    Endif 

    return result
EndFunction

;returns: 0 = up, 1 = left, 2 = right, 3 = down, -1 = cancelled.
int function TweenMenu(String UpText, String LeftText, String RightText, String DownText, bool WaitForResult = true) Global  
	If UI.IsMenuOpen("CustomMenu") 
        UI.CloseCustomMenu()  
    Endif 
    
    UI.OpenCustomMenu("EVM_TweenMenu") ;
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status") == 0) ;wait for flash to load menu 
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status"))
    
    String Settings = MiscUtil.ReadFromFile("Data/interface/ExtendedVanillaMenus/EVM_Settings.txt") 
    
    String[] InitParams = New String[5] 
   
    InitParams[0] = UpText
    InitParams[1] = LeftText
    InitParams[2] = RightText
    InitParams[3] = DownText
    InitParams[4] = (WaitForResult as int)
    
    UI.InvokeStringA("CustomMenu", "_root.EVMTweenMenu_MC.InitTweenMenu", InitParams)
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status") == 1) ;wait for flash to finish last function call
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status"))
    
	if WaitForResult
		return GetTweenMenuResult()
	Endif
EndFunction

int Function GetTweenMenuResult() Global 
   ; Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status"))
    
    While (UI.IsMenuOpen("CustomMenu")) && (UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status") < 9) ;wait for user to accept or cancel
        ;Utility.WaitMenuMode(0.1) 
    EndWhile 
    
    ;Debug.Notification("Status = " + UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status"))
    
	int result = -1
	
	if UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.Status") == 9
		result = UI.GetInt("CustomMenu", "_root.EVMTweenMenu_MC.ResultInt")
	Endif
	
    UI.CloseCustomMenu()
    
    return result
EndFunction

Function CheckForEVMListener() Global
	JsonUtil.Load("../ExtendedVanillaMenus/EVM_Data.json")
    ObjectReference ListenerObject = JsonUtil.GetFormValue("../ExtendedVanillaMenus/EVM_Data.json", "ListenerObj") as ObjectReference
    
    If ListenerObject == none
        ListenerObject = DbMiscFunctions.CreateXMarkerRef(true)
		JsonUtil.SetFormValue("../ExtendedVanillaMenus/EVM_Data.json", "ListenerObj", ListenerObject)  
		JsonUtil.Save("../ExtendedVanillaMenus/EVM_Data.json")
    Endif 
    
    ExtendedVanillaMenus_Listener ListenerScript = (ListenerObject as ExtendedVanillaMenus_Listener)
    
    If ListenerObject
        If  !ListenerScript
            ;Debug.Notification("Setting EVM Listener")
            ObjectReference CurrentConsoleREf = ConsoleUtil.GetSelectedReference() 
            ConsoleUtil.SetSelectedReference(ListenerObject)
            ConsoleUtil.ExecuteCommand("APS ExtendedVanillaMenus_Listener") ;attach ExtendedVanillaMenus_Listener script to ListenerObject
            ConsoleUtil.SetSelectedReference(CurrentConsoleREf)
            Utility.WaitMenuMode(0.3)
            ListenerScript = (ListenerObject as ExtendedVanillaMenus_Listener)
        Endif
    Endif
    
    If ListenerScript
        ListenerScript.RegisterEvents()
    Endif
EndFunction 

MiscObject Function FindFirstPlayableMiscItemInGame() Global
    MiscObject RandomMisc = None
    
    keyword VendorItemClutter = Game.GetFormFromFile(0x0914e9, "Skyrim.esm") as Keyword
    keyword[] Filter 
    if VendorItemClutter
        Filter = New Keyword[1] 
        Filter[0] = VendorItemClutter
    Else 
        Filter = None 
    Endif
    
    Int ModCount = Game.GetModCount() 
    Int I = 0 
    While I < ModCount && RandomMisc == None
        String ModName = Game.GetModName(I) 
        Form[] AllModMiscItems = GameData.GetAllMiscItems(ModName, Filter)
        Int M = AllModMiscItems.Length 
        Int II = 0 
        While II < M && RandomMisc == None
            If AllModMiscItems[II].IsPlayable()
                RandomMisc = AllModMiscItems[II] as MiscObject
            Endif
            II += 1 
        EndWhile 
        I += 1
    EndWhile
    return RandomMisc
EndFunction