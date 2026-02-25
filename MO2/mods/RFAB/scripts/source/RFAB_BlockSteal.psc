;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname RFAB_BlockSteal Extends Perk Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if !akTargetRef.IsOffLimits() && !(akTargetRef as Actor && akActor.IsSneaking())
	akTargetRef.Activate(akActor)
else
	debug.notification("Это будет считаться кражей...")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
