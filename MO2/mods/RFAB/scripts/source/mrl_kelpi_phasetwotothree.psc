Scriptname MRL_KELPI_PhaseTwoToThree extends ActiveMagicEffect  

Weapon Property BoundSwordRight Auto
Weapon Property BoundSwordLeft Auto
Spell Property FirstSpell Auto
Spell Property SecondSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.RemoveItem(BoundSwordRight,akTarget.GetItemCount(BoundSwordRight),true)
	akTarget.RemoveItem(BoundSwordLeft,akTarget.GetItemCount(BoundSwordLeft),true)
	akTarget.AddSpell(FirstSpell, false)
	akTarget.AddSpell(SecondSpell, false)

EndEvent