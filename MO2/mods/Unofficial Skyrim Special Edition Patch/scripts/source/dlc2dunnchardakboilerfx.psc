Scriptname DLC2dunNchardakBoilerFX extends DLC2dunNchardakSubmersible
{Script that lives on the boilers in Nchardak. Handles their animations and VFX.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto
Keyword property LinkCustom06 Auto

bool cubeHasBeenInserted = False
bool boilerIsRunning = False

Sound property QSTNchardakBoilerLPM Auto
int myInstance = -1

Event OnLoad()
	CheckBoilerState()
EndEvent

;OnUpdate events arrive from the Submersible parent class when this object becomes or ceases to be submerged.
Event OnUpdate()
; 	;Debug.Trace("Boiler received OnUpdate Event.")
	CheckBoilerState()
EndEvent

Function CheckBoilerState()
; 	;Debug.Trace("CheckBoilerState called.")
	If (!boilerIsRunning && !isSubmerged && cubeHasBeenInserted)
		StartBoiler()
	ElseIf (boilerIsRunning && (isSubmerged || !cubeHasBeenInserted))
		StopBoiler()
	Else
; 		;Debug.Trace("Nothing to do here.")
	EndIf
EndFunction

Function InsertBoilerCube()
	cubeHasBeenInserted = True
	CheckBoilerState()
EndFunction

Function RemoveBoilerCube()
	cubeHasBeenInserted = False
	CheckBoilerState()
EndFunction


Function StartBoiler()
; 	;Debug.Trace("Starting the Boiler.")
	Self.PlayAnimationAndWait("Start", "ToLoop")
; 	;Debug.Trace("Animation call returned.")
	boilerIsRunning = True
	myInstance = QSTNchardakBoilerLPM.Play(Self)
	;UDBP 2.0.1 added all this sanity checking.
	if( GetLinkedRef(LinkCustom01) != None )
		Self.GetLinkedRef(LinkCustom01).EnableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom02) != None )
		Self.GetLinkedRef(LinkCustom02).EnableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom03) != None )
		Self.GetLinkedRef(LinkCustom03).EnableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom04) != None )
		Self.GetLinkedRef(LinkCustom04).EnableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom05) != None )
		Self.GetLinkedRef(LinkCustom05).EnableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom06) != None )
		Self.GetLinkedRef(LinkCustom06).EnableNoWait(True)
	EndIf
EndFunction

Function StopBoiler()
; 	;Debug.Trace("Stopping the Boiler.")
	Self.PlayAnimationAndWait("Stop", "ToStopped")
; 	;Debug.Trace("Animation call returned.")
	boilerIsRunning = False
	if (myInstance >= 0)
		Sound.StopInstance(myInstance)
	EndIf
	;UDBP 2.0.1 added all this sanity checking.
	if( GetLinkedRef(LinkCustom01) != None )
		Self.GetLinkedRef(LinkCustom01).DisableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom02) != None )
		Self.GetLinkedRef(LinkCustom02).DisableNoWait(True)
		Utility.Wait(0.25)
	endif
	if( GetLinkedRef(LinkCustom03) != None )
		Self.GetLinkedRef(LinkCustom03).DisableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom04) != None )
		Self.GetLinkedRef(LinkCustom04).DisableNoWait(True)
		Utility.Wait(0.25)
	endif
	if( GetLinkedRef(LinkCustom05) != None )
		Self.GetLinkedRef(LinkCustom05).DisableNoWait(True)
		Utility.Wait(0.25)
	EndIf
	if( GetLinkedRef(LinkCustom06) != None )
		Self.GetLinkedRef(LinkCustom06).DisableNoWait(True)
	EndIf
EndFunction
