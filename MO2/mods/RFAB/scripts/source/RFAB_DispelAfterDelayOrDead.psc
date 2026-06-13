scriptName RFAB_DispelAfterDelayOrDead extends ActiveMagicEffect

; -----

Float Property Delay Auto

Bool isActive = true
Actor Enemy

; -----

Event OnEffectStart(Actor Target, Actor Caster)
	Enemy = Target
	
	RegisterForSingleUpdate(0.1)
	Utility.Wait(Delay)
	If isActive
		Self.Dispel()
		isActive = false
	EndIf
	
endEvent

Event OnUpdate()
	If isActive
		if Enemy.IsDead()
			Self.Dispel()
			isActive = false
		Else
			RegisterForSingleUpdate(0.1)
		EndIf
	EndIf
endEvent