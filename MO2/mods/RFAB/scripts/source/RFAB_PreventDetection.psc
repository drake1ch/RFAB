Scriptname RFAB_PreventDetection extends ActiveMagicEffect  

import PO3_SKSEFunctions

Event OnEffectStart(Actor akTarget, Actor akCaster)
    PreventActorDetection(akTarget)
    Actor[] NPCs = MiscUtil.ScanCellNPCs(akTarget, 10000)
    int i = 0
    while (i < NPCs.Length)
    	if (NPCs[i].IsInCombat() && NPCs[i].IsHostileToActor(akTarget))
    		NPCs[i].StopCombat()
    	endif
    	i += 1
    endwhile
    Utility.Wait(1.0)
	ResetActorDetection(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
EndEvent