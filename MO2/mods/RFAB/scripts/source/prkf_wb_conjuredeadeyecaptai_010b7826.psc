;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname PRKF_WB_ConjureDeadeyeCaptai_010B7826 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
WB_Corpse.GetReference().MoveTo(akTargetRef)
;akTargetRef.PlaceAtMe(WB_WaterBlast)
WB_S_C025_ConjureDeadeyeCaptain_Spell_SplashSpell_PC.Cast(PlayerRef, akTargetRef)
WB_Corpse.Clear()
WB_ConjureDeadeyeCaptain_Quest.Stop()
WB_ConjurationGhosts_Message_ConjureDeadeyeCaptain_End.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;akTargetRef.PlaceAtMe(WB_WaterBlast)
WB_S_C025_ConjureDeadeyeCaptain_Spell_SplashSpell_PC.Cast(PlayerRef, akTargetRef)
WB_ConjureDeadeyeCaptain_Quest.Start()
WB_Corpse.ForceRefTo(akTargetRef)
akTargetRef.MoveTo(WB_Marker)
WB_ConjurationGhosts_Message_ConjureDeadeyeCaptain.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WB_ConjureDeadeyeCaptain_Quest  Auto  

ReferenceAlias Property WB_Corpse  Auto  

Message Property WB_ConjurationGhosts_Message_ConjureDeadeyeCaptain  Auto  

ObjectReference Property WB_Marker  Auto  

Message Property WB_ConjurationGhosts_Message_ConjureDeadeyeCaptain_End  Auto  

Explosion Property WB_WaterBlast  Auto  

SPELL Property WB_S_C025_ConjureDeadeyeCaptain_Spell_SplashSpell_PC  Auto  

Actor Property PlayerRef  Auto  
