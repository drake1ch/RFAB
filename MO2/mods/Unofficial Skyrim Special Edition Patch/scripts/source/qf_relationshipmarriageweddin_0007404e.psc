;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_RelationshipMarriageWeddin_0007404E Extends Quest Hidden

;BEGIN ALIAS PROPERTY LoveInterest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveInterest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoverWitness01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoverWitness01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoverWitness02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoverWitness02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dinya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dinya Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoverWitness03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoverWitness03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempleofMara
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TempleofMara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TemplePriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TemplePriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempleCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempleCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Briehl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Briehl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player walks away from the wedding, cue the failure dialog
;stop wedding scene
RelationshipMarriageWeddingSceneView.Stop()
SetStage(30)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE RelationshipMarriageWeddingScript
Quest __temp = self as Quest
RelationshipMarriageWeddingScript kmyQuest = __temp as RelationshipMarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Check for the player's wedding day
kmyQuest.MarriageDay = (Math.Floor(kmyquest.GameDaysPassed.GetValue())) + 1
kmyQuest.RegisterForUpdateGameTime(1)

;Make sure no one sandboxes to the prayer marker
MarriagePrayerIdleMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE RelationshipMarriageWeddingScript
Quest __temp = self as Quest
RelationshipMarriageWeddingScript kmyQuest = __temp as RelationshipMarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Shut down the wedding
;disable the prayer marker and re-enable the old one
MarriagePrayerIdleMarker.Disable()
kmyquest.RegisterForSingleUpdateGameTime(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Shut down the wedding once everyone's unloaded and enough time has passed
Utility.WaitGameTime(3)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE RelationshipMarriageWeddingScript
Quest __temp = self as Quest
RelationshipMarriageWeddingScript kmyQuest = __temp as RelationshipMarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Player is now married
Game.AddAchievement(33)
RelationshipMarriage.SetStage(100)
Alias_LoveInterest.TryToRemoveFromFaction(RelationshipCourtingFaction)
Alias_LoveInterest.TryToRemoveFromFaction(PotentialHireling)
Alias_LoveInterest.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 4)
Alias_LoveInterest.TryToAddtoFaction(PlayerFaction)
Alias_LoveInterest.TryToAddtoFaction(PlayerMarriedFaction)

Game.GetPlayer().AddtoFaction(PlayerMarriedFaction)

Game.GetPlayer().AddItem(MarriageRingBondsofMatrimony, 1)
Alias_LoveInterest.GetActorReference().AddItem(MarriageRingBondsofMatrimony, 1)

kmyquest.UnregisterForUpdate()

If Alias_LoveInterest.GetActorReference().IsInFaction(CurrentFollowerFaction) == True
  DialogueFollower.DismissFollower()
EndIf

;USLEEP 3.0.6 Bug #21023: Moved to tif__00075ca2 so spouse can forcegreet correctly
;Wedding is over. Start the FIN quest
;RelationshipMarriageFIN.SendStoryEvent(akref1 = Alias_LoveInterest.GetActorReference())
;Alias_LoveInterest.TryToEvaluatePackage()

PostWeddingScene.Start() ;USKP 2.1.3
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RelationshipMarriageWeddingScript
Quest __temp = self as Quest
RelationshipMarriageWeddingScript kmyQuest = __temp as RelationshipMarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Priest begins the ceremony
Game.ForceThirdPerson()
Game.DisablePlayerControls(abLooking = false, abCamSwitch = true, abSneaking = true)
Game.SetPlayerAIDriven()
Game.ShowFirstPersonGeometry( false )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Wedding is ready. Move everyone into position
RelationshipMarriage.SetObjectiveDisplayed(20, abforce = True)

;dismiss the player's follower if it's the love interest
If Alias_LoveInterest.GetActorReference().IsInFaction(CurrentFollowerFaction) == True
  DialogueFollower.DismissFollower(1)
EndIf

;move people in position if they're not in the temple
If Alias_TemplePriest.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
  Alias_TemplePriest.TryToMoveTo(PriestMarker)
EndIf

If Alias_LoveInterest.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
  Alias_LoveInterest.TryToMoveto(LoveInterestMarker)
EndIf

if( Alias_LoverWitness01.GetActorReference() != None )
  If Alias_LoverWitness01.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_LoverWitness01.TryToMoveto(LoveInterestWitnessMarker01)
  EndIf
EndIf

if( Alias_LoverWitness02.GetActorReference() != None )
  If Alias_LoverWitness02.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_LoverWitness02.TryToMoveto(LoveInterestWitnessMarker02)
  EndIf
EndIf

if( Alias_LoverWitness03.GetActorReference() != None )
  If Alias_LoverWitness03.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_LoverWitness03.TryToMoveto(LoveInterestWitnessMarker03)
  EndIf
EndIf

if( Alias_PlayerWitness01.GetActorReference() != None )
  If Alias_PlayerWitness01.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_PlayerWitness01.TryToMoveto(PlayerWitnessMarker01)
  EndIf
EndIf

if( Alias_PlayerWitness02.GetActorReference() != None )
  If Alias_PlayerWitness02.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_PlayerWitness02.TryToMoveto(PlayerWitnessMarker02)
  EndIf
EndIf

if( Alias_PlayerWitness03.GetActorReference() != None )
  If Alias_PlayerWitness03.GetActorReference().IsInLocation(RiftenTempleofMaraLocation) == False
    Alias_PlayerWitness03.TryToMoveto(PlayerWitnessMarker03)
  EndIf
EndIf

Alias_TemplePriest.TryToEvaluatePackage()
Alias_Briehl.TryToEvaluatePackage()
Alias_Dinya.TryToEvaluatePackage()

If GetStage() < 100
  WeddingScene.Start()
  if( Alias_PlayerWitness03.GetActorReference() != None )
    Alias_PlayerWitness03.GetActorReference().Disable()
    Alias_PlayerWitness03.GetActorReference().Enable()
  endif
  if( Alias_LoverWitness03.GetActorReference() != None )
    Alias_LoverWitness03.GetActorReference().Disable()
    Alias_LoverWitness03.GetActorReference().Enable()
  endif
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE RelationshipMarriageWeddingScript
Quest __temp = self as Quest
RelationshipMarriageWeddingScript kmyQuest = __temp as RelationshipMarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Wedding fails
RelationshipMarriage.SetObjectiveFailed(20, 1)

;LoveInterest hates the player
Alias_LoveInterest.GetActorReference().SetRelationshipRank(Game.GetPlayer(), -2)

If Alias_LoveInterest.GetActorReference().IsInFaction(CurrentFollowerFaction) == True
  DialogueFollower.DismissFollower()
EndIf

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Priest asks the player to say vows
Game.SetPlayerAIDriven(False)
Game.ShowFirstPersonGeometry( true )
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RelationshipMarriage  Auto  

ObjectReference Property PlayerWitnessMarker01  Auto  

ObjectReference Property PlayerWitnessMarker02  Auto  

ObjectReference Property PlayerWitnessMarker03  Auto  

ObjectReference Property LoveInterestWitnessMarker01  Auto  

ObjectReference Property LoveInterestWitnessMarker02  Auto  

ObjectReference Property LoveInterestWitnessMarker03  Auto  
ObjectReference Property PriestMarker  Auto  

ObjectReference Property LoveInterestMarker  Auto  

Scene Property WeddingScene  Auto  

Keyword Property RelationshipMarriageFIN  Auto  

Faction Property RelationshipCourtingFaction  Auto  

Scene Property PostWeddingScene  Auto  

Armor Property MarriageRingBondsofMatrimony  Auto  

Faction Property PotentialFollowerFaction  Auto  

Faction Property PlayerMarriedFaction  Auto  

Faction Property PlayerFaction  Auto  


ObjectReference Property MarriagePrayerIdleMarker  Auto  

Faction Property CurrentFollowerFaction  Auto  

DialogueFollowerScript Property DialogueFollower  Auto  

Location Property RiftenTempleofMaraLocation  Auto  

Faction Property PotentialHireling  Auto  

Scene Property RelationshipMarriageWeddingSceneView  Auto  

Faction Property MarriageCourtingFaction  Auto  
