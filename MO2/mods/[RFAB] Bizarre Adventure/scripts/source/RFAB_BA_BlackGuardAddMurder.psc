Scriptname RFAB_BA_BlackGuardAddMurder extends ActiveMagicEffect  

GlobalVariable Property Murders Auto 

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Murders.Mod(1.0)
EndEvent