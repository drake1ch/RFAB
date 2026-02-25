;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_PlaySoundOnActivate.psc
Modified : 2019-01-04 11:13:05
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_PlaySoundOnActivate extends ObjectReference
{Play a sound on the player once when this reference is activated.}

;-- Properties --------------------------------------
Float property Volume auto
sound property SelectedSound auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnActivate(ObjectReference akActionRef)

	self.GotoState("done")
	Int soundInstance = SelectedSound.Play(game.GetPlayer() as ObjectReference)
	sound.SetInstanceVolume(soundInstance, Volume)
endFunction

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state done

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
