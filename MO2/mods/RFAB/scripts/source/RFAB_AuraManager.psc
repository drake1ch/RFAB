Scriptname RFAB_AuraManager extends Quest  

Armor Property NecroRing Auto

Spell FirstAura
Spell SecondAura

Actor lockedActor = None
Bool isProcessing = False


Function RequestToggle(Actor akTarget, Spell NewAura)

    if akTarget == None || NewAura == None
        return
    endif

    if isProcessing && lockedActor == akTarget
        return
    endif

    isProcessing = True
    lockedActor = akTarget

    ToggleAuraInternal(akTarget, NewAura)

    lockedActor = None
    isProcessing = False

EndFunction


Function ToggleAuraInternal(Actor akTarget, Spell NewAura)

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


Function OnRingEquipped(Actor akTarget)
EndFunction


Function OnRingRemoved(Actor akTarget)

    if akTarget == None
        return
    endif

    if SecondAura != None
        akTarget.RemoveSpell(SecondAura)
        SecondAura = None
    endif

EndFunction