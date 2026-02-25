Scriptname VoicePushEffectScript extends ActiveMagicEffect  

Event OnEffectStart(actor Target, actor Caster)
	if (Target.GetAV("HeavyArmorSkillAdvance")) < 100
		Caster.PushActorAway(Target, PushForce)
	endif
EndEvent

int Property PushForce  Auto  

