Scriptname UDBP_Retroactive211Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive212Script Property Retro212 Auto

Formlist Property WICastDragonBornShouts Auto
Spell Property DLC2VoiceBattleFury01 Auto
Spell Property DLC2VoiceBattleFury02 Auto
Spell Property DLC2VoiceBattleFury03 Auto
Spell Property DLC2VoiceBendWill1 Auto
Spell Property DLC2VoiceBendWill2 Auto
Spell Property DLC2VoiceBendWill3 Auto
Spell Property DLC2VoiceCyclone01 Auto
Spell Property DLC2VoiceCyclone02 Auto
Spell Property DLC2VoiceCyclone03 Auto
Spell Property DLC2DragonAspectArmsSpell Auto
Spell Property DLC2DragonAspectBodySpell Auto
Spell Property DLC2DragonAspectHeadSpell Auto

Function Process()
	;Dragonborn shouts never added to "letter from a friend" list.
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBattleFury01) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBattleFury01)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBattleFury02) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBattleFury02)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBattleFury03) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBattleFury03)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBendWill1) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBendWill1)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBendWill2) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBendWill2)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceBendWill3) )
		WICastDragonBornShouts.AddForm(DLC2VoiceBendWill3)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceCyclone01) )
		WICastDragonBornShouts.AddForm(DLC2VoiceCyclone01)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceCyclone02) )
		WICastDragonBornShouts.AddForm(DLC2VoiceCyclone02)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2VoiceCyclone03) )
		WICastDragonBornShouts.AddForm(DLC2VoiceCyclone03)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2DragonAspectArmsSpell) )
		WICastDragonBornShouts.AddForm(DLC2DragonAspectArmsSpell)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2DragonAspectBodySpell) )
		WICastDragonBornShouts.AddForm(DLC2DragonAspectBodySpell)
	EndIf
	if( !WICastDragonBornShouts.HasForm(DLC2DragonAspectHeadSpell) )
		WICastDragonBornShouts.AddForm(DLC2DragonAspectHeadSpell)
	EndIf

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.1.1 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 211
		Retro212.Process()
		Stop()
		Return
	EndIf
	
	debug.trace( "UDBP 2.1.1 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 211
	Retro212.Process()
	Stop()
EndFunction
