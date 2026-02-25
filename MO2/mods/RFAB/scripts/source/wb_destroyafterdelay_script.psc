Scriptname WB_DestroyAfterDelay_Script extends ObjectReference  

; -----

Float Property WB_Delay Auto

; -----

Event OnLoad()

	Utility.Wait(WB_Delay)
	Disable()
	Delete()

EndEvent

; -----