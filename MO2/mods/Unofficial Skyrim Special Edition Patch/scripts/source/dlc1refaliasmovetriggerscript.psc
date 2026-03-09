Scriptname DLC1RefAliasMoveTriggerScript extends ObjectReference
;Once player enters trigger, if linkedRef (trigger) is not disabled, move RefAlias to marker
import utility
import debug

ReferenceAlias property myRefAlias auto
ObjectReference property myMarker auto
Quest property myQuest auto
{optional - prereq quest}
Int property myStage auto
{optional - prereq quest stage}
ObjectReference property otherTrigger01 auto
{optional - if similar triggers need to be disabled}
ObjectReference property otherTrigger02 auto
{optional - if similar triggers need to be disabled}
ObjectReference property otherTrigger03 auto
{optional - if similar triggers need to be disabled}

;************************************

function MoveAlias()
	gotoState("done")
	(myRefAlias.getReference() as Actor).moveto(myMarker)
	;UDGP 2.0.2 - No sanity checks on optional parameters.
	if( otherTrigger01 )
		otherTrigger01.disable()
	EndIf
	if( otherTrigger02 )
		otherTrigger02.disable()
	EndIf
	if( otherTrigger03 )
		otherTrigger03.disable()
	EndIf
endFunction

auto State waiting
	Event onTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == game.GetPlayer())
			ObjectReference myLink = getLinkedRef()
			if(!myLink.isDisabled())
				if(myQuest)
					if(myQuest.getStage() >= myStage)
						MoveAlias()
					endif
				else
					MoveAlias()
				endif
			endif
		endif
	endEvent
endState

;************************************

State done
	;do Nothing
endState
;************************************
