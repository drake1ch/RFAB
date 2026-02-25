;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__161DD858 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.disablePlayerControls()

int i = 0
while i <= 5
	Game.GetPlayer().PlayIdle(StaggerStart)
	Game.ShakeCamera(Game.GetPlayer(), 1.0, 2.0)
	Utility.Wait(3.0)
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.EnablePlayerControls()
int i = 0
while i < DragonAspect.length
     Game.TeachWord(DragonAspect[i])
     i+=1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property StaggerStart Auto

WordOfPower[] Property DragonAspect  Auto  
