;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_WB_LocateValuables_Quest_010A5915 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WB_Object_Glow_08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Object_Glow_12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Object_Glow_12 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_14.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_13.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_12.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_11.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_10.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_09.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_08.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_07.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_06.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_05.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_04.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_03.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_02.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_01.GetReference())
WB_AlterationAlt_FXS.Stop(Alias_WB_Object_00.GetReference())
Alias_WB_Object_Glow_14.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_13.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_12.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_11.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_10.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_09.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_08.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_07.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_06.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_05.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_04.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_03.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_02.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_01.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_00.GetReference().DisableNoWait(true)
Alias_WB_Object_Glow_14.GetReference().Delete()
Alias_WB_Object_Glow_13.GetReference().Delete()
Alias_WB_Object_Glow_12.GetReference().Delete()
Alias_WB_Object_Glow_11.GetReference().Delete()
Alias_WB_Object_Glow_10.GetReference().Delete()
Alias_WB_Object_Glow_09.GetReference().Delete()
Alias_WB_Object_Glow_08.GetReference().Delete()
Alias_WB_Object_Glow_07.GetReference().Delete()
Alias_WB_Object_Glow_06.GetReference().Delete()
Alias_WB_Object_Glow_05.GetReference().Delete()
Alias_WB_Object_Glow_04.GetReference().Delete()
Alias_WB_Object_Glow_03.GetReference().Delete()
Alias_WB_Object_Glow_02.GetReference().Delete()
Alias_WB_Object_Glow_01.GetReference().Delete()
Alias_WB_Object_Glow_00.GetReference().Delete()
WB_AlterationAlt_LocateValuables_Global_IsActive.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
WB_AlterationAlt_LocateValuables_Global_IsActive.SetValue(1)
WB_AlterationAlt_FXS.Play(Alias_WB_Object_00.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_01.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_02.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_03.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_04.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_05.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_06.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_07.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_08.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_09.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_10.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_11.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_12.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_13.GetReference())
WB_AlterationAlt_FXS.Play(Alias_WB_Object_14.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

EffectShader Property WB_AlterationAlt_FXS  Auto  

GlobalVariable Property WB_AlterationAlt_LocateValuables_Global_IsActive  Auto  
