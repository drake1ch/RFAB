Scriptname RFAB_NecroAuraRing extends ObjectReference  

RFAB_AuraManager Property AuraManager Auto

Event OnUnequipped(Actor akActor)

    if akActor == Game.GetPlayer()
        AuraManager.OnRingRemoved(akActor)
    endif

EndEvent