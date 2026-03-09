Scriptname defaultAddMapMarkerOnCloseBookNotAlias extends ObjectReference  
{When the player closes the book, adds the indicated map markers to their map, optionally with fast travel enabled.}
;==============================================
ObjectReference property MapMarker1 Auto
ObjectReference property MapMarker2 Auto
ObjectReference property MapMarker3 Auto
ObjectReference property MapMarker4 Auto
ObjectReference property MapMarker5 Auto

bool property AllowFastTravel = False Auto
{Allow fast travel to these markers? Default: False}

auto STATE ready
	Event OnActivate(ObjectReference akActionRef)
		stageHandling()
	EndEvent

	Event OnEquipped(Actor akActor)
		stageHandling()
	endEvent
endSTATE

STATE Done
	; nothing happens in this place
endSTATE
;==============================================

;USKP 2.0.0 - Map marker spam eliminated if you have already been told of the locations.
FUNCTION stageHandling()
	if (MapMarker1 != None)
		if (MapMarker1.IsMapMarkerVisible() == 0)
			MapMarker1.AddToMap(AllowFastTravel)
		endif
	EndIf
	if (MapMarker2 != None)
		if (MapMarker2.IsMapMarkerVisible() == 0)
			MapMarker2.AddToMap(AllowFastTravel)
		endif
	EndIf
	if (MapMarker3 != None)
		if (MapMarker3.IsMapMarkerVisible() == 0)
			MapMarker3.AddToMap(AllowFastTravel)
		endif
	EndIf
	if (MapMarker4 != None)
		if (MapMarker4.IsMapMarkerVisible() == 0)
			MapMarker4.AddToMap(AllowFastTravel)
		endif
	EndIf
	if (MapMarker5 != None)
		if (MapMarker5.IsMapMarkerVisible() == 0)
			MapMarker5.AddToMap(AllowFastTravel)
		endif
	EndIf
endFUNCTION
