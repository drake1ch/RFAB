;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation05_02009B98 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Delphine.TryToRemoveFromFaction(CrimeFactionWhiterun)
Alias_Esbern.TryToRemoveFromFaction(CrimeFactionRift)
Alias_Delphine.TryToAddToFaction(USKPCrimeFactionBlades)
Alias_Esbern.TryToAddToFaction(USKPCrimeFactionBlades)
Alias_Delphine.GetActorReference().SetCrimeFaction(USKPCrimeFactionBlades)
Alias_Esbern.GetActorReference().SetCrimeFaction(USKPCrimeFactionBlades)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property USKPCrimeFactionBlades Auto
