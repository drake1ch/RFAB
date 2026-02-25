Scriptname WB_Undermine_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_A050_Undermine_Spell_PC Auto
GlobalVariable Property WB_Alteration_Undermine_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto
Actor Property PlayerRef Auto

; -----

Actor TargetActor
Actor CasterActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster
	RegisterForAnimationEvent(TargetActor, "HitFrame")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == TargetActor

		WB_S_A050_Undermine_Spell_PC.Cast(TargetActor)
		If CasterActor == PlayerRef
			Game.AdvanceSkill("Alteration", WB_Alteration_Undermine_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf

	EndIf

EndEvent

; -----