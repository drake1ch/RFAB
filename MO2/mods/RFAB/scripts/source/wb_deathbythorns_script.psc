Scriptname WB_DeathByThorns_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
GlobalVariable Property WB_Restoration_HeartOfThorns_Global_Threshold Auto
String Property WB_Stat Auto

; -----

Actor TargetActor
Float StartingHealthFraction

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	StartingHealthFraction = akTarget.GetActorValuePercentage(WB_Stat)
	OnUpdate()

EndEvent

; -----

Event OnUpdate()

	If (TargetActor.GetActorValuePercentage(WB_Stat) + WB_Restoration_HeartOfThorns_Global_Threshold.GetValue()) >= StartingHealthFraction
		RegisterForSingleUpdate(WB_UpdateRate)
	Else
		Dispel()
	EndIf

EndEvent

; -----