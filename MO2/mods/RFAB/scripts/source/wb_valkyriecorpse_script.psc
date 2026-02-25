Scriptname WB_ValkyrieCorpse_Script extends ActiveMagicEffect  

; ------

VisualEffect Property WB_RestorationHeal_VFX_Valkyrie Auto
Spell Property WB_S_R100_Valkyrie_Spell_Heal Auto
ImpactDataSet Property WB_RestorationHeal_ImpactSet Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akCaster
		akCaster == PlayerRef
	EndIf
	akTarget.PlayImpactEffect(WB_RestorationHeal_ImpactSet)
	WB_RestorationHeal_VFX_Valkyrie.Play(akTarget)
	Utility.Wait(0.5)

	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
	akTarget.SetAlpha (0.0,True)
	akTarget.AttachAshPile()
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
	WB_S_R100_Valkyrie_Spell_Heal.Cast(akCaster)

EndEvent

; ------
