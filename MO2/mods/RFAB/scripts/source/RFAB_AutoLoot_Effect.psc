ScriptName RFAB_AutoLoot_Effect extends ActiveMagicEffect

RFAB_AutoLoot Property AutoLoot Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.IsCommandedActor() || RFAB_PapyrusFunctions.IsSummonedActor(akTarget)
		return
	endif

	AutoLoot.AddToStack(akTarget)
EndEvent