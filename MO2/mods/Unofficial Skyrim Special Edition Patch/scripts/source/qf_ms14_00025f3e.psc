;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname QF_MS14_00025F3E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Alva
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alva Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hroggar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hroggar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gravedigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gravedigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helgi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helgi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhorunnHall
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GhorunnHall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HelgiCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HelgiCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoffinDirt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoffinDirt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlRebel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlRebel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurnedHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurnedHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonnir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thonnir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossVampireMorvath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossVampireMorvath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Laelette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Laelette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorgen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorgen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lami
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lami Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurbuk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurbuk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Benor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Benor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; Quest is over, player has collected his reward

SetObjectiveCompleted(120, 1)
Game.GetPlayer().AddItem(Reward, 1)
AchievementsQuest.IncSideQuests()

UnregisterForUpdate()

If Alias_JarlImperial.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
ElseIf  Alias_JarlRebel.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
EndIf

Alias_BossVampireMorvath.TryToDisable() ; USKP 2.0 - Movarth needs to be disabled so the original vampire can be used again.

;USLEEP 3.0.5 Bug #20141
Alias_Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; Player has activated Alva's Journal
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(95, 1)

;USKP 2.0.6 - Bug #16766: If Alva is alive, she's in the lair but not hostile. This fixes that.
Actor Alva = Alias_Alva.GetActorReference()
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetAV( "aggression", 2 )
;USKP 2.1.3 Bug #19404
Alva.SetRelationshipRank(Alias_Lami.GetActorReference(), 0)
Alva.SetRelationshipRank(Alias_Hroggar.GetActorReference(), 0)
;USLEEP Bug #19861
if !( Alva.IsDead() )
  ;USLEEP 3.0.8 Bug #21446 - Alva might be in the same cell.
  if !( Alva.Is3DLoaded() )
    Alva.MoveTo(Alias_BossVampireMorvath.GetReference())
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Init quest

RegisterForUpdate(5)
Alias_Alva.GetReference().RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player knows Thonnir is Laelette's husband.

Alias_Helgi.TryToDisable()

;SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
If Alias_Lurbuk.GetActorReference().IsDead() == 0
    Alias_Lurbuk.TryToMoveTo(LurbukGhoruunWait)
    Alias_Lurbuk.TryToEvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0
    Alias_Benor.TryToMoveTo(BenorGhoruunWait)
    Alias_Benor.TryToEvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0
    Alias_Jorgen.TryToMoveTo(JorgenGhoruunWait)
    Alias_Jorgen.TryToEvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0
    Alias_Lami.TryToMoveTo(LamiGhoruunWait)
    Alias_Lami.TryToEvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.TryToMoveTo(ThonnirGhoruunWait)
    Alias_Thonnir.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Player has killed Laelette

ThonnirFindLaelette.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; Alva is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; Player has arrived at Movarth's Lairl, move NPCs
; This stage is mostly to track the event. It doesn't set new objectives
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
MobScared.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player has met Helgi and is playing hide and seek.

Alias_Helgi.TryToDisable()
Alias_CoffinDirt.TryToDisable()

Alias_Laelette.TryToEnable()
Alias_Laelette.GetActorReference().setGhost(true)
Alias_Laelette.GetActorReference().SetAlpha(0)

SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; Player has caught Alva in her coffin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Player has recieved the quest from the jarl.

Alias_Helgi.TryToEnable()

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
Alias_Helgi.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Player learns Laelette was with Alva.

SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)
Alias_AlvasJournal.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; The player is sent to Movarth's Lair
Alias_Alva.GetReference().UnregisterForUpdate()
;USKP 2.0.6 - Bug #16766: If Alva is alive, she's in the lair but not hostile. This fixes that.
Actor Alva = Alias_Alva.GetActorReference()
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetAV( "aggression", 2 )
;USKP 2.1.3 Bug #19404
Alva.SetRelationshipRank(Alias_Lami.GetActorReference(), 0)
Alva.SetRelationshipRank(Alias_Hroggar.GetActorReference(), 0)
;USLEEP 3.0.7 Bug #21236
Alias_Hroggar.GetActorReference().SetActorValue("aggression", 1)
;USLEEP 3.0.3 Bug #19861
if !(Alva.IsDead())
  Alva.MoveTo(Alias_BossVampireMorvath.GetReference())
endif

SetObjectiveCompleted(95, 1)
SetObjectiveDisplayed(100, 1)

If Alias_JarlImperial.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
ElseIf  Alias_JarlRebel.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
EndIf

; Alias_Thonnir.GetRef().RegisterForUpdate(1)
Game.GetPlayer().AddItem(FirstReward, 1)

If Alias_Lurbuk.GetActorReference().IsDead() == 0 && Alias_Lurbuk.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lurbuk.TryToMoveTo(LurbukWaitMarker)
    Alias_Lurbuk.TryToEvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0 && Alias_Benor.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Benor.TryToMoveTo(BenorWaitMarker)
    Alias_Benor.TryToEvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0 && Alias_Jorgen.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Jorgen.TryToMoveTo(JorgenWaitMarker)
    Alias_Jorgen.TryToEvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0 && Alias_Lami.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lami.TryToMoveTo(LamiWaitMarker)
    Alias_Lami.TryToEvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.TryToMoveTo(ThonnirWaitMarker)
    Alias_Thonnir.TryToEvaluatePackage()
EndIf

Alias_BossVampireMorvath.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
; Tried to prove Alva was a vampire without the journal.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player has spoken to Helgi's coffin

SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(60, 1)
SetObjectiveDisplayed(35, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; Player has gotten close to the burned house

Alias_BurnedHouse.GetReference().UnregisterForUpdate()
GhoruunCell.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; Movarth is dead

SetObjectiveCompleted(100, 1)
SetObjectiveDisplayed(120, 1)

Alias_Helgi.TryToEnable()
Alias_Helgi.TryToMoveTo(MS14HelgiThankYouMarker)
Alias_Thonnir.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; player leaves mob outside Highmoon Hall

kmyQuest.MobMarch = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; Player has heard rumors about Bern, and been told to see the steward

If GetStage() <= 20
    SetObjectiveDisplayed(20, 1)
EndIf

kmyQuest.StopHouseRumor = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property JorgenWaitMarker auto
ObjectReference Property BenorWaitMarker auto
ObjectReference Property LamiWaitMarker auto
ObjectReference Property LurbukWaitMarker auto
ObjectReference Property ThonnirWaitMarker auto

ObjectReference Property JorgenGhoruunWait auto
ObjectReference Property BenorGhoruunWait auto
ObjectReference Property LamiGhoruunWait auto
ObjectReference Property LurbukGhoruunWait auto
ObjectReference Property ThonnirGhoruunWait auto

Scene Property MobScared  Auto  


Scene Property ThonnirFindLaelette  Auto  

ObjectReference Property MS14HelgiThankYouMarker  Auto  

Cell Property GhoruunCell  Auto  

Faction Property JobJarlFaction  Auto  

LeveledItem Property Reward  Auto  

LeveledItem Property FirstReward  Auto  

Faction Property CrimeFaction  Auto  

AchievementsScript Property AchievementsQuest Auto

Faction Property CurrentFollowerFaction  Auto  

Faction Property VampireFaction Auto ;USKP 2.0.6.
Faction Property TownMorthalFaction Auto ;USKP 2.0.6
