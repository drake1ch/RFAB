Scriptname RFAB_CastSpellOnDying extends ObjectReference  
Spell Property MySpell auto


Event OnDying(actor akKiller)
	
	utility.wait(1.0)
	MySpell.Cast(self)

EndEvent
