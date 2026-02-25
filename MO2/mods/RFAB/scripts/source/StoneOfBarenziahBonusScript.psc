Scriptname StoneOfBarenziahBonusScript extends ObjectReference

Float Property Fortify Auto

Event OnActivate(ObjectReference akActionRef)

    (akActionRef as Actor).ModAV("CarryWeight", Fortify)
EndEvent