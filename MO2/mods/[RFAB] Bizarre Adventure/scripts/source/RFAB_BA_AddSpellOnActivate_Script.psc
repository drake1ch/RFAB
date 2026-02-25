Scriptname RFAB_BA_AddSpellOnActivate_Script extends ObjectReference  

Bool Property DoOnce = False Auto
Spell[] Property SpellToAdd Auto

bool activated

Event OnActivate(ObjectReference akActionRef)

	if DoOnce && activated == true
		return
	endif

	if akActionRef == Game.GetPlayer()
		int i = 0
		while i < SpellToAdd.length
			Game.GetPlayer().AddSpell(SpellToAdd[i])
			i+=1
		endwhile
		activated  = true
	endif

EndEvent
