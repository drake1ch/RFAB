;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname USKP_QF_ChangeLocation02_02007789 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CiceroRoad
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroRoad Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Curwe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Curwe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Loreius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Loreius Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Loreius = Alias_Loreius.GetActorReference()
Actor Curwe = Alias_Curwe.GetActorReference()
Actor Cicero = Alias_CiceroRoad.GetActorReference()
DarkBrotherhood DBScript = pDarkBrotherhood as DarkBrotherhood

Loreius.GetActorBase().SetEssential(false)
Curwe.GetActorBase().SetEssential(false)
Cicero.Disable()
CiceroCartRef.Disable()
NightMotherCoffinRoadRef.Disable()
DBCiceroHorseRef.Disable()
DBCiceroWheelRef.Disable()
if (DBScript.DB01MiscResolved == 1)
     Loreius.Disable()
     Curwe.Disable()
     VantusLoreiusDeadRef.Enable()
     CurweDeadRef.Enable()
     DBScript.LoreiusState = 2
elseif (DBScript.DB01MiscResolved == 2)
     DBScript.LoreiusState = 1
endif
pDB01Misc.Stop()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CiceroCartRef  Auto  

ObjectReference Property NightMotherCoffinRoadRef  Auto  

ObjectReference Property DBCiceroHorseRef  Auto  

ObjectReference Property DBCiceroWheelRef  Auto  

Quest Property pDarkBrotherhood  Auto  

Quest Property pDB01Misc  Auto  

ObjectReference Property VantusLoreiusDeadRef  Auto  

ObjectReference Property CurweDeadRef  Auto  
