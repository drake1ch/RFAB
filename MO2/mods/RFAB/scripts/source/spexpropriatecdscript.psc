Scriptname SPExpropriateCDScript extends activemagiceffect  
Actor Caster
Actor Target
Spell property thisspell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
RegisterforsingleupdateGametime(168)
endevent

Event onupdate()
caster.removespell(Thisspell)
endevent