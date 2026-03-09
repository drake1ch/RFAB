Scriptname UDBP_Retroactive101Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive103Script Property Retro103 Auto

MagicEffect Property DLC2DragonAspectArmsEffect01 Auto
MagicEffect Property DLC2DragonAspectArmsEffect02 Auto
MagicEffect Property DLC2DragonAspectArmsEffect03 Auto
Armor Property DLC2DragonbornAspectArmor01 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 1.0.1 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 102
		Retro103.Process()
		Stop()
		Return
	EndIf

	;Bug #11943 - Dragon Aspect shout leaves behind stray fake armor.
	Actor Player = Game.GetPlayer()
	if( !Player.HasMagicEffect(DLC2DragonAspectArmsEffect01) && !Player.HasMagicEffect(DLC2DragonAspectArmsEffect02) && !Player.HasMagicEffect(DLC2DragonAspectArmsEffect03) )
		Player.RemoveItem(DLC2DragonbornAspectArmor01, 9999, true)
	EndIf
	
	debug.trace( "UDBP 1.0.1 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 102
	Retro103.Process()
	Stop()
EndFunction
