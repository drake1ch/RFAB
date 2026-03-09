Scriptname DLC2dunAliasMoveTrigger extends ObjectReference  
{Script that moves an Alias to linked ref if the Alias has not entered a previous trigger}

import utility
import debug

ReferenceAlias property myAlias auto
bool property myAliasHasEntered = false auto hidden
ObjectReference property myPreviousTrigger auto
bool doOnce = false

;******************************************************

Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		ObjectReference myMarker = getLinkedRef()
		DLC2dunAliasMoveTrigger myPrevTrigger = myPreviousTrigger as DLC2dunAliasMoveTrigger

		;UDBP 2.0.7 - Needs check to make sure variable isn't None
		if( myPrevTrigger != None )
			if(actorRef == game.getPlayer()) && (!doOnce)
				if (!myPrevTrigger.myAliasHasEntered)
					;Alias is falling behind, move to marker
					myAlias.getReference().moveTo(myMarker)
					doOnce = true
				endif
			endif
		EndIf

		if(actorRef == myAlias.getReference() as Actor)
			;my Alias has entered this trigger
			myAliasHasEntered = true
		endif
endevent

;******************************************************