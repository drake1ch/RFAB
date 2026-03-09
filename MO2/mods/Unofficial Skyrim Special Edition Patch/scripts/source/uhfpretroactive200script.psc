Scriptname UHFPRetroactive200Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive201Script Property Retro201 Auto

BYOH_QF_BYOHHouseWolfAttack_01000C39 Property WolfAttackQuest Auto
GlobalVariable Property BYOHLastAttack Auto
GlobalVariable Property GameDaysPassed Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.0 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 200
		Retro201.Process()
		Stop()
		Return
	EndIf

	;Bug 13747 - Wolf attacks on houses did not work correctly due to bad property settings.
	WolfAttackQuest.BYOHLastAttack = BYOHLastAttack
	WolfAttackQuest.GameDaysPassed = GameDaysPassed
	
	debug.trace( "UHFP 2.0.0 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 200
	Retro201.Process()
	Stop()
EndFunction
