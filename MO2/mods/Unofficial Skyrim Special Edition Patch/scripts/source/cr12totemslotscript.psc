Scriptname CR12TotemSlotScript extends ObjectReference  

Quest Property CR12 auto
ObjectReference Property TotemTarget auto

Event OnActivate(ObjectReference akActivator)
	if (CR12.GetStage() == 20)
		TotemTarget.Enable()
		Utility.Wait(1) ; USKP 2.0.1 - Short delay between enabling and starting havok to give the game time to catch up first.
		TotemTarget.SetMotionType(Motion_Keyframed)
		CR12.SetStage(100)
		Disable()
	endif
EndEvent
