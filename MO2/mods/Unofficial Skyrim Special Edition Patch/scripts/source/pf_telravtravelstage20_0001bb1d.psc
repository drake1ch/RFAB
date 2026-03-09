;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TelravTravelStage20_0001BB1D Extends Package Hidden
;USKP 2.0.1 - There is no "BanditF" so all references to it have been removed.

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
nilheimQuest.setStage(30)
nilheimQuest.setObjectiveDisplayed(30,1)

telravRef.getActorReference().setFactionRank(Bandit, 3)

;have the bandits attack
aliasBanditA.forceRefTo(BanditA)
aliasBanditB.forceRefTo(BanditB)
aliasBanditC.forceRefTo(BanditC)
aliasBanditD.forceRefTo(BanditD)
aliasBanditE.forceRefTo(BanditE)

;have the "guards" go aggro
BanditA.setFactionRank(bandit, 3)
BanditB.setFactionRank(bandit, 3)
BanditC.setFactionRank(bandit, 3)
BanditD.setFactionRank(bandit, 3)
BanditE.setFactionRank(bandit, 3)
	
BanditA.removeFromFaction(oldFaction)
BanditB.removeFromFaction(oldFaction)
BanditC.removeFromFaction(oldFaction)
BanditD.removeFromFaction(oldFaction)
BanditE.removeFromFaction(oldFaction)
telravRef.getActorReference().removeFromFaction(oldFaction)

BanditA.startCombat(game.getPlayer())
BanditB.startCombat(game.getPlayer())
BanditC.startCombat(game.getPlayer())
telravRef.getActorReference().startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property BanditA  Auto  

Actor Property BanditB  Auto  

Actor Property BanditC  Auto  

Actor Property BanditD  Auto  

Actor Property banditE  Auto  

Faction Property Bandit  Auto  

Faction Property OldFaction  Auto  

QUEST Property nilheimQuest  Auto  

ReferenceAlias Property TelravRef  Auto  

referenceAlias Property aliasBanditA  Auto  

referenceAlias Property aliasBanditB  Auto  

referenceAlias Property aliasBanditC  Auto  

referenceAlias Property aliasBanditD  Auto  

referenceAlias Property aliasBanditE  Auto  
