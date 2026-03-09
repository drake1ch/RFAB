Scriptname dunKilkreathCrystalNodeSCRIPT extends ObjectReference  
import Debug
import Utility

objectReference Property nextToActivate Auto
{If you want the next node in line to shoot, set it here}

quest Property myQuest Auto
{Quest}
int Property startStage Auto
{what Stage this should start on}

spell Property beamSpell Auto 
{BASEOBJECT: pointer to beam spell}

objectReference Property beamTarget Auto
{what you want the beam to shoot at}

objectReference Property Door01 Auto
{First Door to be unlocked/opened}
objectReference Property Door02 Auto
{Second Door to be unlocked/opened}
objectReference Property loadDoor Auto

float Property waitTimeBeam = 1.0 Auto
{Delay after translation to fire the beam effect DEFAULT = 2.5}
float Property waitTimeDoor = 1.0 Auto
{Delay to open the First Door DEFAULT = 0}
float Property waitTimeNextBeam = 1.0 auto
{Default: 1 second}

bool Property isTriggered = false auto hidden

sound Property StartSound  Auto 

event onCellLoad()
	if (isTriggered == TRUE)
	resetBeam()
	endif
endEvent


Event onActivate(ObjectReference akActionRef)
	;if ((myquest.isStageDone(startStage) == TRUE) && (isTriggered != TRUE))
	;USKP 2.0.1 - Turn the beams off when the quest is over. Also added sanity checks as not all settings are used.
	if( !isTriggered )
		isTriggered = True
		wait(waitTimeBeam)
		fireBeam()
		wait(waitTimeNextBeam)
		if( nextToActivate )
			nextToActivate.Activate(self)
		EndIf
		wait(waitTimeDoor)
		unlockOpenDoor(door01)
		unlockOpenDoor(door02)
		unlockDoor(loadDoor)
	Else
		isTriggered = False
		self.InterruptCast()
		if( nextToActivate )
			nextToActivate.Activate(self)
		EndIf
	EndIf
endEvent

function fireBeam()
	if( self.Is3DLoaded() && beamTarget )
		beamSpell.cast(self, beamTarget)
		StartSound.play(self)  
		;Notification("Fire beam")
	EndIf
endFunction     
 
function resetBeam()
	self.interruptCast()
	fireBeam()
endFunction
 
function unlockOpenDoor(objectReference doorRef)
	if( doorRef != None )
		doorRef.lock(false,true)
		doorRef.activate(self)
	EndIf
endFunction

function unlockDoor(objectReference doorRef)
	if( doorRef != None )
		doorRef.lock(false,true)
	EndIf
endFunction
