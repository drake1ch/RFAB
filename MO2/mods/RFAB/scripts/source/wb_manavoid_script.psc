Scriptname WB_ManaVoid_Script extends ActiveMagicEffect  

; -----

Float Property WB_KillMargin Auto
GlobalVariable Property WB_Illusion_MagickaVoid_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float HealthPct = akTarget.GetActorValuePercentage("Health")
	Float Health = akTarget.GetActorValue("Health")
	Float HealthPctDiff = HealthPct - akTarget.GetActorValuePercentage("Magicka")
	If HealthPctDiff > 0 && HealthPct != 0.0
		Float HealthMax = Health / HealthPct
		Float DamageDealt = HealthMax * HealthPctDiff
		If DamageDealt > Health - 1.0
			DamageDealt = Health - 1.0
		EndIf
		akTarget.DamageActorValue("Health", DamageDealt)
		If akCaster == PlayerRef
			Game.AdvanceSkill("Illusion", DamageDealt * WB_Illusion_MagickaVoid_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf
	EndIf

EndEvent

; -----