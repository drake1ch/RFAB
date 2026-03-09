Scriptname TelravMasterSCRIPT extends Actor  

QUEST PROPERTY nilheimQuest AUTO

Actor PROPERTY banditA AUTO
Actor PROPERTY banditB AUTO
Actor PROPERTY banditC AUTO
Actor PROPERTY banditD AUTO
Actor PROPERTY banditE AUTO

REFERENCEALIAS PROPERTY aliasBanditA AUTO
REFERENCEALIAS PROPERTY aliasBanditB AUTO
REFERENCEALIAS PROPERTY aliasBanditC AUTO
REFERENCEALIAS PROPERTY aliasBanditD AUTO
REFERENCEALIAS PROPERTY aliasBanditE AUTO

FACTION PROPERTY oldFaction AUTO
FACTION PROPERTY banditFaction AUTO

;USKP 2.0.1 - Removed all reference to BanditF - He never existed.
EVENT ONDEATH(ACTOR akKiller)

	;have the "guards" go aggro
	BanditA.removeFromFaction(oldFaction)
	BanditB.removeFromFaction(oldFaction)
	BanditC.removeFromFaction(oldFaction)
	BanditD.removeFromFaction(oldFaction)
	BanditE.removeFromFaction(oldFaction)

	aliasBanditA.forceRefTo(banditA)
	aliasBanditB.forceRefTo(banditB)
	aliasBanditC.forceRefTo(banditC)
	aliasBanditD.forceRefTo(banditD)
	aliasBanditE.forceRefTo(banditE)
		
	BanditA.evaluatePackage()
	BanditB.evaluatePackage()
	BanditC.evaluatePackage()
	BanditD.evaluatePackage()
	BanditE.evaluatePackage()
	
	IF(nilheimQuest.getStage() == 30)
		nilheimQuest.SetObjectiveCompleted(30, 1)
		nilheimQuest.setStage(100)
	ELSEIF(nilheimQuest.getStage() > 0 && nilheimQuest.getStage() < 30)
		; //fail the quest
		nilheimQuest.SetObjectiveCompleted(30, 1)
		nilheimQuest.setStage(150)
	ENDIF
ENDEVENT
