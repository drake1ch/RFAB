;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname RFAB_CarriagesDialogue Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
	Game.DisablePlayerControls()
	UI.CloseCustomMenu() 

	UI.OpenCustomMenu("RFAB_CarriageMenu")

	
	string currentMarker = ""
	string playerMoney = Game.GetPlayer().GetGoldAmount() as string
	
	RFAB_CarriagesTravel carriagesScript = GetOwningQuest() as RFAB_CarriagesTravel
	carriagesScript.CurrentDriver = akSpeaker
	
	int i = 0
	while i < carriagesScript.Drivers.length
		if (akSpeaker == carriagesScript.Drivers[i]) 
			currentMarker = carriagesScript.MarkersNames[i]	
			carriagesScript.CommentLoop(i)
		endif
		i += 1
	endwhile
	
	string[] InitParams = new string[3]
	InitParams[0] = currentMarker
	InitParams[1] = playerMoney
	InitParams[2] = carriagesScript.costMultiplier
	
	UI.InvokeStringA("CustomMenu", "_root.Map.InitParams", InitParams) 
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
	utility.wait(0.5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

