scriptName RFAB_StopBlock extends ActiveMagicEffect

idle property StopBlockIdle auto
spell property StopBlockSpell auto

function OnEffectStart(actor akTarget, actor akCaster)
	Utility.wait(1.5)
		if akCaster.GetAnimationVariableBool("IsBlocking")
			akCaster.PlayIdle(StopBlockIdle)
		endIf
	StopBlockSpell.Cast(akCaster)
endFunction