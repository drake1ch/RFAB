Scriptname MRL_KELPI_PhaseThreeToFour extends ActiveMagicEffect  

Spell Property FirstSpell Auto
Spell Property SecondSpell Auto
Spell Property LastSpell Auto
Weapon Property BoundSwordRight Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.RemoveSpell(FirstSpell)
	akTarget.RemoveSpell(SecondSpell)
	akTarget.AddSpell(LastSpell, false)
	akTarget.AddItem(BoundSwordRight,1,true)
	akTarget.EquipItem(BoundSwordRight, true, true)

EndEvent