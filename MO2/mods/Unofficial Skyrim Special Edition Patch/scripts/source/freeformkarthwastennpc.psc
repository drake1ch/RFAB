ScriptName FreeformKarthwastenNPC extends ReferenceAlias

ReferenceAlias Property Ainethach Auto

;USKP 2.0.7 - Killing Atar before formally being given the quest should still make the villagers happy (stage 100)
Event OnDeath(Actor akKiller)

	If (GetOwningQuest().GetStageDone(20) == 1)
		GetOwningQuest().SetStage(25)
	Else
		If (Ainethach.GetActorReference().IsDead() == True)
			GetOwningQuest().SetStage(300)
		Else
			GetOwningQuest().SetStage(100)
		EndIf
	EndIf
EndEvent 