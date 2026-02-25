Scriptname tbmChrysamereReturnPorterScript extends ObjectReference  
{Script for returning the player to chrysamere reliquary}

ImageSpaceModifier Property rumbleEffect Auto
ObjectReference Property teleportDestination Auto
Quest Property tbmChrysamereQuest Auto
Message Property tbmChrysamereCantUseMsg Auto
Sound Property portSound Auto

Auto State stateWaiting
	Event OnActivate (objectReference triggerRef)
		If (tbmChrysamereQuest.GetStage() < 60)
			tbmChrysamereCantUseMsg.Show()
		Else
			self.BlockActivation(true)
			rumbleEffect.Apply(1.0)
			Game.ShakeCamera(afStrength = 0.6, afDuration = 1.0)
			portSound.Play(self)
			Utility.Wait(2.5)

			; Game.GetPlayer().MoveTo(teleportDestination)
			porterQuest.Start()
			porterQuest.SetStage(porterStage)
			porterQuest.Stop()

			Utility.Wait(4.0)
			rumbleEffect.Remove()
			self.BlockActivation(false)
		EndIf
	EndEvent
endState

Quest Property porterQuest  Auto  

Int Property porterStage  Auto  
