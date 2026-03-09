Scriptname SilverSwordScript extends ObjectReference  
;Script modified by USKP 2.0.2. Silver weapon perk does not need to constantly be added or removed in order to function.
;This also fixes a bug where dual-wielding and then unequipping one silver weapon would remove the perk even if another silver weapon was still equipped.

Perk Property SilverPerk auto

Event OnEquipped(Actor akActor)
	if( !akActor.HasPerk(SilverPerk) )
		akActor.AddPerk(SilverPerk)
	EndIf
EndEvent

Event OnUnEquipped(Actor akActor)
	;akActor.RemovePerk(SilverPerk)
EndEvent 