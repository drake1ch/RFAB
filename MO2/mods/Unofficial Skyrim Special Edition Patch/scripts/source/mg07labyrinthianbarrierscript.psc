Scriptname MG07LabyrinthianBarrierScript extends ObjectReference  
{Small script to do some setup handling for the MG07 Boss Scene}

spell property VampireDrain01 auto
objectReference property Target01 auto
objectReference property Target02 auto
objectReference property castSource auto
weapon property MG07StaffofMagnus auto
objectReference property Morokei auto
WorldSpace Property LabyrinthianWorld04 Auto ; USKP 2.0.4 - This script is assigned to a test object in Shalidor's Maze. Oops.

EVENT onLoad()
	;USKP 2.0.4 - Bail out if this isn't the right Morokei.
	if( self.GetWorldSpace() != LabyrinthianWorld04 )
		Return
	EndIf
	
	while self.is3Dloaded() == FALSE
		utility.wait(1.0)
	endWhile
	VampireDrain01.cast(target01, castSource)
	VampireDrain01.cast(target02, castSource)
; 	debug.trace("TEST: Channel Casting Done")
	playAnimation("playAnim02")
	(Morokei as actor).equipItem(MG07StaffofMagnus, TRUE)
endEVENT

