Scriptname WB_CurseOfTheSilent_Script extends ActiveMagicEffect  

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) && (TheTarget.GetEquippedSpell(0) == akSpell || TheTarget.GetEquippedSpell(1) == akSpell)	; preventing auto-cast spells from triggering this
		Dispel()
	EndIf

EndEvent

; -----