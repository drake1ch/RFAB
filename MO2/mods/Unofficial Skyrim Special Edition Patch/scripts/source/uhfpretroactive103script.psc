Scriptname UHFPRetroactive103Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive110Script Property Retro110 Auto

Actor Property PlayerRef Auto

Quest Property BYOHHouseHjaalmarch Auto
WICourierScript Property WiCourier Auto
Book Property Charter Auto
Book Property BYOHHouseJarlFriendLetter  Auto  
Book Property BYOHHouseJarlIntroLetter  Auto 
ReferenceAlias Property CharterAlias Auto
BYOH_QF_BYOHHouseHjaalmarch_0100BE09 Property MorthalHouse Auto
GlobalVariable Property GameDaysPassed  Auto  

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 1.0.3 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 103
		Retro110.Process()
		Stop()
		Return
	EndIf

	;Bugzilla #8009 - Windstad Manor charter and courier were impossible to trigger due to missing properties.
	MorthalHouse.Charter = Charter
	MorthalHouse.WICourier = WICourier
	MorthalHouse.BYOHHouseJarlFriendLetter = BYOHHouseJarlFriendLetter
	MorthalHouse.BYOHHouseJarlIntroLetter = BYOHHouseJarlIntroLetter
	MorthalHouse.GameDaysPassed = GameDaysPassed
	
	if( BYOHHouseHjaalmarch.Getstage() >= 100 )
		ObjectReference CharterRef = PlayerRef.PlaceAtMe(Charter)
		CharterAlias.ForceRefTo(CharterRef)
		PlayerRef.AddItem(CharterRef)
	EndIf
	
	debug.trace( "UHFP 1.0.3 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 103
	Retro110.Process()
	Stop()
EndFunction
