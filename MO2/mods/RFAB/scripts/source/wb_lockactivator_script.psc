Scriptname WB_LockActivator_Script extends ObjectReference  

; -----

Quest Property WB_Unlock_Quest Auto
Float Property WB_Wait Auto

; -----

Event OnLoad()

	If !WB_Unlock_Quest.IsRunning() && !WB_Unlock_Quest.IsStopping()
		WB_Unlock_Quest.Start()
	EndIf
	Utility.Wait(WB_Wait)
	Delete()

EndEvent

; -----