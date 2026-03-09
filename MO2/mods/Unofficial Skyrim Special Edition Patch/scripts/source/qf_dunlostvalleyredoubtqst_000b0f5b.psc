;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunLostValleyRedoubtQST_000B0F5B Extends Quest Hidden Conditional

;BEGIN ALIAS PROPERTY SharpeningWheelGuy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SharpeningWheelGuy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeartChatterGuy02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BriarHeartChatterGuy02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeartChatterGuy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BriarHeartChatterGuy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BriarHeart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BriarHeart Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Hagraven Scene has ended activate Briarheart
briarheartSceneComplete = True

;USKP 2.0.8 - The kMyQuest property doesn't exist so can't check it.
if ritualComplete
	alias_Briarheart.getReference().activate(alias_Briarheart.getReference())
else
	alias_Briarheart.getActorReference().kill(game.getPlayer())
endif

BossTrigger.Enable()
if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;ChatterSceneComplete

chatterSceneComplete = True

if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Sharpening Scene complete

sharpeningSceneComplete = True

if briarheartSceneComplete && chatterSceneComplete && sharpeningSceneComplete
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;All Scenes complete stop quest

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bool Property sharpeningSceneComplete  Auto  

bool Property ChatterSceneComplete  Auto  

bool Property briarheartSceneComplete  Auto  

ObjectReference Property BossTrigger  Auto  

bool Property ritualComplete = false Auto  

bool Property HagravensAttacked = false Auto Conditional

int Property USKPHagravensDead = 0 Auto ; USKP 2.0.8

Function USKPIncrementHagravensKilled()
	USKPHagravensDead += 1
	
	if( USKPHagravensDead >= 2 && GetStage() < 100 )
		SetStage(100)
	EndIf
EndFunction

function setHagravensAttacked()
	HagravensAttacked = true
endFunction
