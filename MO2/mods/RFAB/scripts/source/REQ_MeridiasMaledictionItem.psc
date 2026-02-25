Scriptname REQ_MeridiasMaledictionItem extends ObjectReference
{burns vampires who dare to put their hands on Dawnbreaker or Meridia's Beacon}

Spell Property malediction Auto

Event OnEquipped(Actor akActor)
    akActor.AddSpell(malediction, false)
EndEvent

Event OnUnequipped(Actor akActor)
    akActor.RemoveSpell(malediction)
EndEvent