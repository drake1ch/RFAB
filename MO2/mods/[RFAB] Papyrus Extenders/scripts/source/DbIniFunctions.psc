Scriptname DbIniFunctions Hidden 
;/This is for convenience to have get / set / has custom ini functions work on either SE or LE 
Uses PapyrusIniManipulator for SE or PapyrusIni for LE
These functions assume using SE PapyrusIniManipulator as default, which means file path  is relative to the Skyrim root folder. So use: "Data/MySettings.ini" for ini files in the data folder. 
PapyrusIni is relative to the data folder, so to work on either SE or LE make sure your custom ini files are in the Data folder.
If called on LE, these functions will auto convert the file paths for use with PapyrusIni. 
Note, if using these you have to have both PapyrusIniManipulator.psc and PapyrusIni.psc in your source folder to compile. 
Requires DbMiscFunctions as well.

example: in MySettings.ini you have: 
[MySection]
iMyInt=3

DbIniFunctions.GetIniInt("Data/MySettings.ini", "MySection", "iMyInt") will return 3 on both SE and LE, if PapyrusIniManipulator is installed on SE or PapyrusIni is installed on LE.

List Of Functions: 
Bool Function GetIniBool(String sFilePath, String sSection, String sKey, Bool Default = false) Global
int Function GetIniInt(String sFilePath, String sSection, String sKey, int Default = 0) Global
Float Function GetIniFloat(String sFilePath, String sSection, String sKey, Float Default = 0.0) Global
String Function GetIniString(String sFilePath, String sSection, String sKey, String Default = "") Global

Bool Function SetIniBool(String sFilePath, String sSection, String sKey, Bool Value, Bool bForce = False) Global
Bool Function SetIniInt(String sFilePath, String sSection, String sKey, Int Value, Bool bForce = False) Global
Bool Function SetIniFloat(String sFilePath, String sSection, String sKey, Float Value, Bool bForce = False) Global
Bool Function SetIniString(String sFilePath, String sSection, String sKey, String Value, Bool bForce = False) Global

Bool Function HasIniBool(String sFilePath, String sSection, String sKey) Global
Bool Function HasIniInt(String sFilePath, String sSection, String sKey) Global
Bool Function HasIniFloat(String sFilePath, String sSection, String sKey) Global
Bool Function HasIniString(String sFilePath, String sSection, String sKey) Global

String Function ConvertFilePathFromSEtoLE(String sFilePath) Global
/;

;Getters============================================================================================
Bool Function GetIniBool(String sFilePath, String sSection, String sKey, Bool Default = false) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PullBoolFromIni(sFilePath, sSection, sKey, Default)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        Return PapyrusIni.ReadBool(sFilePath, (sKey + ":" + sSection), Default)
    Else 
        return Default 
    Endif
EndFunction 

int Function GetIniInt(String sFilePath, String sSection, String sKey, int Default = 0) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PullIntFromIni(sFilePath, sSection, sKey, Default)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        Return PapyrusIni.ReadInt(sFilePath, (sKey + ":" + sSection), Default)
    Else 
        return Default 
    Endif
EndFunction 

Float Function GetIniFloat(String sFilePath, String sSection, String sKey, Float Default = 0.0) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PullFloatFromIni(sFilePath, sSection, sKey, Default)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        Return PapyrusIni.ReadFloat(sFilePath, (sKey + ":" + sSection), Default)
    Else 
        return Default 
    Endif
EndFunction 

String Function GetIniString(String sFilePath, String sSection, String sKey, String Default = "") Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PullStringFromIni(sFilePath, sSection, sKey, Default)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        Return PapyrusIni.ReadString(sFilePath, (sKey + ":" + sSection), Default, 1280)
    Else 
        return Default 
    Endif
EndFunction 

;Setters =======================================================================================================
;if bForce == true, will add the sKey to the sSection if it doesn't exist.
Bool Function SetIniBool(String sFilePath, String sSection, String sKey, Bool Value, Bool bForce = False) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PushBoolToIni(sFilePath, sSection, sKey, Value, bForce)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        If bForce == true || PapyrusIni.HasBool(sFilePath, settingName)
            PapyrusIni.WriteBool(sFilePath, settingName, Value)
            return (PapyrusIni.ReadBool(sFilePath, settingName, !Value) == Value)
        Endif
    Else 
        return false
    Endif
EndFunction 

Bool Function SetIniInt(String sFilePath, String sSection, String sKey, Int Value, Bool bForce = False) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PushIntToIni(sFilePath, sSection, sKey, Value, bForce)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        If bForce == true || PapyrusIni.HasInt(sFilePath, settingName)
            PapyrusIni.WriteInt(sFilePath, settingName, Value)
            return (PapyrusIni.ReadInt(sFilePath, settingName, (Value + 1)) == Value)
        Endif
    Else 
        return false
    Endif
EndFunction 

Bool Function SetIniFloat(String sFilePath, String sSection, String sKey, Float Value, Bool bForce = False) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PushFloatToIni(sFilePath, sSection, sKey, Value, bForce)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        If bForce == true || PapyrusIni.HasFloat(sFilePath, settingName)
            PapyrusIni.WriteFloat(sFilePath, settingName, Value)
            return (PapyrusIni.ReadFloat(sFilePath, settingName, (Value + 1.0)) == Value)
        Endif
    Else 
        return false
    Endif
EndFunction 

Bool Function SetIniString(String sFilePath, String sSection, String sKey, String Value, Bool bForce = False) Global 
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.PushStringToIni(sFilePath, sSection, sKey, Value, bForce)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        If bForce == true || PapyrusIni.HasString(sFilePath, settingName)
            PapyrusIni.WriteString(sFilePath, settingName, Value)
            return (PapyrusIni.ReadString(sFilePath, settingName, (Value + "|")) == Value)
        Endif
    Else 
        return false
    Endif
EndFunction 

;Has functions==================================================================
Bool Function HasIniBool(String sFilePath, String sSection, String sKey) Global
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.IniDataExists(2, sFilePath, sSection, sKey)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        return PapyrusIni.HasBool(sFilePath, settingName)
    Endif
EndFunction

Bool Function HasIniInt(String sFilePath, String sSection, String sKey) Global
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.IniDataExists(2, sFilePath, sSection, sKey)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        return PapyrusIni.HasInt(sFilePath, settingName)
    Endif
EndFunction

Bool Function HasIniFloat(String sFilePath, String sSection, String sKey) Global
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.IniDataExists(2, sFilePath, sSection, sKey)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        return PapyrusIni.HasFloat(sFilePath, settingName)
    Endif
EndFunction

Bool Function HasIniString(String sFilePath, String sSection, String sKey) Global
    If PapyrusIniManipulator.GetVersion() != ""
        return PapyrusIniManipulator.IniDataExists(2, sFilePath, sSection, sKey)
        
    ElseIf PapyrusIni.GetPluginVersion() >= 2  
        sFilePath = ConvertFilePathFromSEtoLE(sFilePath)
        String settingName = sKey + ":" + sSection
        return PapyrusIni.HasString(sFilePath, settingName)
    Endif
EndFunction
;==================================================================================

;used for the above functions
;Requires DbMiscFunctions and skse
String Function ConvertFilePathFromSEtoLE(String sFilePath) Global
    sFilePath = DbMiscFunctions.StringReplace(sFilePath, "/", "\\") ;replace / with \\ in file path for use with PapyrusIni.
    int iData = StringUtil.Find(sFilePath, "Data")
    If  iData > -1 
        sFilePath = StringUtil.SubString(sFilePath, (iData + 5)) ;remove data/ from file path
    Endif  
    return sFilePath
Endfunction 

