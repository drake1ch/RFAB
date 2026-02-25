Scriptname FZR_TyranusControl extends ObjectReference  

Keyword Property ArmorKeyword Auto

Perk Property CursePerk auto

Event OnEquipped(Actor akActor)	
	if (akActor == Game.GetPlayer())
		akActor.RemovePerk(CursePerk)
		Utility.Wait(1)
		akActor.AddPerk(CursePerk)
	endif
EndEvent

Event OnUnEquipped(Actor akActor)
	Utility.Wait(1)
	if !akActor.WornHasKeyword(ArmorKeyword) && akActor == Game.GetPlayer()
		akActor.RemovePerk(CursePerk)
	endif
EndEvent