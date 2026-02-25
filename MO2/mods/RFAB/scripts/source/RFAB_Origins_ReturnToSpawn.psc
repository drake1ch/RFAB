Scriptname RFAB_Origins_ReturnToSpawn extends ObjectReference  

ObjectReference Property SpawnMarker Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	akActionRef.MoveTo(SpawnMarker)
EndEvent