Scriptname UDGP_Retroactive111Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive112Script Property Retro112 Auto
Actor Property PlayerRef Auto

Shout Property BuggedShout Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.1.1 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 111
		Retro112.Process()
		Stop()
		Return
	EndIf
	
	;Remove the bad Drain Vitality Shout
	PlayerRef.RemoveShout(BuggedShout)
	
	debug.trace( "UDGP 1.1.1 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 111
	Retro112.Process()
	Stop()
EndFunction
