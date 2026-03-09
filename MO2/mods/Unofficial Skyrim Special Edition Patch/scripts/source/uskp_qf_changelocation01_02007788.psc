;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname USKP_QF_ChangeLocation01_02007788 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Windhelm
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Windhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS11CrimeSceneInvestigator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS11CrimeSceneInvestigator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrimeSceneInvestigator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrimeSceneInvestigator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if !(Alias_MS11CrimeSceneInvestigator.GetActorReference().IsInFaction(CWImperialFaction))
     Actor Investigator = Alias_CrimeSceneInvestigator.GetActorReference()
     MS11CrimeSceneInvesigator.ForceRefTo(Investigator)
     Investigator.MoveTo(MS11OpeningSceneGuardPositionREF)
     Investigator.EvaluatePackage()
endif
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MS11CrimeSceneInvesigator  Auto  

Faction Property CWImperialFaction  Auto  

ObjectReference Property MS11OpeningSceneGuardPositionREF  Auto  
