Scriptname RFAB_ToxicCloudCast extends ActiveMagicEffect  

import PO3_SKSEFunctions

Hazard Property ToxicCloudHazard Auto
Hazard Property ToxicCloudHazardDual Auto
Quest Property ToxicCloudQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    RFAB_ToxicCloudController Controller = ToxicCloudQuest as RFAB_ToxicCloudController

    ObjectReference NewCloud = None
    int tries = 0
    int i

    while tries < 5 && NewCloud == None

        ObjectReference[] Clouds = FindAllReferencesOfType(akCaster, ToxicCloudHazard, 10000.0)

        i = 0
        while i < Clouds.Length && NewCloud == None
            if Clouds[i] != Controller.LastCloud
                NewCloud = Clouds[i]
            endif
            i += 1
        endwhile

        if NewCloud == None

            Clouds = FindAllReferencesOfType(akCaster, ToxicCloudHazardDual, 10000.0)

            i = 0
            while i < Clouds.Length && NewCloud == None
                if Clouds[i] != Controller.LastCloud
                    NewCloud = Clouds[i]
                endif
                i += 1
            endwhile

        endif

        if NewCloud == None
            Utility.Wait(0.1)
        endif

        tries += 1

    endwhile

    if NewCloud

        ObjectReference OldCloud = Controller.LastCloud

        if OldCloud
            OldCloud.Disable()
            Utility.Wait(0.1)
            OldCloud.Delete()
        endif

        Controller.LastCloud = NewCloud

        StartCloudCleanup(NewCloud)

    endif

EndEvent

Function StartCloudCleanup(ObjectReference CloudRef)

    RFAB_ToxicCloudController Controller = ToxicCloudQuest as RFAB_ToxicCloudController

    Utility.Wait(30.0)

    if Controller.LastCloud == CloudRef

        CloudRef.Disable()
        Utility.Wait(0.1)
        CloudRef.Delete()

        Controller.LastCloud = None

    endif

EndFunction