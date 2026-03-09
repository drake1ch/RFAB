Scriptname USKPRetroactive207Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive208Script Property Retro208 Auto

Spell Property MGAppBSpell01 Auto
Quest Property MGRAppBrelyna01 Auto

Location Property SoljundsSinkholeLocation Auto
Location Property MarkarthLocation Auto
ObjectReference Property ImperialMarker Auto
ObjectReference Property StormcloakMarker Auto
Keyword Property CWOwner Auto

MS08QuestScript Property MS08 Auto
GlobalVariable Property FavorRewardLarge Auto

Location Property MarkarthOgmundsHouseLocation Auto
Location Property RiftenRomlynDrethsHouseLocation Auto
Location Property RiftenValindorsHouseLocation Auto
Location Property RiftenMariseAravelsHouseLocation Auto
Location Property WhiterunUthgerdTheUnbrokensHouseLocation Auto
Location Property RiftenHouseofMjolltheLionessLocation Auto
Location Property RiftenHouseofClanSnowShodLocation Auto
Location Property RiftenBolliHouseLocation Auto
Location Property WindhelmViolaGiordanosHouseLocation Auto
Location Property WindhelmHouseOfClanShatterShieldLocation Auto
Location Property WindhelmBrunwulfFreeWintersHouseLocation Auto
Location Property WindhelmBelynHlaalusHouseLocation Auto
Location Property WindhelmAtheronResidenceLocation Auto
Location Property SolitudeHalloftheDeadLocation Auto
Location Property SolitudeJalasHouseLocation Auto
Location Property SolitudeVittoriaVicisHouseLocation Auto
Location Property SolitudeEvetteSansHouseLocation Auto
Location Property SolitudeBrylingsHouseLocation Auto
Location Property SolitudeAddvarsHouseLocation Auto
Location Property WhiterunYsoldasHouseLocation Auto
Location Property WhiterunHouseofClanBattleBornLocation Auto
Location Property WhiterunHouseGrayManeLocation Auto
Location Property WhiterunCarlottaValentiasHouseLocation Auto
Location Property WhiterunAmrensHouseLocation Auto
Location Property MarkarthNepossHouseLocation Auto
Location Property MarkarthTreasuryHouseLocation Auto
Location Property MarkarthSmelterOverseersHouseLocation Auto
Keyword Property TGWealthyHome Auto

Quest Property MGR10 Auto
MGR10ClientScript Property MGR10Client Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.7 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 207
		Retro208.Process()
		Stop()
		Return
	EndIf

	;Bug #17133: Handled the failsafe wrong. Oops.
	if( Game.GetPlayer().HasSpell(MGAppBSpell01) )
		Game.GetPlayer().RemoveSpell(MGAppBSpell01)
		Utility.Wait(2)
		MGRAppBrelyna01.SetStage(200) ;The above removespell call will set stage 30 again.
	EndIf

	;Bug #17247 - Soljund's Sinkhole does not convert garrison data properly.
	if( MarkarthLocation.GetKeywordData(CWOwner) == 2 )
		SoljundsSinkholeLocation.SetKeywordData(CWOwner, 2)
		ImperialMarker.Disable()
		StormcloakMarker.Enable()
	EndIf

	;Bug #17147 - Missing FavorRewardLarge property on MS08
	MS08.FavorRewardLarge = FavorRewardLarge

	;Bug #17349 - Vex would not hand out more jobs due to keyword data not being reset properly.
	MarkarthOgmundsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenRomlynDrethsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenValindorsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenMariseAravelsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunUthgerdTheUnbrokensHouseLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenHouseofMjolltheLionessLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenHouseofClanSnowShodLocation.SetKeywordData(TGWealthyHome, 0)
	RiftenBolliHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WindhelmViolaGiordanosHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WindhelmHouseOfClanShatterShieldLocation.SetKeywordData(TGWealthyHome, 0)
	WindhelmBrunwulfFreeWintersHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WindhelmBelynHlaalusHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WindhelmAtheronResidenceLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeHalloftheDeadLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeJalasHouseLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeVittoriaVicisHouseLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeEvetteSansHouseLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeBrylingsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	SolitudeAddvarsHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunYsoldasHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunHouseofClanBattleBornLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunHouseGrayManeLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunCarlottaValentiasHouseLocation.SetKeywordData(TGWealthyHome, 0)
	WhiterunAmrensHouseLocation.SetKeywordData(TGWealthyHome, 0)
	MarkarthNepossHouseLocation.SetKeywordData(TGWealthyHome, 0)
	MarkarthTreasuryHouseLocation.SetKeywordData(TGWealthyHome, 0)
	MarkarthSmelterOverseersHouseLocation.SetKeywordData(TGWealthyHome, 0)

	;Bug #17370 - MGR10 will stall if the client dies before receiving the quest
	if( MGR10.IsRunning() && MGR10.GetStage() <= 10 )
		if( MGR10Client.GetActorReference().IsDead() )
			MGR10Client.OnDeath(None)
		EndIf
	EndIf

	debug.trace( "USKP 2.0.7 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 207
	Retro208.Process()
	Stop()
EndFunction
