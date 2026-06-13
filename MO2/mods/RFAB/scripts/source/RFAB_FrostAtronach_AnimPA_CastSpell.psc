Scriptname RFAB_FrostAtronach_AnimPA_CastSpell extends ActiveMagicEffect

; -----

Spell Property SpellToCast Auto

; -----

Actor Caster
Bool IsSpellReleased

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster 
	RegisterForAnimationEvent(Caster, "attackStop")	
	
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If !IsSpellReleased && (akSource as Actor) == Caster && asEventName == "attackStop"
		SpellToCast.Cast(Caster)
		IsSpellReleased = true
		Utility.Wait(1.5)
		Caster.Kill()
	EndIf
EndEvent

Event OnUpdate()
	If !IsSpellReleased
		RunPowerAttack()
		RegisterForSingleUpdate(0.5)
	EndIf
endEvent

Bool Function RunPowerAttack()
	Caster.SetDontMove(true)
	Debug.SendAnimationEvent(Caster as ObjectReference, "attackPowerStart_PowerAttack_L1")
	Utility.Wait(1.8)
EndFunction