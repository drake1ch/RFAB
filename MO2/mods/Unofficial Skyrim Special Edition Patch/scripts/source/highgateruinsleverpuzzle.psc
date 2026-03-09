Scriptname highGateRuinsLeverPuzzle extends ObjectReference  
{A script to control the lever puzzle in HighGateRuins01, it consists of two levers, four flames, an xmarker and a door.}

import utility

;the four levers
BOOL PROPERTY leverEagleA AUTO
BOOL PROPERTY leverFox AUTO
BOOL PROPERTY leverWhale AUTO
BOOL PROPERTY leverSnake AUTO

;the four flames
OBJECTREFERENCE PROPERTY flameEagleA AUTO
OBJECTREFERENCE PROPERTY flameFox AUTO
OBJECTREFERENCE PROPERTY flameWhale AUTO
OBJECTREFERENCE PROPERTY flameSnake AUTO

OBJECTREFERENCE PROPERTY leverA AUTO
OBJECTREFERENCE PROPERTY leverB AUTO
OBJECTREFERENCE PROPERTY leverC AUTO
OBJECTREFERENCE PROPERTY leverD AUTO

;the xmarker to activate for the door
OBJECTREFERENCE PROPERTY openMarker AUTO

;the door
OBJECTREFERENCE PROPERTY puzzDoor AUTO

;the Quest
QUEST PROPERTY lQuest AUTO

BOOL correct

EVENT onActivate (objectReference triggerRef)
	; // Eagle, Whale, Fox, Snake
	playAnimationandWait("FullPush","FullPushedUp")
	IF(leverEagleA)
		IF flameEagleA.isDisabled()
			flameEagleA.enable()
		ELSE
			killSwitch()
		ENDIF	
	ELSEIF(leverWhale)
		IF(flameEagleA.isDisabled() == FALSE) && flameWhale.isDisabled()
			flameWhale.enable()
		ELSE
			killSwitch()
		ENDIF
	ELSEIF(leverFox)
		IF(flameWhale.isDisabled() == FALSE) && flamefox.isDisabled()
			flamefox.enable()
		ELSE
			killSwitch()
		ENDIF
	ELSEIF(leverSnake)
		IF(flamefox.isDisabled() == FALSE) && flameSnake.isDisabled()
			flameSnake.enable()
			wait(0.5)
			; progress the quest and open the door
			lQuest.setStage(30)
			puzzDoor.activate(openmarker)
		ELSE
			killSwitch()
		ENDIF
	ENDIF
endEVENT

; //A simple function to kill all of the fires
FUNCTION killSwitch()
	IF flameSnake.isDisabled() == true ; USKP 2.0.1 - Puzzle not solved, reset everything.
		flameSnake.Disable()
		flamefox.Disable()
		flameWhale.Disable()
		flameEagleA.Disable()

		leverA.playAnimation("FullPull")
		leverB.playAnimation("FullPull")
		leverC.playAnimation("FullPull")
		leverD.playAnimation("FullPull")
	ENDIF	
	playAnimationandWait("FullPull","FullPulledUp")	
ENDFUNCTION 
