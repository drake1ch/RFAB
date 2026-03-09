;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_dunTalkingStoneQST_0004BA6C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Raider01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mammoth01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mammoth01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Talking_Stone_Herder_Giant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Talking_Stone_Herder_Giant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrotheimLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_OrotheimLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mammoth02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mammoth02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raider03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raider03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;When the boss in Orotheim has been killed, set this stage to switch over the scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; ;Debug.Trace("Scene manager activated.")
; ;Debug.Trace("Is Orotheim Cleared? " + Alias_OrotheimLocation.GetLocation().IsCleared())
;USKP 2.0.4 - This entire scripted encounter was badly constructed, broken, and never worked.
;All it ever did was fill the Papyrus logs with errors due to trying to disable and delete things that didn't exist.
;It was also grossly inefficient due to the multiple uses of expensive function calls.
Player = Game.GetPlayer()
if (!DelayActivation)
	if (GetStageDone(20)) ;Has Orotheim been cleared (at least once?)
		DelayActivation = True
		;Debug.Trace("Werewolves killed. Activating Herding scene.")
		HerdingScene.Stop()
		HerdingScene.Start()
		;Debug.Trace("Herding scene started successfully.")
		Utility.Wait (30)
		DelayActivation = False
	Elseif( SpawnedOnce )
		If(Player.HasLOS(Raider1) || Player.HasLOS(Raider2) || Player.HasLOS(Raider3) || Player.HasLOS(Raider4) || \
			Player.HasLOS(SpawnPoint1) || Player.HasLOS(SpawnPoint2) || Player.HasLOS(SpawnPoint3) || Player.HasLOS(SpawnPoint4) )
			;Do nothing.
			;Debug.Trace("Player has LoS, so aborting scene.")
		EndIf
	Else
		DelayActivation = True
		SpawnedOnce = True

		;Debug.Trace("Activating attack scene.")
		dunTalkingStoneFaction.SetEnemy(BanditFaction)
		if( Raider1)
			Raider1.Disable()
			Raider1.Delete()
		EndIf
		if( Raider2 )
			Raider2.Disable()
			Raider2.Delete()
		EndIf
		if( Raider3 )
			Raider3.Disable()
			Raider3.Delete()
		EndIf
		if( Raider4 )
			Raider4.Disable()
			Raider4.Delete()
		EndIf
		
		Raider1 = SpawnPoint1.PlaceActorAtMe(RaiderLeader, 1, NoResetZone)
		Alias_Raider01.ForceRefTo(Raider1)
		
		Raider2 = SpawnPoint2.PlaceActorAtMe(Raider, 0, NoResetZone)
		Alias_Raider02.ForceRefTo(Raider2)

		Raider3 = SpawnPoint3.PlaceActorAtMe(Raider, 0, NoResetZone)
		Alias_Raider03.ForceRefTo(Raider3)
		
		Raider4 = SpawnPoint4.PlaceActorAtMe(Raider, 0, NoResetZone)
		Alias_Raider04.ForceRefTo(Raider4)

		;Debug.Trace("New raiders spawned.")
		AttackScene.Stop()
		AttackScene.Start()
		;Debug.Trace("Attack scene started successfully.")
		Utility.Wait(20)
		DelayActivation = False
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Player
Actor Raider1
Actor Raider2
Actor Raider3
Actor Raider4
bool SpawnedOnce = False

Scene Property HerdingScene  Auto  

ObjectReference Property OrotheimRaiderSpawnPoint  Auto  

ActorBase Property WerewolfBase  Auto  

Scene Property AttackScene  Auto  

ObjectReference Property SpawnPoint1  Auto  

ObjectReference Property SpawnPoint2  Auto  

ObjectReference Property SpawnPoint3  Auto  

ObjectReference Property SpawnPoint4  Auto  

bool Property DelayActivation  Auto  

Faction Property dunTalkingStoneFaction  Auto  

Faction Property BanditFaction  Auto  

ActorBase Property Raider  Auto  

ActorBase Property RaiderLeader  Auto  

EncounterZone Property NoResetZone  Auto  
