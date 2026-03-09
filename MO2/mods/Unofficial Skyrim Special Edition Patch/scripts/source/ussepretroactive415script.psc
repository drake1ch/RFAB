Scriptname USSEPRetroactive415Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive417Script Property Retro417 Auto ; Yes, 416 was skipped.

ObjectReference Property MG06MagnusSoundRef Auto
Quest Property MG06 Auto

MS12bPlayerScript Property MS12bScript Auto
Quest Property MS12b Auto

Quest Property RelationshipOrcs Auto
Cell Property MorKhazgurLaraksLonghouse Auto
Cell Property NarzulburMauhulakhsLonghouse Auto
Cell Property DushnikhYalLonghouse Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.1.5 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 415
		Retro417.Process()
		Stop()
		Return
	EndIf

	;Bug #20092 - Thunder sound in Hall of Elements after quest line is over.
	if( MG06.GetStage() >= 99 )
		MG06MagnusSoundRef.Disable()
	endif

	;Bug #21688 - MS12b appears to have become stuck at some point believing that the player already had a BriarHeart. Time to reset the stuck part so they can grab a BriarHeart and get past it.
	if( MS12b.GetStage() == 30 )
		if( !MS12b.IsObjectiveCompleted(50) )
			if( MS12bScript.__done == True )
				MS12bScript.__done = false
			endif
		endif
	endif

	;Bug #19568 - Stop trespass warnings if you're made blood-kin to the orcs
	if( RelationshipOrcs.GetStageDone(100) == 1 )
		MorKhazgurLaraksLonghouse.SetPublic()
		NarzulburMauhulakhsLonghouse.SetPublic()
		DushnikhYalLonghouse.SetPublic()
	endif

	debug.trace( "USSEP 4.1.5 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 415
	Retro417.Process()
	Stop()
EndFunction
