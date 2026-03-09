Scriptname DLC1RNPCPlaySceneAfterInterval extends ObjectReference  
{Designed to be slapped on objects that also have DLC1defaultDetectPresenceTriggerScript. If the player stays in them for a while, a scene will play.}


Int Property SecondsToWait Auto

Quest ParentQuest

Scene Property DesiredScene Auto


Event OnTriggerEnter (ObjectReference akActivator)
	;Debug.Trace("RNPC: Player entered trigger, waiting...")
	If (akActivator == Game.GetPlayer())
		Utility.Wait(SecondsToWait)
		DLC1defaultDetectPresenceTriggerScript me = (Self As ObjectReference) As DLC1defaultDetectPresenceTriggerScript
		If ((me != None) && (me.PresenceDetected == True))
			If (DesiredScene != None)
				ParentQuest = DesiredScene.GetOwningQuest()
				If (ParentQuest == None) || ((ParentQuest != None) && ParentQuest.IsRunning())
					;Debug.Trace("RNPC: Player still in trigger after " + SecondsToWait + "; starting scene: " + DesiredScene)
					DesiredScene.Start()
					Delete()
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent 