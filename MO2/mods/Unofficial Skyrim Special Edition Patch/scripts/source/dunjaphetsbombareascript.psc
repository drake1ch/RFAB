Scriptname dunJaphetsBombAreaScript extends ObjectReference  
import debug
import utility

ObjectReference Property Bomber01  Auto  
ObjectReference Property Bomber02  Auto  
ObjectReference Property Bomber03  Auto  
Quest Property pQuest Auto ;USKP 2.1.0 Bug #18754

bool inTrigger = False

event onTriggerEnter(ObjectReference TriggerRef)
	if (TriggerRef == game.getPlayer())
		;USKP 2.1.0 Bug #18754
		if( pQuest.GetStage() < 80 )
			inTrigger = True
			startBombing()
		endif
	endif
endEvent

event onTriggerLeave(ObjectReference TriggerRef)
	if (TriggerRef == game.getPlayer())
		inTrigger = False
	endif
endEvent

function startBombing()
	;Notification("Start Bombing!!!")
	Bomber01.enable()
	Bomber02.enable()
	Bomber03.enable()
	continueBombing()
endFunction

function continueBombing()
	wait(3.0)
	if (inTrigger == False)
		stopBombing()
	else
		;Notification("Continue Bombing!!!")
		continueBombing()
	endif
endFunction

function stopBombing()
	;Notification("Stop Bombing!!!")
	Bomber01.disable()
	Bomber02.disable()
	bomber03.disable()
endFunction
