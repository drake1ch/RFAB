Scriptname UDGP_Retroactive112Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive113Script Property Retro113 Auto
Actor Property PlayerRef Auto

Shout Property BuggedShout Auto
Shout Property TheOtherBuggedShout Auto
GlobalVariable Property DLC1WWDrainVitality Auto
WordOfPower Property DLC1DrainVitality1Gaan Auto
WordOfPower Property DLC1DrainVitality2Lah Auto
WordOfPower Property DLC1DrainVitality3Haas Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.1.2 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 112
		Retro113.Process()
		Stop()
		Return
	EndIf
	
	;Remove the bad Drain Vitality Shout - for the second time!
	PlayerRef.RemoveShout(BuggedShout)
	PlayerRef.RemoveShout(TheOtherBuggedShout)
	
	float DVWords = DLC1WWDrainVitality.GetValue()
	
	if( DVWords >= 1.0 )
		Game.TeachWord(DLC1DrainVitality1Gaan)
	EndIf
	
	if( DVWords >= 2.0 )
		Game.TeachWord(DLC1DrainVitality2Lah)
	EndIf
	
	if( DVWords >= 3.0 )
		Game.TeachWord(DLC1DrainVitality3Haas)
	EndIf
	
	debug.trace( "UDGP 1.1.2 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 112
	Retro113.Process()
	Stop()
EndFunction
