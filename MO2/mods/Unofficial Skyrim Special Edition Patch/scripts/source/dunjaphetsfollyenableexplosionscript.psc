Scriptname dunJaphetsFollyEnableExplosionScript extends ObjectReference  
import Debug

objectReference Property Explosion01  Auto  
objectReference Property Explosion02  Auto  
objectReference Property Explosion03  Auto  

Bool HasFired = False

Event onTriggerEnter(ObjectReference TriggerRef)
	;Actor ActorRef = TriggerRef as Actor
	if (TriggerRef == game.GetPlayer() && HasFired == False)
	;if (TriggerRef == game.GetPlayer())
	;Notification("FIRE!!!")
		HasFired = True
		Explosion01.enable()
		;USKP 2.0.4 - explosion 2 & 3 may not exist.
		if( Explosion02 )
			Explosion02.enable()
		EndIf
		if( Explosion03 )
			Explosion03.enable()
		EndIf
		gotoState("hasBeenTriggered")
	endIf
endEvent

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

