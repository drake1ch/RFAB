Scriptname RFAB_AuraManager extends Quest  

Armor Property NecroRing Auto

Spell FirstAura
Spell SecondAura

Function ToggleAura(Actor akTarget, Spell NewAura)

    if FirstAura == NewAura

        akTarget.RemoveSpell(NewAura)

        FirstAura = SecondAura
        SecondAura = None

        return

    endif

    if SecondAura == NewAura

        akTarget.RemoveSpell(NewAura)

        SecondAura = None

        return

    endif

    if !akTarget.IsEquipped(NecroRing)

        if FirstAura
            akTarget.RemoveSpell(FirstAura)
        endif

        if SecondAura
            akTarget.RemoveSpell(SecondAura)
            SecondAura = None
        endif

        akTarget.AddSpell(NewAura, False)

        FirstAura = NewAura

        return

    endif

    if FirstAura == None

        akTarget.AddSpell(NewAura, False)

        FirstAura = NewAura

        return

    endif

    if SecondAura == None

        akTarget.AddSpell(NewAura, False)

        SecondAura = NewAura

        return

    endif

    akTarget.RemoveSpell(FirstAura)

    FirstAura = SecondAura
    SecondAura = NewAura

    akTarget.AddSpell(NewAura, False)

EndFunction

Function OnRingRemoved(Actor akTarget)

    if SecondAura == None
        return
    endif

    if FirstAura
        akTarget.RemoveSpell(FirstAura)
    endif


    FirstAura = SecondAura
    SecondAura = None

EndFunction