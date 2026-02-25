Scriptname WB_Whisperwind_Self_Script extends activemagiceffect  

; -----

ReferenceAlias Property WB_Bonded_Target Auto
Message Property WB_ConjurationSummon_Message_BondOfSummoning_Saved Auto
Quest Property WB_BondOfSummoning_Quest Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_BondOfSummoning_Quest.Start()
	WB_Bonded_Target.ForceRefTo(akTarget)
	WB_ConjurationSummon_Message_BondOfSummoning_Saved.Show()

EndEvent

; -----