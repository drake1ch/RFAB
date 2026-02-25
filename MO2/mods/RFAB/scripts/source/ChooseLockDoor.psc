Scriptname ChooseLockDoor extends ObjectReference
import Debug
import Utility
Int property LockLevel auto

ObjectReference Property door01 Auto
bool Property Doonce = true Auto
;ObjectReference Property TriggerRef Auto

default2StateActivator door01Script
bool done = false
event OnLoad()
    door01Script = door01 as default2StateActivator
endEvent

event onTriggerEnter(objectreference TriggerRef)
if(!done)
;    Notification("Enter Trigger")
    if (TriggerRef == game.getPlayer())
        int openState = door01.GetOpenState()
        if (openState == 1 || openState == 2)
            door01.Activate(self)
        endif
        if (Doonce)
          done = true
        endif
        door01.Lock()
        door01.SetLockLevel(LockLevel)
    endif
endif
endEvent