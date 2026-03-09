;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DialogueMarkarthIntroWorld_000AF75F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Eltrys
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Eltrys Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hogni
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hogni Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Weylin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Weylin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Margret
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Margret Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kerah
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kerah Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Clean up bodies
MS01.MarkarthMarket = 0

If Alias_Weylin.GetActorReference().IsDead() == True
  Alias_Weylin.GetActorReference().Delete()
EndIf

If Alias_Margret.GetActorReference().IsDead() == True
  Alias_Margret.GetActorReference().Delete()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Weylin has attempted to kill Margret

;if Alias_Weylin.GetActorReference().PlayIdleWithTarget(KillMove, Alias_Margret.GetActorReference())
; ;  Debug.Trace(self + "Weylin plays his backstab animation")
;else
; ;  Debug.Trace(self + "Weylin's paired animation failed to play")
;endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;USKP 2.0.5 - If Weylin is already dead, skip this part.
if( !Alias_Weylin.GetActorReference().IsDead() )
	Alias_Weylin.GetActorReference().AddtoFaction(MS01EnemyFaction)
	Alias_Kerah.GetActorReference().StartCombat(Alias_Weylin.GetActorReference())
	Alias_Hogni.GetActorReference().StartCombat(Alias_Weylin.GetActorReference())
EndIf

;Markarth is shut down until bodies are cleared
MS01Script.MarkarthMarket = 1

; un-ghost actors
Alias_Kerah.GetActorReference().SetGhost(false)
Alias_Hogni.GetActorReference().SetGhost(false)
;Alias_Weylin.GetActorReference().SetGhost(false)
Alias_Margret.GetActorReference().SetGhost(false)
Alias_Guard.GetActorReference().SetGhost(false)
Alias_Eltrys.GetActorReference().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Weylin dies
; debug.trace(self + "Starting MS01 post market attack scene")
MarkarthIntroEndCombatScene.Start()
Game.GetPlayer().RemoveFromFaction(GuardFactionMarkarth)
Alias_Margret.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;run the scene
pIntroScene.Start()

Alias_Weylin.GetActorReference().RemoveFromFaction(CrimeFactionReach)
Alias_Weylin.GetActorReference().RemoveFromFaction(TownMarkarthFaction)

;Temporarily add the player to the guard faction until Weylin dies
;Game.GetPlayer().AddtoFaction(GuardFactionMarkarth)

;ghost actors so that crime isn't called if the player assaults NPCs
Alias_Kerah.GetActorReference().SetGhost()
Alias_Hogni.GetActorReference().SetGhost()
;Alias_Weylin.GetActorReference().SetGhost()
Alias_Margret.GetActorReference().SetGhost()
Alias_Guard.GetActorReference().SetGhost()
Alias_Eltrys.GetActorReference().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE MS01IntroWorldSceneScript
Quest __temp = self as Quest
MS01IntroWorldSceneScript kmyQuest = __temp as MS01IntroWorldSceneScript
;END AUTOCAST
;BEGIN CODE
Alias_Eltrys.GetActorReference().EvaluatePackage()

kmyquest.RegisterForUpdateGameTime(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; people should go about their normal lives
Alias_Guard.GetActorReference().EvaluatePackage()
Alias_Guard02.GetActorReference().EvaluatePackage()
Alias_Guard03.GetActorReference().EvaluatePackage()
Alias_Kerah.GetActorReference().EvaluatePackage()
Alias_Margret.GetActorReference().EvaluatePackage()
Alias_Hogni.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pIntroScene  Auto  

Faction Property MS01EnemyFaction  Auto  

Faction Property CrimeFactionReach  Auto  

Faction Property TownMarkarthFaction  Auto  

Faction Property GuardFactionMarkarth  Auto  

Scene Property MarkarthIntroEndCombatScene  Auto  

Faction Property MS01WeylinKillMargretFaction  Auto  

MS01QuestScript Property MS01Script  Auto  

MS01QuestScript Property MS01  Auto  

Idle Property KillMove  Auto  
