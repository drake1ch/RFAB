;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PF_CarryFirewood_000D97FA Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnEnd")
;(akActor as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnChange")
;USKP 2.0.1 - Properly handling itself as an Actor now.
(akActor as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
; ; debug.trace(self + " OnBegin")
;USKP 2.0.1 - Properly handling itself as an Actor now.
(akActor as CarryActorScript).ChangeCarryState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property CarryItem  Auto  
