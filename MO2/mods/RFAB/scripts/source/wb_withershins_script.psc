Scriptname WB_Withershins_Script extends activemagiceffect  

; -----

GlobalVariable Property WB_General_Global_XP Auto
Actor Property PlayerRef Auto
Float Property WB_Amount Auto
Keyword Property MagicRestoreHealth Auto

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If akEffect.HasKeyword(MagicRestoreHealth) && akCaster == PlayerRef
		Game.AdvanceSkill("Restoration", WB_General_Global_XP.GetValue() * WB_Amount)
	EndIf

EndEvent

; -----