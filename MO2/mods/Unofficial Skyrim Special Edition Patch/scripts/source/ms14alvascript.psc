Scriptname MS14AlvaScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == AlvasHouse || akNewLoc == MovarthsLairLocation
		Alva.GetActorReference().SetCrimeFaction(none)
		Hroggar.GetActorReference().SetCrimeFaction(none)
	Else
		Alva.GetActorReference().SetCrimeFaction(CrimeFaction)
		Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
    If GetOwningQuest().GetStage() == 80
        GetOwningQuest().SetStage(90)
    EndIf
    GetReference().UnregisterForUpdate()
EndEvent

location Property AlvasHouse  Auto  

ReferenceAlias Property Alva  Auto  

Faction Property CrimeFaction  Auto  

ReferenceAlias Property Hroggar  Auto  

Location Property MovarthsLairLocation Auto ;USKP 2.0.8 - Bug #18226