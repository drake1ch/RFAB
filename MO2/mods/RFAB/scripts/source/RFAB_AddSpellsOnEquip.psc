Scriptname RFAB_AddSpellsOnEquip Extends ObjectReference

spell[] property spellsToAdd auto
bool property hiddenAdd = false auto
Event OnEquipped(Actor akActor)
	int i = 0
	while i < spellsToAdd.Length
		akActor.Addspell(spellsToAdd[i], hiddenAdd)
		i += 1
	endwhile
endEvent

Event OnUnequipped(Actor akActor)
	int i = 0
	while i < spellsToAdd.Length
		akActor.RemoveSpell(spellsToAdd[i])
		i += 1
	endwhile
endEvent