;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_DGIntimidateScene_0002C5B1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;USKP 2.1.0 - Bug #18674
if( !Opponent.GetActorReference().IsDead() )
  Opponent.GetActorReference().StartCombat(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " end scene")
;USKP 2.1.2 - Bug #19061
if( GetOwningQuest().IsRunning() )
  GetOwningQuest().SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Opponent  Auto  
