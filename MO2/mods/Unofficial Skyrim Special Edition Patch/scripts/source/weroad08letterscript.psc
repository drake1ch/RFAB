Scriptname WERoad08LetterScript extends ObjectReference  

quest property weroad08 auto

auto state waiting

event onread()
	;USKP 2.1.3 Bug #18316 - Quest may be dead.
	if( weroad08.IsRunning() )
		weroad08.setstage(100)
	EndIf
	gotostate("done")
endEvent

endState

state done
;do nothing
endstate

