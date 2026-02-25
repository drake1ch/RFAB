;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_RFAB_TheFallOfTheThievesG_0D005932 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MercerFrey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercerFrey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DelvinMallory
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DelvinMallory Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CynricEndell
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CynricEndell Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sapphire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sapphire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gvilierm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gvilierm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rune
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rune Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tonilia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tonilia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VekeltheMan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VekeltheMan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Surgeon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Surgeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brynjolf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brynjolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Niruin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Niruin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thrynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thrynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VipirtheFleet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VipirtheFleet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dirge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dirge Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RFAB_Quest_FTG
Quest __temp = self as Quest
RFAB_Quest_FTG kmyQuest = __temp as RFAB_Quest_FTG
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
Tgf.SetEnemy(PlayerFaction)
TG00.FailAllObjectives()
TG00.SetStage(201)
kMyQuest.StopTGQuests()

Alias_Brynjolf.GetActorReference().moveto(BM)
Alias_Sapphire.GetActorReference().moveto(SM)

Alias_Brynjolf.GetActorReference().EnableAI (false)
Alias_Sapphire.GetActorReference().EnableAI (false)


Alias_Brynjolf.GetActorReference().GetActorBase().SetInvulnerable(false)

Alias_Surgeon.GetActorReference().DisableNoWait()

Alias_MercerFrey.GetActorReference().GetActorBase().SetEssential(false) 
Alias_Brynjolf.GetActorReference().GetActorBase().SetEssential(false)
Alias_DelvinMallory.GetActorReference().GetActorBase().SetEssential(false)
Alias_Vex.GetActorReference().GetActorBase().SetEssential(false)
Alias_Tonilia.GetActorReference().GetActorBase().SetEssential(false)
Alias_Sapphire.GetActorReference().GetActorBase().SetEssential(false)
Alias_CynricEndell.GetActorReference().GetActorBase().SetEssential(false)
Alias_Niruin.GetActorReference().GetActorBase().SetEssential(false)
Alias_Rune.GetActorReference().GetActorBase().SetEssential(false)
Alias_Thrynn.GetActorReference().GetActorBase().SetEssential(false)
Alias_VipirtheFleet.GetActorReference().GetActorBase().SetEssential(false)
Alias_VekeltheMan.GetActorReference().GetActorBase().SetEssential(false)
Alias_Dirge.GetActorReference().GetActorBase().SetEssential(false)

TDoor.lock(false)
Alias_Brynjolf.GetActorReference().SetOutfit(BO)

Alias_MercerFrey.GetActorReference().AddToFaction(Atack) 
Alias_Brynjolf.GetActorReference().AddToFaction(Atack)
Alias_DelvinMallory.GetActorReference().AddToFaction(Atack)
Alias_Vex.GetActorReference().AddToFaction(Atack)
Alias_Tonilia.GetActorReference().AddToFaction(Atack)
Alias_Sapphire.GetActorReference().AddToFaction(Atack)
Alias_CynricEndell.GetActorReference().AddToFaction(Atack)
Alias_Niruin.GetActorReference().AddToFaction(Atack)
Alias_Rune.GetActorReference().AddToFaction(Atack)
Alias_Thrynn.GetActorReference().AddToFaction(Atack)
Alias_VipirtheFleet.GetActorReference().AddToFaction(Atack)
Alias_VekeltheMan.GetActorReference().AddToFaction(Atack)
Alias_Dirge.GetActorReference().AddToFaction(Atack)

Alias_MercerFrey.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Brynjolf.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_DelvinMallory.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Vex.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Tonilia.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Sapphire.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_CynricEndell.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Niruin.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Rune.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Thrynn.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_VipirtheFleet.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_VekeltheMan.GetActorReference().SetActorValue("Aggression", 2 as Float)
Alias_Dirge.GetActorReference().SetActorValue("Aggression", 2 as Float)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_MercerFrey .GetActorRef().StartCombat(Game.GetPlayer())
Alias_Brynjolf.GetActorRef().StartCombat(Game.GetPlayer())
Alias_DelvinMallory.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Vex.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Tonilia.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Sapphire.GetActorRef().StartCombat(Game.GetPlayer())
Alias_CynricEndell.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Niruin.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Rune.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Thrynn.GetActorRef().StartCombat(Game.GetPlayer())
Alias_VipirtheFleet.GetActorRef().StartCombat(Game.GetPlayer())
Alias_VekeltheMan.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Dirge.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_Brynjolf.GetActorReference().EnableAI (true)
Alias_Sapphire.GetActorReference().EnableAI (true)


Alias_Brynjolf.GetActorRef().StartCombat(Game.GetPlayer())
Alias_DelvinMallory.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Vex.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Tonilia.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Sapphire.GetActorRef().StartCombat(Game.GetPlayer())
Alias_CynricEndell.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Niruin.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Rune.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Thrynn.GetActorRef().StartCombat(Game.GetPlayer())
Alias_VipirtheFleet.GetActorRef().StartCombat(Game.GetPlayer())
Alias_VekeltheMan.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Dirge.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE RFAB_Quest_FTG
Quest __temp = self as Quest
RFAB_Quest_FTG kmyQuest = __temp as RFAB_Quest_FTG
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(15)
setObjectiveDisplayed(20)
D2.SetStage(0)
kMyQuest.StartPostTGQuests()
Game.GetPlayer().AddSpell(CompleteBonus, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BM  Auto  

ObjectReference Property SM  Auto  

Door Property TGDoor  Auto  

ObjectReference Property TDoor  Auto  

Quest Property TG00  Auto  

MiscObject Property Gold001  Auto  

Quest Property D2  Auto  

Outfit Property BO  Auto  

Faction Property Atack  Auto  

Faction Property TGf  Auto  

Faction Property PlayerFaction  Auto  


SPELL Property CompleteBonus  Auto  
