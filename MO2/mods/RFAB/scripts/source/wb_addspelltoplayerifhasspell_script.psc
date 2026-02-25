Scriptname WB_AddSpellToPlayerIfHasSpell_Script extends activemagiceffect  

; -----

Spell Property WB_Spell Auto
Spell Property WB_HasSpell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer() && akCaster.HasSpell(WB_HasSpell)
		Game.GetPlayer().AddSpell(WB_Spell)
	EndIf

EndEvent

; -----