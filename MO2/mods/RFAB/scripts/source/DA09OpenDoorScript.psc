Scriptname DA09OpenDoorScript extends ObjectReference  

ObjectReference Property door01 Auto

default2StateActivator door01Script

event OnLoad()
	door01Script = door01 as default2StateActivator
endEvent

event onTriggerEnter(objectreference TriggerRef)
	if (TriggerRef == game.getPlayer())
		int openState = door01.GetOpenState()
		if (openState == 3 || openState == 4)
			door01.Activate(self)
		endif
		door01.Lock(false)
	endif
endEvent