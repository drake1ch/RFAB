Scriptname WB_BondOfSummoning_Proc_Script extends activemagiceffect  

; ------

Float Property WB_Duration Auto
Actor Property PlayerRef Auto

; ------

Actor TargetActor

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	RegisterForSingleUpdate(WB_Duration)

EndEvent

; ------

Event OnUpdate()

	Dispel()

EndEvent

; -----

Event OnDying(Actor akKiller)

	If TargetActor && TargetActor.IsHostileToActor(PlayerRef)
		TargetActor.SendAssaultAlarm()
	EndIf

EndEvent

; -----