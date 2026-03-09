Scriptname USKPOnload02Script extends Quest

; USKP cleanup - Runs onload to perform retroactive fix tasks
Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPOnLoad04aScript Property Retro110 Auto

Quest Property MS11  Auto
Quest Property MS11b  Auto
Quest Property FreeformShorsStone01  Auto
ObjectReference Property redBellySpiderSwap  Auto
Quest Property Favor252  Auto
ObjectReference Property SolitudePlayerHouseDecorateGuestBedroom Auto
Quest Property T03PostQuest  Auto
ObjectReference Property TempleTreeDead  Auto
Quest Property DA04  Auto
Quest Property TG09  Auto
Quest Property TG09Post  Auto
Quest Property TG01  Auto
Actor Property NocturnalRef  Auto
Quest Property MS05  Auto
Quest Property MS05Start  Auto
Quest Property DA11Intro  Auto
Quest Property T01  Auto
Quest Property T01DegaineFavor  Auto
Quest Property T01Intro  Auto
Quest Property DA01Intro  Auto
Quest Property DA01  Auto
Quest Property C03  Auto
Actor Property SkjorREF  Auto
Actor Property KrevREF  Auto
ObjectReference Property CWGarrisonEnableMarkerImperialSolitude Auto
Quest Property Favor110 Auto
ReferenceAlias Property Alias_QuestGiver Auto
Quest Property FreeFormMorthalB Auto
Quest Property SolitudeFreeform01 Auto
GlobalVariable Property TG00BrandSheiJail  Auto  
Quest Property TG00SPArrest  Auto  
ReferenceAlias Property TG01HaelgaStatueAlias  Auto  
Actor Property BrandSheiREF Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.0 through 1.0.3 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 103
		Retro110.Process()
		Stop()
		Return
	EndIf
	
; ------------------------------ 1.03 ---------------------------------------
	; If Captain Aldis has been disabled when the Stormcloaks take Solitude, terminate his quests
	if CWGarrisonEnableMarkerImperialSolitude.IsDisabled() == 1
		if Favor110.IsObjectiveDisplayed(10) == 1
			if Favor110.IsObjectiveCompleted(10) == 0
				if Alias_QuestGiver.GetReference().IsDisabled() == 1
						Favor110.SetObjectiveFailed(10)
					Favor110.SetStage(200)
				endif
			endif
		endif
		 if FreeFormMorthalB.IsRunning() == 1
			if FreeFormMorthalB.GetStage() == 10
				FreeFormMorthalB.SetStage(255)
			else
				FreeFormMorthalB.Stop()
			endif
		endif
		if SolitudeFreeform01.IsRunning() == 1
			if ( SolitudeFreeform01.GetStage() == 10 ) || ( SolitudeFreeform01.GetStage() == 20 )
				SolitudeFreeform01.SetStage(200)
			else
				SolitudeFreeform01.Stop()
			endif
		endif
	endif

	; If the quest to bring Gorm's letter to Captain Aldis is running, show the quest objective
	if FreeFormMorthalB.GetStage() == 10
		if FreeFormMorthalB.IsObjectiveDisplayed(10) == 0
			FreeFormMorthalB.SetObjectiveDisplayed(10)
		endif
	endif

	; If Brand-Shei has been sent to jail permanently, release him
	if TG00SPArrest.GetStageDone(30) == 1
		if TG00BrandSheiJail.Value != 0
			TG00BrandSheiJail.Value = 0
			BrandSheiREF.EvaluatePackage()
		endif
	endif

	; Set Haelga's Statue of Dibella as a non-quest item if the initiation quest is completed
	if TG01.IsStageDone(45) == 1 || TG01.IsStageDone(47) == 1
		TG01HaelgaStatueAlias.Clear()
	endif
; ------------------------------ 1.01 ---------------------------------------
	; If Skjor has returned from the dead, eSkjort him back
		if C03.IsStageDone(30) == 1
			if SkjorREF.IsDead() == 0
				SkjorREF.MoveTo(KrevREF)
				SkjorREF.Kill()
			endif
		endif
; ------------------------------ 1.0 ---------------------------------------
	; If the Blood on the Ice quest is over, stop it
	if MS11.IsStageDone(250) == 1 || MS11b.IsStageDone(20) == 1
		MS11.Stop()
	endif

	; Clean up Redbelly Mine of spiders and detritus if the quest is done
	if FreeformShorsStone01.IsStageDone(200) == 1
		redBellySpiderSwap.Disable()
	endif

	;Enable housecarl bedroom in Proudspire if this stage is done
	if Favor252.IsStageDone(25) == 1
		if SolitudePlayerHouseDecorateGuestBedroom.IsDisabled() == 1
			SolitudePlayerHouseDecorateGuestBedroom.Enable()
		endif
	endif

	; Disable dead Gildergreen if quest done via sapling
	if T03PostQuest.IsStageDone(100) == 1
		if TempleTreeDead.IsDisabled() == 0
			TempleTreeDead.Disable()
		endif
	endif

	; Stop DA04 (Discerning the Transmundane) if complete so quest items can be dropped
	if DA04.GetStageDone(200) == 1
		DA04.Stop()
	endif

	; Stop TG09Post if questline completed
	if TG09.IsStageDone(200) == 1
		if TG09Post.IsStageDone(200) == 0
			if (NocturnalREF.GetParentCell() == Game.GetPlayer().GetParentCell()) == 0
				TG09Post.SetStage(200)
			endif
		endif
	endif		

	; Clear the "Investigate the Bards College" useless leftover quest objective if it exists
	if MS05.IsStageDone(75) == 1
 		if MS05Start.IsObjectiveDisplayed(10) == 1
 			if MS05Start.IsObjectiveCompleted(10) == 0
 				MS05Start.SetObjectiveCompleted(10,1)
	 		endif
 		endif
	endif

	; Clear the "Speak to Verulus" useless leftover quest objective if it exists
	if DA11Intro.IsStageDone(10) == 1
 		if DA11Intro.IsObjectiveDisplayed(5) == 1
 			if DA11Intro.IsObjectiveCompleted(5) == 0
 				DA11Intro.SetObjectiveCompleted(5,1)
 			endif
 		endif
	endif

	; Clear the "Speak to Dagaine" useless leftover quest objective if it exists
	if ( T01DegaineFavor.IsStageDone(10) == 1 ) || ( T01.GetStage() >= 60 )
 		if T01Intro.IsObjectiveDisplayed(10) == 1
 			if T01Intro.IsObjectiveCompleted(10) == 0
 				T01Intro.SetObjectiveFailed(10,1)
 				T01Intro.Stop()
 			endif
 		endif
	endif

	; Clear the "Visit the Shrine of Azura" useless leftover quest objective if it exists
	if DA01Intro.GetStage() == 10
		if DA01.IsStageDone(10) == 1
			DA01Intro.SetStage(100)
		endif
	endif

	debug.trace( "USKP 1.0 through 1.0.3 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 103
	Retro110.Process()
	Stop()
EndFunction
