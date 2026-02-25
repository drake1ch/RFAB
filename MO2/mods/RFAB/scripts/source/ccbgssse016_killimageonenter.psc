;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_KillImageOnEnter.psc
Modified : 2019-01-04 11:13:05
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_KillImageOnEnter extends ObjectReference
{Kill Umbra's soul image, and set the appropriate quest stage.}

;-- Properties --------------------------------------
actor property ImageRef auto
Int property myStage auto
quest property myQuest auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnTriggerEnter(ObjectReference akActionRef)

	self.GotoState("done")
	ImageRef.Kill(none)
	if myQuest
		myQuest.SetStage(myStage)
	endIf
	self.Disable(false)
endFunction

;-- State -------------------------------------------
state done

	function OnTriggerEnter(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
