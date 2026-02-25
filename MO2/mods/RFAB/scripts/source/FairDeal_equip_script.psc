Scriptname FairDeal_equip_script extends ObjectReference  

SPELL Property FairDeal_damage_self  Auto  
SPELL Property REQ_Blessing_Boethiah  Auto  

Event OnEquipped(Actor akActor)
	if (akActor.HasSpell(REQ_Blessing_Boethiah))
	akActor.addspell(FairDeal_damage_self)
	endif
endevent

Event OnUnequipped(Actor akActor)
	akActor.removespell(FairDeal_damage_self)
endevent


