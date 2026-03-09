;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_dunPOITundraWitchShackQST_000DDF8D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Witch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Witch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchAttackPosition
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitchAttackPosition Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bed Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Witch attacks.
;Alias_Witch.GetActorRef().Activate(None) - Commented by USKP 2.0.1. This line does nothing other than toss errors.
Alias_Witch.GetActorReference().SetAv("Aggression", 2)
;USKP 2.1.0 - Bug #18803
if( !Alias_Witch.GetActorReference().IsDead() )
  Alias_Witch.GetActorReference().StartCombat(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Witch dies.
Alias_Bed.GetReference().SetFactionOwner(None)
Self.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player enters the cellar.
if (!Alias_Witch.GetActorReference().IsDead())
   Alias_Witch.TryToEvaluatePackage()
   Alias_Witch.GetActorReference().MoveToPackageLocation()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Startup stage.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
