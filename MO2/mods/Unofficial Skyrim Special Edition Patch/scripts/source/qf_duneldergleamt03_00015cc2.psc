;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_dunEldergleamT03_00015CC2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EldergleamAsta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamAsta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EldergleamSond
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EldergleamSond Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;USKP 2.0.1 added stage. Called from alias scripts when the NPCs die.
if( GetStageDone(51) == 1 )
 SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;USKP 2.0.1 added stage.
;If both NPCs die, quest terminates so the corpses will eventually despawn.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BridgeScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has talked to Asta for the first time
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;USKP 2.0.1 added stage. Called from alias scripts when the NPCs die.
if( GetStageDone(52) == 1 )
 SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BridgeScene01  Auto  
