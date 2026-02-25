ScriptName OblivionBreathScript Extends objectreference

Spell Property OblivionBreath auto
Perk Property PyromancyPerk1 auto

Event OnEquipped(Actor akActor)

  if akActor.HasPerk(PyromancyPerk1)
    akActor.AddSpell(OblivionBreath, false)
  endIf
EndEvent

Event OnUnequipped(Actor akActor)

  akActor.RemoveSpell(OblivionBreath)
EndEvent