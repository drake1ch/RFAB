Scriptname pDBEntranceQuestScript extends Quest  Conditional

Quest Property WICourier  Auto  
Book Property DBEntranceLetter  Auto  
int Property pSleepyTime  Auto Conditional 
ObjectReference Property pPlayerShackMarker  Auto
ReferenceAlias Property pAstridAlias  Auto  
int Property pPlayerSecondSleep  Auto Conditional  
Idle Property WakeUp Auto
ImageSpaceModifier Property Woozy Auto

; When stage is set to 30, register for sleep via RegisterForSleep()

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)

; For the player sleeping, to move him to the shack to be forcegreeted by Astrid.
If pSleepyTime == 1
		Game.DisablePlayerControls(ablooking = true, abCamSwitch = true)
	       Game.ForceFirstPerson()
		Game.GetPlayer().MoveTo(pPlayerShackMarker)
		Woozy.Apply()
		Game.GetPlayer().PlayIdle(WakeUp)
		Utility.Wait (3)
		pSleepyTime = 3
endif

;Tempted in for future, when sleeping is working
;If the player is sleeping
	;play the sleeping/wake up animation
	;in previous block, set pSleepyTime to 2, and use 2 in this block to have the player play the wakeup animnation, then set to 3 to have Astrid forcegreet
;endif

; For the player sleeping the second time, and being greeted by Astrid (commented out because it's no longer used)

;If pPlayerSecondSleep == 0
	;If pSleepyTime >= 5
			;pSleepyTime = 6
			;pAstridAlias.GetReference().Moveto (Game.GetPlayer(), afXOffset = 60.0)
			;pPlayerSecondSleep = 1
	;endif
;endif


EndEvent




DarkBrotherhood Property DarkBrotherhoodQuest  Auto  

ReferenceAlias Property Captive1Alias  Auto  

ReferenceAlias Property Captive2Alias  Auto  

ReferenceAlias Property Captive3Alias  Auto  

int Property AstridSleepGreet  Auto Conditional 

int Property AstridMove  Auto Conditional 

;USKP 2.0.4 - Bug #15052: Take care of setting Aventus up to move to Riften.
Faction Property CrimeFactionEastmarch  Auto  
Faction Property CrimeFactionRift  Auto  
Faction Property WindhelmAretinoResidenceFaction  Auto  
Faction Property TownRiftenFaction  Auto  
Faction Property TownWindhelmFaction  Auto  
Actor Property AventusAretinoREF  Auto
Actor Property AngrenorREF  Auto
ObjectReference Property HonorhallGrelodSceneMarker Auto

Function MoveAventusOut()
	;Fix up Aventus Aretino so that he will switch factions properly at the end of DB01.
	AventusAretinoREF.RemoveFromFaction(CrimeFactionEastmarch)
	AventusAretinoREF.RemoveFromFaction(TownWindhelmFaction)
	AventusAretinoREF.RemoveFromFaction(WindhelmAretinoResidenceFaction)
	AventusAretinoREF.AddToFaction(CrimeFactionRift)
	AventusAretinoREF.AddToFaction(TownRiftenFaction)
	AventusAretinoREF.SetCrimeFaction(CrimeFactionRift)
	AventusAretinoREF.MoveTo(HonorhallGrelodSceneMarker)

	;Fix Angrenor so that he switched ownership factions and moves into Aventus' old house.
	AngrenorREF.AddToFaction(WindhelmAretinoResidenceFaction)
EndFunction
