Scriptname VL_RangedModeScript extends activemagiceffect

GlobalVariable Property VL_RangedKillmove  Auto

GlobalVariable Property VL_RangedMode  Auto

import utility

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if(VL_RangedMode.GetValueInt() == 1 && VL_RangedKillmove.GetValueInt() != 0)
		VL_RangedKillmove.SetValueInt(2)
		SetINIBool("bVATSIgnoreProjectileTest:VATS", true)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if(VL_RangedMode.GetValueInt() == 1 && VL_RangedKillmove.GetValueInt() != 0)
		VL_RangedKillmove.SetValueInt(1)
		SetINIBool("bVATSIgnoreProjectileTest:VATS", false)
	elseif(VL_RangedMode.GetValueInt() == 1 && VL_RangedKillmove.GetValueInt() == 0)
		SetINIBool("bVATSIgnoreProjectileTest:VATS", false)
	endif
EndEvent