;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname USKP_QF_ChangeLocation11_0203F7B9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Orchendor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orchendor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if( DA13.GetStageDone(40) == 1 && DA13.GetStageDone(75) == 0 )
 Actor DeadGuy = Alias_Orchendor.GetActorReference()
 if( DeadGuy.IsDead() )
  DA13.SetStage(75)
  SetStage(10)
 else
  Stop()
 endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA13 Auto
