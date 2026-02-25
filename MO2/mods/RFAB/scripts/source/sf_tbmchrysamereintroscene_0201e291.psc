;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname SF_tbmChrysamereIntroScene_0201E291 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Courier.GetRef().MoveTo(Alias_DoorMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_Courier.GetRef().Disable()
GetOwningQuest().CompleteQuest()
GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Game.ShakeCamera(None, 1.0, 0.5)
Utility.Wait(0.5)
StartMessage.Show()
ChrysamereQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Courier  Auto  

ReferenceAlias Property Alias_DoorMarker  Auto  

ReferenceAlias Property Alias_Player  Auto  

Message Property StartMessage  Auto  

Quest Property ChrysamereQuest  Auto  
