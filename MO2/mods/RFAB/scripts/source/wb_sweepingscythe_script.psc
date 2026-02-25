Scriptname WB_SweepingScythe_Script extends ActiveMagicEffect  

; -----

FormList Property WB_IllusionNightmare_FormList_SweepingScythe Auto
GlobalVariable Property WB_Illusion_Reave_Global_Percentage Auto
GlobalVariable Property WB_Illusion_SweepingScythe_Global_XP Auto
VisualEffect Property WB_IllusionNightmare_VFX_SweepingScythe Auto
ImagespaceModifier Property WB_IllusionNightmare_Imod_ReaveKill Auto
Actor Property PlayerRef Auto

; -----

Actor ExtractedTarget
Int i
Actor TheCaster
Float DamageFraction

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	DamageFraction = WB_Illusion_Reave_Global_Percentage.GetValue() / 100
	Utility.Wait(0.1)
	WB_IllusionNightmare_FormList_SweepingScythe.AddForm(akTarget)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_IllusionNightmare_FormList_SweepingScythe.RemoveAddedForm(akTarget)

EndEvent

; -----

Event OnDying(Actor akKiller)

	Float DamageDealt
	i = 0
	While i < WB_IllusionNightmare_FormList_SweepingScythe.GetSize()
		ExtractedTarget = WB_IllusionNightmare_FormList_SweepingScythe.GetAt(i) as Actor
		If ExtractedTarget.GetDistance(TheCaster) < 8192
			WB_IllusionNightmare_VFX_SweepingScythe.Play(ExtractedTarget, 2.5)
			DamageDealt = (ExtractedTarget.GetActorValue("Health")/ExtractedTarget.GetActorValuePercentage("Health")) * DamageFraction
			ExtractedTarget.DamageActorValue("Health", DamageDealt)
			If TheCaster == PlayerRef
				Game.AdvanceSkill("Illusion", DamageDealt * WB_Illusion_SweepingScythe_Global_XP.GetValue())
			EndIf
		Else
			WB_IllusionNightmare_FormList_SweepingScythe.RemoveAddedForm(ExtractedTarget)
		EndIf
		i += 1
	EndWhile

EndEvent

; -----
