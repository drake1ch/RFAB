Scriptname WB_ValkyrieCorpse_Script extends ActiveMagicEffect  

VisualEffect Property WB_RestorationHeal_VFX_Valkyrie Auto
ImpactDataSet Property WB_RestorationHeal_ImpactSet Auto

Actor _victim

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_victim = akTarget
EndEvent

Event OnDying(Actor akKiller)
	_victim.PlayImpactEffect(WB_RestorationHeal_ImpactSet)
	WB_RestorationHeal_VFX_Valkyrie.Play(_victim)
	Utility.Wait(0.5)
	_victim.SetCriticalStage(_victim.CritStage_DisintegrateStart)
	_victim.AttachAshPile()
	_victim.SetCriticalStage(_victim.CritStage_DisintegrateEnd)
EndEvent