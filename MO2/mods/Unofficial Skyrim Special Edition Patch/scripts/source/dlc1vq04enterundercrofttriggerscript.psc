Scriptname DLC1VQ04EnterUndercroftTriggerScript extends ObjectReference  

ReferenceAlias Property Serana auto
DLC1VQ04RNPCQuestScript Property VQ04 auto

Event OnTriggerEnter(ObjectReference akActivator)
	Serana.GetReference().MoveTo(Game.GetPlayer())
	VQ04.LockSeranaIn()
	Disable() ;UDGP Bug #19195 - Can't delete until disabled first.
	Delete()
EndEvent
