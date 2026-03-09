Scriptname UDBP_Retroactive105Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive201Script Property Retro201 Auto

FormList Property DisintegrationMainImmunityList Auto
Race Property DLC2AshSpawnRace Auto
Race Property DLC2SeekerRace Auto

Function Process()
	;Bug #13321 - Ash Spawns and Seekers need to be immune from disintegration or they will drop duplicate ash piles.
	if( !DisintegrationMainImmunityList.HasForm(DLC2AshSpawnRace) )
		DisintegrationMainImmunityList.AddForm(DLC2AshSpawnRace)
	EndIf
	if( !DisintegrationMainImmunityList.HasForm(DLC2SeekerRace) )
		DisintegrationMainImmunityList.AddForm(DLC2SeekerRace)
	EndIf
	
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 1.0.5 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 105
		Retro201.Process()
		Stop()
		Return
	EndIf
	
	debug.trace( "UDBP 1.0.5 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 105
	Retro201.Process()
	Stop()
EndFunction
