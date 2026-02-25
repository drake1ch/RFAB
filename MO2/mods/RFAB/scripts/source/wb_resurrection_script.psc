Scriptname WB_Resurrection_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Restoration_Resurrection_Global_XP Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
Spell Property WB_S_R100_Resurrection_Spell Auto

; -----

Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_S_R100_Resurrection_Spell.RemoteCast(akTarget,akCaster)
	Utility.Wait(5)
	If akCaster == Game.GetPlayer()
		Game.AdvanceSkill("Restoration",akTarget.GetAV("Health") * WB_Restoration_Resurrection_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
	EndIf

EndEvent

; -----