Scriptname DLC1nVampireNecklaceGargoyleSCRIPT extends OBJECTREFERENCE  

ACTORBASE PROPERTY gargoyle AUTO
GLOBALVARIABLE PROPERTY gargoyleNecklace AUTO

OBJECTREFERENCE amuletGarg
BOOL doOnce=false

EVENT onLoad()
	
	;if player has necklace, summon additional gargoyle
	if(gargoyleNecklace.getValue() == 1 && !doOnce)
		amuletGarg = self.placeAtMe(gargoyle)
		doOnce = true

		utility.wait(30)

		amuletGarg.disable()
		amuletGarg.delete() ; UDGP 2.0.1 - Come on Beth. PlaceAtMe without a corresponding delete? Really?

	endif

ENDEVENT

;if the boss goes, we go
EVENT onUnload()
	;UDGP 2.0.1 - Lack of sanity check. Also does not delete the placed ref.
	if( amuletGarg != None )
		amuletGarg.disable()
		amuletGarg.delete()
	EndIf
ENDEVENT