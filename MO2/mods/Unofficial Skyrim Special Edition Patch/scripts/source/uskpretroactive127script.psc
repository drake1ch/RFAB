Scriptname USKPRetroactive127Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive130Script Property Retro130 Auto

Quest Property CWFortObserver Auto

Weapon Property SSDRocksplinterPickaxe Auto
Weapon Property weapPickaxe Auto

ReferenceAlias Property Odfel Auto

ReferenceAlias Property MarkarthThalmor1 Auto
ReferenceAlias Property MarkarthThalmor2 Auto
Location Property MarkarthLocation Auto
Keyword Property CWOwner Auto

CaravanScript Property Caravans Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.7 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 127
		Retro130.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #347 - Fort garrisons are never populated with their appropriate soldiers once cleared during the war.
	if( CWFortObserver.IsRunning() )
		CWFortObserver.Setstage(10) ; Just stop it, because it should have the moment the player left anyway and it only starts once they have.
	EndIf
	
	;Bugzilla #9649 - Odfel is not carrying his unique weapon.
	Odfel.GetActorReference().RemoveItem(weapPickaxe)
	Odfel.GetActorReference().AddItem(SSDRocksplinterPickaxe)

	;Bugzilla #8999 - The two Thalmor soldiers in Understone Keep need to STAY DEAD!
	if( MarkarthLocation.GetKeywordData(CWOwner) == 2 )
		MarkarthThalmor1.TryToKill()
		MarkarthThalmor1.TryToDisable()
		MarkarthThalmor2.TryToKill()
		MarkarthThalmor2.TryToDisable()
	EndIf
	
	;Resets all Caravan values to correct remaining issues.
	Caravans.CheckArrayInits()
	
	debug.trace( "USKP 1.2.7 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 127
	Retro130.Process()
	Stop()
EndFunction
