Scriptname UDBP_Retroactive104Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive105Script Property Retro105 Auto

FormList Property DisintegrationMainImmunityList Auto
Race Property DLC2AcolyteDragonPriestRace Auto

ReferenceAlias Property Fanari Auto
ReferenceAlias Property Deor Auto
Quest Property DLC2SV02 Auto
Quest Property USLEEPDLC2SV02Preessentials Auto

Quest Property DLC2WE06 Auto
ReferenceAlias Property BlackBookAlias Auto

ReferenceAlias Property Rakel Auto
Quest Property DLC2dunFrostmoonQSTMisc Auto

Function Process()
	;Bug #12606 - Dragon priests for DB are not immune to ash disintegration
	if( !DisintegrationMainImmunityList.HasForm( DLC2AcolyteDragonPriestRace ) )
		DisintegrationMainImmunityList.AddForm(DLC2AcolyteDragonPriestRace)
	EndIf
	
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 1.0.4 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 104
		Retro105.Process()
		Stop()
		Return
	EndIf
	
	;Bug #12855 - Fanari and Deor are necessary elements for DLC2SV02Misc which leads into A New Source for Stalrhim.
	;They could be easily killed while liberating the shrine they both get drawn to and the player may never realize it happened.
	if( DLC2SV02.GetStage() < 10 )
		Actor DeorRef = Deor.GetActorReference()
		
		if( DeorRef.IsDead() )
			DeorRef.Resurrect()
			DeorRef.EvaluatePackage()
		EndIf

		Actor FanariRef = Fanari.GetActorReference()
		
		if( FanariRef.IsDead() )
			FanariRef.Resurrect()
			FanariRef.EvaluatePackage()
		EndIf
	Else
		USLEEPDLC2SV02Preessentials.Stop()
	EndIf
	
	;Bug #12738 - Black Book random quests could send you to get a book you already have.
	if( DLC2WE06.GetStage() >= 50 && DLC2WE06.GetStage() < 200 )
		Book BlackBook = ( BlackBookAlias.GetReference().GetBaseObject() as Book )
		
		if( PlayerRef.GetItemCount(BlackBook) > 0 )
			DLC2WE06.SetStage(200)
		EndIf
	EndIf
	
	;Bug #12049 - DLC2dunFrostmoonQSTMisc is never cleared if Rakel tells you to get lost after Geldis sends you there
	if( DLC2dunFrostmoonQSTMisc.IsRunning() )
		if( Rakel.GetActorReference().GetActorValue("Variable06") == 3 )
			DLC2dunFrostmoonQSTMisc.SetStage(20)
		EndIf
	EndIf
		
	debug.trace( "UDBP 1.0.4 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 104
	Retro105.Process()
	Stop()
EndFunction
