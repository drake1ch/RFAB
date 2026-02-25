Scriptname tbmChrysamereEquipScript extends ObjectReference  
{Responsible for adding/removing the passive Chrysamere ability.}

Spell Property ChrysamereAbility auto

Event OnEquipped(Actor akActor)
	akActor.AddSpell(ChrysamereAbility, false)
EndEvent

Event OnUnEquipped(Actor akActor)
	akActor.RemoveSpell(ChrysamereAbility)
EndEvent