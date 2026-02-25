;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__1701A649 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
Persona.GetRef().PlaceAtMe(SummonFX)
Utility.wait(1)
BizarreSheoMarker.Disable()
Utility.wait(1.3)
Sheogorath.GetRef().MoveTo(IdleMarker)
Sheogorath.GetRef().PlaceAtMe(SummonFX)
Utility.wait(1)
Sheogorath.GetRef().Enable()
Utility.wait(1)
SheoScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Persona  Auto  

ReferenceAlias Property Sheogorath  Auto  

Activator Property SummonFX  Auto  

ObjectReference Property IdleMarker  Auto  

Scene Property SheoScene  Auto  

WEAPON Property Wabbajack  Auto  

ObjectReference Property BizarreSheoMarker  Auto  
