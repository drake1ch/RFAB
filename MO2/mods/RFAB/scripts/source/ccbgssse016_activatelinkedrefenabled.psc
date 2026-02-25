;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_ActivateLinkedRefEnabled.psc
Modified : 2019-01-04 11:13:05
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_ActivateLinkedRefEnabled extends ObjectReference
{Activate the linked ref when activated, if this ref is enabled.}

;-- Properties --------------------------------------
Bool property DoOnce = false auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnActivate(ObjectReference akActionRef)

	Bool activated = false
	self.GotoState("Busy")
	if self.IsEnabled()
		self.GetLinkedRef(none).Activate(self as ObjectReference, false)
		activated = true
	endIf
	if DoOnce as Bool && activated
		self.GotoState("Done")
	else
		self.GotoState("")
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state Done

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState

;-- State -------------------------------------------
state Busy

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
