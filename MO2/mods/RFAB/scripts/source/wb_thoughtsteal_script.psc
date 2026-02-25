Scriptname WB_Thoughtsteal_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto

; -----

Spell Spell0
Spell Spell1
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster

	Spell EquippedSpell

	EquippedSpell = akTarget.GetEquippedSpell(0)
	If EquippedSpell
		akCaster.EquipSpell(EquippedSpell,0)
		Spell0 = EquippedSpell
	EndIf

	EquippedSpell = akTarget.GetEquippedSpell(1)
	If EquippedSpell
		akCaster.EquipSpell(EquippedSpell,1)
		Spell1 = EquippedSpell
	EndIf

	If !Spell0 && !Spell1
		Dispel()
	EndIf

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If Spell0 && !akCaster.HasSpell(Spell0)
		akCaster.UnequipSpell(Spell0,0)
	EndIf

	If Spell1 && !akCaster.HasSpell(Spell1)
		akCaster.UnequipSpell(Spell1,1)
	EndIf

EndEvent

; -----

Event OnUpdate()

	If (!Spell0 || TheCaster.GetEquippedSpell(0) != Spell0) && (!Spell1 || TheCaster.GetEquippedSpell(1) != Spell1)
		Dispel()
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----