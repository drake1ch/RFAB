Scriptname KruziikFollowerFixScript extends ObjectReference  

ObjectReference Property FrostLocation auto
Faction Property DraugrFaction auto

Event OnTrigger(ObjectReference akActionRef)
    if (akActionRef != Game.GetPlayer() && akActionRef as Actor && (akActionRef as Actor).IsInFaction(DraugrFaction) == false)
    	akActionRef.MoveTo(FrostLocation)
    elseif (akActionRef as Actor).IsInFaction(DraugrFaction) == true
    	akActionRef.Disable()
    endif
EndEvent

