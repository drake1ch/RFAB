;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC2_QF_DLC2dunFrostmoonQST_0201F9E6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Rakel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rakel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hjordis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hjordis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Akar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Akar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Majni
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Majni Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Majni dead.
if (GetStageDone(21) && GetStageDone(22) && GetStageDone(23) && GetStageDone(24))
     SetStage(200)
EndIf

;Allow Hjordis to transform.
;UDBP 2.0.3 - If reference isn't available, alias likely isn't filled.
if( Alias_Hjordis.GetActorReference() )
	(Alias_Hjordis.GetActorReference() as DLC2dunFrostmoonTransformScript).AllowWerewolfTransform = True
	(Alias_Hjordis.GetActorReference() as DLC2dunFrostmoonTransformScript).OnCombatStateChanged(Alias_Hjordis.GetActorReference().GetCombatTarget(), 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Disable the Frostmoon Camp Trigger when needed.
FrostmoonCampTrigger.UnregisterForUpdate()
FrostmoonCampTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Nothing to do here.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Rakel dead.
if (GetStageDone(21) && GetStageDone(22) && GetStageDone(23) && GetStageDone(24))
     SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Akar dead.
if (GetStageDone(21) && GetStageDone(22) && GetStageDone(23) && GetStageDone(24))
     SetStage(200)
EndIf

;Allow Rakel to transform.
(Alias_Rakel.GetActorReference() as DLC2dunFrostmoonTransformScript).AllowWerewolfTransform = True
(Alias_Rakel.GetActorReference() as DLC2dunFrostmoonTransformScript).OnCombatStateChanged(Alias_Rakel.GetActorReference().GetCombatTarget(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Clear ownership from beds and loot.
ObjectReference ownerLink = FrostmoonOwnershipLink
While (ownerLink != None)
     ownerLink.SetFactionOwner(None)
     ownerLink = ownerLink.GetLinkedRef()
EndWhile

;Clear the werewolves from their aliases to save memory.
Alias_Majni.Clear()
Alias_Akar.Clear()
Alias_Hjordis.Clear()
Alias_Rakel.Clear()

;DON'T stop the quest, since the rings depend on it, and the player might have some of them.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;If a werewolf player speaks to Majni, he declares them a friend of the camp.
PlayerFaction.SetAlly(DLC2dunFrostmoonWerewolvesFaction, True, True)
Game.GetPlayer().SetRelationshipRank(Alias_Majni.GetActorReference(), 1)
Game.GetPlayer().SetRelationshipRank(Alias_Rakel.GetActorReference(), 1)

;This completes the objective.
DLC2dunFrostmoonQSTMisc.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;If the player attacks anyone at the camp, steals, or lingers too long, the camp becomes hostile.
;Disable the trigger.
SetStage(1)

;Make the camp hostile.
PlayerFaction.SetEnemy(DLC2dunFrostmoonWerewolvesFaction)
Game.GetPlayer().SetRelationshipRank(Alias_Majni.GetActorReference(), 0)
Game.GetPlayer().SetRelationshipRank(Alias_Rakel.GetActorReference(), 0)

;Clear Protected status from Majni.
Alias_Majni.GetActorReference().GetActorBase().SetProtected(False)

;Force combat start.
Alias_Majni.GetActorReference().StartCombat(Game.GetPlayer())
Alias_Akar.GetActorReference().StartCombat(Game.GetPlayer())
Alias_Rakel.GetActorReference().StartCombat(Game.GetPlayer())
Alias_Hjordis.GetActorReference().StartCombat(Game.GetPlayer())
Alias_Majni.GetActorReference().EvaluatePackage()
Alias_Akar.GetActorReference().EvaluatePackage()
Alias_Rakel.GetActorReference().EvaluatePackage()
Alias_Hjordis.GetActorReference().EvaluatePackage()

;Close the objective.
DLC2dunFrostmoonQSTMisc.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Hjordis dead.
if (GetStageDone(21) && GetStageDone(22) && GetStageDone(23) && GetStageDone(24))
     SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC2dunFrostmoonWerewolvesFaction  Auto  

Faction Property PlayerFaction  Auto  

ObjectReference Property FrostmoonOwnershipLink  Auto  

ObjectReference Property FrostmoonCampTrigger  Auto  

Quest Property DLC2dunFrostmoonQSTMisc  Auto  
