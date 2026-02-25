Scriptname BlackGuardRemoveStances extends activemagiceffect

Spell[] Property RemoveSpells auto

Event OnEffectStart (Actor akTarget, Actor akCaster)

    Int i = 0
    While i < RemoveSpells.Length
        akTarget.Removespell(RemoveSpells[i])
        i += 1
    EndWhile
EndEvent