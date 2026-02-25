Scriptname RFAB_CombatDummy extends Actor

Event OnInit()
	EnableAI(false)
	SetDontMove()
	PO3_SKSEFunctions.PreventActorDetecting(self)
	IgnoreFriendlyHits()
	ForceActorValue("Health", 1000000.0)
EndEvent

Event OnLoad()
	MoveToMyEditorLocation()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	(Quest.GetQuest("RFAB_MCM_CombatDummies") as RFAB_MCM_CombatDummies).ShowConfig(self)
EndEvent