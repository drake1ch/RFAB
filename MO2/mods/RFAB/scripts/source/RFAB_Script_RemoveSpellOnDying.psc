Scriptname RFAB_Script_RemoveSpellOnDying extends ObjectReference  

SPELL Property MySpell auto

Event OnDeath(Actor akKiller)
Game.GetPlayer().RemoveSpell(MySpell)
endevent