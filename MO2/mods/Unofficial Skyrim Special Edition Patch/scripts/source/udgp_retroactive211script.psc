Scriptname UDGP_Retroactive211Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto

Formlist Property WICastDragonBornShouts Auto
Spell Property DLC1VoiceDrainVitality1 Auto
Spell Property DLC1VoiceDrainVitality2 Auto
Spell Property DLC1VoiceDrainVitality3 Auto
Spell Property DLC1VoiceSoulTear1 Auto
Spell Property DLC1VoiceSoulTear2 Auto
Spell Property DLC1VoiceSoulTear3 Auto
Spell Property DLC1SummonDragon Auto

Function Process()
	;Dawnguard shouts never added to "letter from a friend" list.
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceDrainVitality1) )
		WICastDragonBornShouts.AddForm(DLC1VoiceDrainVitality1)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceDrainVitality2) )
		WICastDragonBornShouts.AddForm(DLC1VoiceDrainVitality2)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceDrainVitality3) )
		WICastDragonBornShouts.AddForm(DLC1VoiceDrainVitality3)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceSoulTear1) )
		WICastDragonBornShouts.AddForm(DLC1VoiceSoulTear1)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceSoulTear2) )
		WICastDragonBornShouts.AddForm(DLC1VoiceSoulTear2)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1VoiceSoulTear3) )
		WICastDragonBornShouts.AddForm(DLC1VoiceSoulTear3)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC1SummonDragon) )
		WICastDragonBornShouts.AddForm(DLC1SummonDragon)
	EndIf

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.1.1 Retroactive Updates Complete" )
		debug.trace( "All retroactive updates for UDGP fixes have been processed." )
		UDGPTracking.LastVersion = 211
		;USLEEP 300 - Stop the version tracking for UDGP now.
		UDGPTracking.Stop()
		Stop()
		Return
	EndIf

	debug.trace( "UDGP 2.1.1 Retroactive Updates Complete" )
	debug.trace( "All retroactive updates for UDGP fixes have been processed." )
	UDGPTracking.LastVersion = 211
	;USLEEP 300 - Stop the version tracking for UDGP now.
	UDGPTracking.Stop()
	Stop()
EndFunction
