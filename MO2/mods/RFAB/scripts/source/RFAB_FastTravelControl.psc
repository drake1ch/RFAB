Scriptname RFAB_FastTravelControl extends ReferenceAlias  

RFAB_MCM_Alias Property Data Auto

Event OnInit()
    RegisterForMenu("MapMenu")
EndEvent

Event OnPlayerLoadGame()
    RegisterForMenu("MapMenu")
EndEvent

Event OnMenuOpen(String asMenuName)
	if (Data.IsFastTravelAllowed)
		Game.EnableFastTravel(true)
	else
		Game.EnableFastTravel(false)
	endif
EndEvent
