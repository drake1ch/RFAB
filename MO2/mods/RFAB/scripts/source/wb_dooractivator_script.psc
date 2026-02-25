Scriptname WB_DoorActivator_Script extends ObjectReference  

; -----

Quest Property WB_DoorFinder_Quest Auto

; -----

Event OnLoad()

	WB_DoorFinder_Quest.Start()
	Delete()

EndEvent

; -----