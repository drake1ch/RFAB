Scriptname WB_Equalize_Script extends ActiveMagicEffect  

; ------

ImageSpaceModifier property WB_RestorationPeace_Imod_Equalize_Red auto
ImageSpaceModifier property WB_RestorationPeace_Imod_Equalize_Green auto

EffectShader Property Apoc_FXS_Red Auto
EffectShader Property Apoc_FXS_Green Auto

Float Property WB_ImodStrength Auto

Bool Property WB_Merge Auto

Actor Property PlayerRef Auto

Float Property WB_Mult Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float CasterHealthPct = akCaster.GetActorValuePercentage("Health")
	Float TargetHealthPct = akTarget.GetActorValuePercentage("Health")

	Float HealthDifferencePct = (TargetHealthPct - CasterHealthPct)

	Float CasterHealth = akCaster.GetActorValue("Health")
	Float TargetHealth = akTarget.GetActorValue("Health")

	Float CasterHealthDifferenceNew = Math.Abs(((CasterHealthPct + HealthDifferencePct) * CasterHealth/ CasterHealthPct) - CasterHealth)
	Float TargetHealthDifferenceNew = Math.Abs(((TargetHealthPct - HealthDifferencePct) * TargetHealth / TargetHealthPct) - TargetHealth)

	CasterHealthDifferenceNew *= WB_Mult
	TargetHealthDifferenceNew *= WB_Mult

	If (CasterHealthPct < TargetHealthPct && WB_Merge) || (CasterHealthPct > TargetHealthPct && !WB_Merge)
		Apoc_FXS_Green.Play(akCaster,2.0)
		Apoc_FXS_Red.Play(akTarget,2.0)

		akCaster.RestoreActorValue("Health",CasterHealthDifferenceNew)
		akTarget.DamageActorValue("Health",TargetHealthDifferenceNew)

		If akCaster == PlayerRef
			WB_RestorationPeace_Imod_Equalize_Green.Apply(WB_ImodStrength)
		ElseIf akTarget == PlayerRef
			WB_RestorationPeace_Imod_Equalize_Red.Apply(WB_ImodStrength)
		EndIf
	Else
		Apoc_FXS_Red.Play(akCaster,2.0)
		Apoc_FXS_Green.Play(akTarget,2.0)

		akCaster.DamageActorValue("Health",CasterHealthDifferenceNew)
		akTarget.RestoreActorValue("Health",TargetHealthDifferenceNew)

		If akCaster == PlayerRef
			WB_RestorationPeace_Imod_Equalize_Red.Apply(WB_ImodStrength)
		ElseIf akTarget == PlayerRef
			WB_RestorationPeace_Imod_Equalize_Green.Apply(WB_ImodStrength)
		EndIf
	EndIf

EndEvent

; ------