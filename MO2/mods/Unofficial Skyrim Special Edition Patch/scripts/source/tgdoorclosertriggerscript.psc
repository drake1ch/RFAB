Scriptname TGDoorCloserTriggerScript extends ObjectReference  

ObjectReference Property pSwitch Auto
ObjectReference Property pCasket Auto

Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer() && (pCasket as RiftenCasketDoorScript).IsOpen
		pSwitch.Activate(Self) ;USKP 2.1.3 Bug #19360 - Use of player here aborts invisibility spells.
	endif

endEvent