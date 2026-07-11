Scriptname RFAB_NecroAuraRing extends ObjectReference  

RFAB_AuraManager Property AuraManager Auto

Event OnEquipped(Actor akActor)

    if akActor == Game.GetPlayer()
        AuraManager.OnRingEquipped(akActor)
    endif

EndEvent

Event OnUnequipped(Actor akActor)

    if akActor == Game.GetPlayer()
        AuraManager.OnRingRemoved(akActor)
    endif

EndEvent