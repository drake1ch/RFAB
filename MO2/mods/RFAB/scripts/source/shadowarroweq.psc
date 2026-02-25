scriptName ShadowArrowEq extends ObjectReference

Ammo property ShadowArrow auto

Function OnEquipped(Actor akActor)

	akActor.additem(ShadowArrow as form, 1, true)
	akActor.equipItem(ShadowArrow as form, true, true)
endFunction

Function OnUnequipped(Actor akActor)

	akActor.removeitem(ShadowArrow as form, akActor.getItemCount(ShadowArrow as form), true, none)
endFunction