scriptName AddRemoveSpellArr extends ActiveMagicEffect

Spell[] Property SpellToAdd Auto
Bool Property abVerbose Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    int i = 0
    While (i < SpellToAdd.Length)
        akTarget.AddSpell(SpellToAdd[i], abVerbose)	
        i += 1
    EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    int i = 0
    While (i < SpellToAdd.Length)
        akTarget.RemoveSpell(SpellToAdd[i])
        i += 1
    EndWhile
EndEvent