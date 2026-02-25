Scriptname WB_CascadeEffect_Script extends ActiveMagicEffect  

; -----

Spell Property WB_SpellToCast Auto
Int Property WB_StartThreshold Auto
Keyword Property MagicDamageFire Auto
Int Property WB_Hand Auto

; -----

Int SpellsCast
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	TheTarget = akTarget
	SpellsCast = 0

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(MagicDamageFire) && TheTarget.GetEquippedSpell(WB_Hand) == akSpell
		SpellsCast += 1
		If SpellsCast >= WB_StartThreshold
			WB_SpellToCast.RemoteCast(TheTarget,TheCaster)
		EndIf
	EndIf

EndEvent

; -----