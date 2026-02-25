scriptname RFAB_LearnMapMarkers extends ObjectReference

Formlist[] Property MapMarkers Auto

Book Property SelfRef Auto

bool Property IsConsumable = true Auto

Event OnEquipped(Actor akActor)
	if (IsConsumable)
		PO3_SKSEFunctions.SetReadFlag(SelfRef)
		akActor.RemoveItem(SelfRef, 1, true)
	endif
	
	int i = MapMarkers.Length
	while (i > 0)
		i -= 1
		int j = MapMarkers[i].GetSize()
		while (j > 0)
			j -= 1
			(MapMarkers[i].GetAt(j) as ObjectReference).AddToMap()
		endwhile
	endwhile
EndEvent