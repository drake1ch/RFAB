Scriptname wispCoreScript extends ObjectReference  

ingredient property glowDust auto

EVENT onActivate(objectReference actronaut)
    int num = utility.randomInt(1,3)
    (actronaut as actor).addItem(glowDust,num)
    disable()
    delete()
endEVENT

; Forced removal on cell exit or reset  -- Martigen
; Note: This script needs to replace the original vanilla as current objects will reference it.

EVENT OnCellDetach()
    DisableNoWait()
    Delete()
endEvent

EVENT OnReset()
    DisableNoWait()
    Delete()
endEVENT
