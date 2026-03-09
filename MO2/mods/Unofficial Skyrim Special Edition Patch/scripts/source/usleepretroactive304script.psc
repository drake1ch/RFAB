Scriptname USLEEPRetroactive304Script extends Quest  

Quest Property MQ101 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto
USLEEPRetroactive306Script Property Retro306 Auto

ReferenceAlias Property TeebaEi Auto
Faction Property MorthalLonghouseFaction Auto

ReferenceAlias Property MS07LightHouseFireOn Auto
ReferenceAlias Property MS07LightHouseFireOff Auto
Quest Property MS07 Auto

ReferenceAlias Property JareeRa Auto
ObjectReference Property WinkingSkeeverMarker Auto

GlobalVariable Property USLEEPStormfangSpawns Auto
GlobalVariable Property USLEEPStormfangLooted Auto
ActorBase Property DLC2dunBrodirGroveBanditBoss Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.4 Retroactive Updates Complete" )
		USLEEPTracking.LastVersion = 304
		Retro306.Process()
		Stop()
		Return
	EndIf

	;Bug #20127 - Teeba-Ei needs to be in the faction for Morthal's longhouse or Pactur will accuse him of trespassing.
	TeebaEi.GetActorReference().AddToFaction(MorthalLonghouseFaction)

	;Bug #19942 - Lighthouse fire after MS07 never turns back on.
	if( MS07.GetstageDone(250) == 1 )
		MS07LightHouseFireOff.GetReference().Disable()
		MS07LightHouseFireOn.GetReference().Enable()
	endif

	;Bug #20497 - JareeRa can get stuck inside the cell he was temporarily assigned to before SolitudeOpening was done.
	if( MS07.GetStage() < 50 )
		JareeRa.GetReference().MoveTo(WinkingSkeeverMarker)
	endif

	;Bug #20185 - Reaver Lord at Brodir's Grove needs to respawn, but Stormfang shouldn't.
	if( DLC2dunBrodirGroveBanditBoss.GetDeadCount() >= 1 )
		USLEEPStormfangSpawns.SetValue(100)
		USLEEPStormfangLooted.SetValue(0)
	endif

	debug.trace( "USLEEP 3.0.4 Retroactive Updates Complete" )
	USLEEPTracking.LastVersion = 304
	Retro306.Process()
	Stop()
EndFunction
