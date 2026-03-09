;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation13_02066CBD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ardwen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ardwen Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if( Alias_Ardwen.GetActorReference().IsInLocation(WhiterunLocation) )
  WEJS13.Stop()
  SetStage(10)
else
  Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property WhiterunLocation Auto
Quest Property WEJS13 Auto
