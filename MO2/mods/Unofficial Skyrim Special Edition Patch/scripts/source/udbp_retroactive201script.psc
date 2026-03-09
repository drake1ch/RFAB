Scriptname UDBP_Retroactive201Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive202Script Property Retro202 Auto

DLC2WB01QuestScript Property DLC2WB01 Auto
ReferenceAlias Property JournalChest Auto

DLC2_QF_DLC2MQ01_02017F8E Property DLC2MQ01 Auto
Quest Property DLC2CultistAmbush Auto
Quest Property DLC2WE09 Auto

DLC2WordWallTriggerScript Property WordWall Auto
Quest Property DLC2dunKolbjornQST Auto

Quest Property DLC2SV01 Auto
ReferenceAlias Property TriggerAlias Auto
ObjectReference Property TriggerBox Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.1 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 201
		Retro202.Process()
		Stop()
		Return
	EndIf
	
	;Bug #14357 - Filial Bonds did not have the journal chest property set.
	DLC2WB01.JournalChest = JournalChest
	
	;Bug #14121 - The CK munched our fix property for DLC2MQ01 so the cultists would not be cleaned up. Plus we have a second quest to squash now anyway.
	DLC2MQ01.DLC2CultistAmbush = DLC2CultistAmbush
	if( DLC2MQ01.GetStageDone(200) == 1 )
		if( DLC2CultistAmbush.IsRunning() )
			DLC2CultistAmbush.Stop()
		EndIf
		if( DLC2WE09.IsRunning() )
			DLC2WE09.Stop()
		EndIf
	EndIf
	
	;Bug #14523 - Kolbjorn had to be separated from an enable parent.
	if( DLC2dunKolbjornQST.GetStageDone(200) == 1 )
		if( !WordWall.WordLearned )
			WordWall.Enable()
		EndIf
	EndIf
	
	if( DLC2SV01.IsRunning() )
		if( DLC2SV01.GetStage() < 332 )
			TriggerAlias.ForceRefTo(TriggerBox)
		elseif( DLC2SV01.GetStage() == 332 )
			TriggerAlias.ForceRefTo(TriggerBox)
			TriggerBox.Enable()
		EndIf
	EndIf
	
	debug.trace( "UDBP 2.0.1 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 201
	Retro202.Process()
	Stop()
EndFunction
