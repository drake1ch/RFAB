Scriptname WB_LambOfMara_Script extends activemagiceffect  

; -----

Float Property WB_Mult Auto
Float Property WB_UpdateRate Auto
GlobalVariable Property WB_Restoration_LambOfMara_Global_XP Auto
Actor Property PlayerRef Auto
Perk Property Respite Auto

; -----

Actor TargetActor
Actor CasterActor
Float PreviousHealth
Float TargetMRMult

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster

	TargetMRMult = (100 - akTarget.GetActorValue("MagicResist")) / 100
	If TargetMRMult < 0
		TargetMRMult = 0
	EndIf

	PreviousHealth = akTarget.GetActorValue("Health")
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	Float CurrentHealth = TargetActor.GetActorValue("Health")
	Float HealthDelta = (PreviousHealth - CurrentHealth) * WB_Mult * TargetMRMult
	If HealthDelta > 0
		CasterActor.RestoreActorValue("Health", HealthDelta)
		If CasterActor.HasPerk(Respite)
			CasterActor.RestoreActorValue("Stamina", HealthDelta)
		EndIf
	EndIf
	PreviousHealth = CurrentHealth

	If !TargetActor || TargetActor.IsDead()
		Dispel()
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

	If CasterActor == PlayerRef && HealthDelta > 0
		Game.AdvanceSkill("Restoration", HealthDelta * WB_Restoration_LambOfMara_Global_XP.GetValue())
	EndIf

EndEvent

; -----