Scriptname pHelvardScript extends Actor Conditional

Quest Property pDBSideContract11  Auto  
int Property pHelvardDie  Auto Conditional 
Quest Property DarkBrotherhoodQuest  Auto  

;This tracks Helvard getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)
	DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

	if pDBSideContract11.GetStage () == 10
		pDBSideContract11.SetStage (20)
	endif

	if pDBSideContract11.GetStage () == 0
		DBScript.pHelvardAlreadyDead = 1
	endif	 

	;USKP 2.0.4 - Try to see if the player was caught killing him.
	DBScript.USKP_WasPlayerDetected()
EndEvent

;USKP 2.0.4 - Added events to record Jarl's relationship rank with the player.
ReferenceAlias Property JarlOfFalkreath Auto
bool DoOnce

Event OnLoad()
	DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

	if( pDBSideContract11.GetStage() < 20 && !Self.IsDead() )
		DBScript.USKPJarlRelationshipRank = Game.GetPlayer().GetRelationshipRank(JarlOfFalkreath.GetActorReference())
	EndIf
EndEvent

Event OnUnload()
	DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
	
	if( DoOnce == False && Self.IsDead() && DBScript.USKPCombatDetected == False )
		DoOnce = True
		Game.GetPlayer().SetRelationshipRank(JarlOfFalkreath.GetActorReference(), DBScript.USKPJarlRelationshipRank )
	EndIf
EndEvent
