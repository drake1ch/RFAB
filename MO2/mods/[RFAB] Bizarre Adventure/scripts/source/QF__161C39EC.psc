;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF__161C39EC Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Закончилась сцена с Катрией
if Game.GetPlayer().GetItemCount(Alias_QuestItem.GetReference()) >= 1
	SetStage(100)
endif
Game.EnablePlayerControls()
if !IsStageDone(80)
	SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Игрок подобрал сердечник

SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

if IsStageDone(75)
	SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Game.GetPlayer().MoveTo(NearKatriaMarker)
Game.DisablePlayerControls()

SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)

Utility.Wait(3)

Actor Katria = Alias_Katria.GetReference() as Actor

int CraftedItemID = Utility.RandomInt(0, 2)

if      CraftedItemID == 0
	Katria.AddItem(Crown, 1)
	Katria.EquipItem(Crown)
elseif CraftedItemID == 1
	Katria.AddItem(Shield, 1)
	Katria.EquipItem(Shield)
elseif CraftedItemID == 2
	Katria.AddItem(Staff, 1)
	Katria.EquipItem(Staff)
endif

DLC1LD_Bthalft.SetStage(90)
SetObjectiveCompleted(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Actor Player = Game.GetPlayer()
game.disablePlayerControls()
AMBBlackBookShakeMarker.Play(Player)
Game.ShakeCamera(afStrength = 1.0, afDuration = 5.0) 
Image.ApplyCrossFade(1.00000)
utility.wait(3.0)

Player.RemoveSpell(DLC1LD_GhostAbility)
Player.SetAlpha(1.0)
Player.MoveTo(Marker)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_QuestItem.GetReference(), 1)
kmyQuest.GiveExperienceForQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)

Actor Player = Game.GetPlayer()
Actor Katria = Alias_Katria.GetActorRef()

Game.DisablePlayerControls()
AMBBlackBookShakeMarker.Play(Player)
Game.ShakeCamera(afStrength = 1.0, afDuration = 5.0) 
Image.ApplyCrossFade(1.00000)

utility.wait(3.0)

Marker = Player.PlaceAtMe(XMarkerHeading)
kmyQuest.TeleportToLocation()
Player.RemoveItem(Alias_StrangeDevice.GetReference(), 1)
Player.AddSpell(DLC1LD_GhostAbility, false)
Player.SetAlpha(0.5)

Katria.Enable()
Katria.MoveTo(KatriaMarker)
Katria.SetGhost()

int i = 0
while i < LightTriggers.Length
	LightTriggers[i].OnTriggerEnter(Player)
	i += 1
endwhile

MoveToGates.ForceStart()

int j = 0
while j < Triggers.Length
	Triggers[j].OnHit(None, None, None, false, false, false, false)
	j += 1
endwhile

utility.wait(1.0)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property TeleportAnimation  Auto  

Sound Property AMBBlackBookShakeMarker  Auto  

ObjectReference[] Property LightTriggers  Auto  

ImageSpaceModifier Property Image  Auto  

ObjectReference Property KatriaMarker  Auto  

Spell Property DLC1LD_GhostAbility  Auto  

Scene Property MoveToGates  Auto  

ObjectReference[] Property Triggers  Auto  

Armor Property Crown Auto
Armor Property Shield Auto
Weapon Property Staff Auto  

Quest Property DLC1LD_Bthalft Auto

Static Property XMarkerHeading Auto

ObjectReference Marker

ObjectReference Property NearKatriaMarker Auto

