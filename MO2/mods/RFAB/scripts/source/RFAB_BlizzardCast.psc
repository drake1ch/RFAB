Scriptname RFAB_BlizzardCast extends ActiveMagicEffect  

import PO3_SKSEFunctions

Hazard Property BlizzardHazard Auto
Quest Property BlizzardQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    RFAB_BlizzardController Controller = BlizzardQuest as RFAB_BlizzardController

    ObjectReference NewBlizzard = None
    int tries = 0
    int i

    while tries < 5 && NewBlizzard == None

        ObjectReference[] Blizzards = FindAllReferencesOfType(akCaster, BlizzardHazard, 10000.0)

        i = 0
        while i < Blizzards.Length && NewBlizzard == None

            if Blizzards[i] != Controller.LastBlizzard
                NewBlizzard = Blizzards[i]
            endif

            i += 1

        endwhile

        if NewBlizzard == None
            Utility.Wait(0.1)
        endif

        tries += 1

    endwhile

    if NewBlizzard

        ObjectReference OldBlizzard = Controller.LastBlizzard

        if OldBlizzard
            OldBlizzard.Disable()
            Utility.Wait(0.1)
            OldBlizzard.Delete()
        endif

        Controller.LastBlizzard = NewBlizzard

        StartBlizzardCleanup(NewBlizzard)

    endif

EndEvent

Function StartBlizzardCleanup(ObjectReference BlizzardRef)

    RFAB_BlizzardController Controller = BlizzardQuest as RFAB_BlizzardController

    Utility.Wait(30.0)

    if Controller.LastBlizzard == BlizzardRef

        BlizzardRef.Disable()
        Utility.Wait(0.1)
        BlizzardRef.Delete()

        Controller.LastBlizzard = None

    endif

EndFunction