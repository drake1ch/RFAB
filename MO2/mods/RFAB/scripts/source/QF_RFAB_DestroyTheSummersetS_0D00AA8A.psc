;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_RFAB_DestroyTheSummersetS_0D00AA8A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gvilierm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gvilierm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Linwe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Linwe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enabler Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveDisplayed(20)
SetObjectiveCompleted(15)

Door11.setlocklevel(255)

Door12.setlocklevel(255)
Alias_Gvilierm.GetActorReference().GetActorBase().SetInvulnerable(false)
Alias_Gvilierm.GetActorReference().GetActorBase().SetEssential(False)
Alias_Gvilierm.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Gvilierm.GetActorRef().AddToFaction(Enemy)
Alias_Gvilierm.GetActorRef().AddToFaction(Attack)
Alias_Gvilierm.GetActorReference().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveDisplayed(10)


Alias_Enabler.GetReference().Enable()
Alias_Linwe.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(15)
SetObjectiveCompleted(10)

Alias_Gvilierm.GetActorReference().MoveTo(GVM)
Alias_Gvilierm.GetActorReference().Additem(Ohladitel, 1)
Alias_Gvilierm.GetActorReference().Additem(PP, 1)
Alias_Gvilierm.GetActorReference().SetOutfit(GO)
Alias_Gvilierm.GetActorReference().Additem(VP, 1)
Alias_Gvilierm.GetActorReference().Additem(Note, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
p1.disablenowait()


Door11.lock(false)
Door12.lock(false)

dp1.disablenowait()
dp2.disablenowait()
dp3.disablenowait()
dp4.disablenowait()
dp5.disablenowait()
id1.disablenowait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_1 in script QF_RFAB_DestroyTheSummersetS_0D00AA8A
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property GVM  Auto  

WEAPON Property Ohladitel  Auto  

Outfit Property GO  Auto  

Potion Property PP  Auto  

Potion Property VP  Auto  

Faction Property Enemy  Auto  

ObjectReference Property p1  Auto  

ObjectReference Property SVSDoor  Auto  

Book Property Note  Auto  

Faction Property Attack  Auto  

Door Property D1  Auto  

ObjectReference Property Door11  Auto  

ObjectReference Property Door12  Auto  

ObjectReference Property Dp1  Auto  

ObjectReference Property dp2  Auto  

ObjectReference Property dp3  Auto  

ObjectReference Property dp4  Auto  

ObjectReference Property dp5  Auto  

ObjectReference Property id1  Auto  
