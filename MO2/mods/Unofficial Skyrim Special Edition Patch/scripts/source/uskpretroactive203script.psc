Scriptname USKPRetroactive203Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive204Script Property Retro204 Auto

CWScript Property CW Auto
Location Property WhiterunLocation Auto
Keyword Property CWOwner Auto
Actor Property Heimskr Auto
Quest Property WhiterunHeimskrPreachScene Auto
Outfit Property MonkOutfit Auto
ObjectReference Property HeimskrPreachSpot Auto
ObjectReference Property CWHeimskrNewHome Auto
Quest Property USLEEPHeimskrPreachJail Auto

Spell Property SailorsRepose Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.3 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 203
		Retro204.Process()
		Stop()
		Return
	EndIf

	;Bug #14878 - Sailor's Repose leaves permanent icon on the UI
	if( Game.GetPlayer().HasSpell(SailorsRepose) )
		Game.GetPlayer().RemoveSpell(SailorsRepose)
		Game.GetPlayer().AddSpell(SailorsRepose)
	EndIf
	
	;Once more unto the breech, my good man!
	;Bug #12116 [Take 477] - Heimskr switched to prison robes prematurely when Stormcloaks take Whiterun
	( (Heimskr as ObjectReference) as pHeimskrScript).pHeimskrPreach = 0
	USLEEPHeimskrPreachJail.Stop()
	WhiterunHeimskrPreachScene.Stop()
	Heimskr.SetOutfit(MonkOutfit)
	Heimskr.SetRelationshipRank(Game.GetPlayer(), 0)
	Heimskr.MoveTo(HeimskrPreachSpot)
	Heimskr.EvaluatePackage()

	Utility.Wait(2)
	
	if( CW.WhiterunSiegeFinished == True )
		if( WhiterunLocation.GetKeywordData(CWOwner) == 1 )
			;Bug #12130 - Heimskr doesn't need his tent if the Imperials jailed him.
			USLEEPHeimskrPreachJail.Start()
		Else
			CWHeimskrNewHome.Enable()
		EndIf
	EndIf
	
	debug.trace( "USKP 2.0.3 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 203
	Retro204.Process()
	Stop()
EndFunction
