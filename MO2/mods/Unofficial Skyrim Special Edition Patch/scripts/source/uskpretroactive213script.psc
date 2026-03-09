Scriptname USKPRetroactive213Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto

Quest Property dunDarklightQST Auto

Quest Property SolitudeFreeform02 Auto
ReferenceAlias Property Taarie Auto

Quest Property CW02A Auto
Quest Property CW02B Auto
Quest Property CW01AOutfitImperial Auto

DialogueWindhelmScript Property WHScene Auto

Quest Property MS05 Auto
Spell Property USLEEPMS05Reward Auto
Spell Property USLEEPMS05RewardNoDisplay Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.1.3 Retroactive Updates Complete" )
		debug.trace( "All retroactive updates for USKP fixes have been processed." )
		USKPTracking.LastVersion = 213
		;USLEEP 300 - Stop the version tracking for USKP now.
		USKPTracking.Stop()
		Stop()
		Return
	EndIf

	;Bug #19133 - dunDarklightQST is never stopped once stage 55 is hit.
	if( dunDarklightQST.GetStageDone(55) == 1 )
		dunDarklightQST.Stop()
	EndIf

	;Bug #19403 - Taarie never raises friendship rank with the player.
	if( SolitudeFreeform02.GetStageDone(30) == 1 )
		Taarie.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf

	;Bug #19402 - CW01AOutfitImperial never terminated if joining the Stormcloaks.
	if( CW02A.GetStageDone(220) == 1 || CW02B.GetStageDone(10) == 1 )
		CW01AOutfitImperial.FailAllObjectives()
		CW01AOutfitImperial.Stop()
	EndIf

	;Bug #19275 - Bully scene interruption fix
	if( WHScene.WindhelmBullyDone == 1 || WHScene.SuvarisFree == 1 )
		WHScene.USKPBullySceneStarted = 1
	EndIf
	
	;Bug #19392 - Unannounced speechcraft mod.
	if( MS05.GetStageDone(300) == 1 )
		if( Game.GetPlayer().GetAV("SpeechcraftMod") >= 15.00 )
			Game.GetPlayer().ModAV("SpeechcraftMod",-15)
		EndIf
		Game.GetPlayer().AddSpell(USLEEPMS05Reward)
		Game.GetPlayer().AddSpell(USLEEPMS05RewardNoDisplay,false)
	EndIf

	debug.trace( "USKP 2.1.3 Retroactive Updates Complete" )
	debug.trace( "All retroactive updates for USKP fixes have been processed." )
	USKPTracking.LastVersion = 213
	
	;USLEEP 300 - Stop the version tracking for USKP now.
	USKPTracking.Stop()
	Stop()
EndFunction
