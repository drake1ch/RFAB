Scriptname tbmChrysamereActivatorScript extends ObjectReference  
{Plays a short animation and warps player to the cave when activated.}

ImageSpaceModifier Property finalEffect Auto
ImageSpaceModifier Property rumbleEffect Auto
ObjectReference Property teleportDestination Auto
ObjectReference Property realActivator Auto
Quest Property tbmChrysamereQuest  Auto
Message Property tbmChrysamereCantUseMsg Auto
Sound Property yankSound Auto
Sound Property slideSound Auto
Sound Property portSound Auto
Message Property tbmChrysamerePullSwordMsg Auto

Auto State stateWaiting
	Event OnActivate (objectReference triggerRef)
		If (tbmChrysamereQuest.GetStage() < 20)
			tbmChrysamereCantUseMsg.Show()
		Else
			If (tbmChrysamerePullSwordMsg.Show() == 0)
				self.BlockActivation(true)

				GotoState("stateAnimatingStep1")
				rumbleEffect.Apply(0.1)
				yankSound.Play(self)
				Game.ShakeCamera(afStrength = 0.1, afDuration = 0.5)
				TranslateTo(self.GetPositionX() + 6, self.GetPositionY(), self.GetPositionZ() + 3, 89.0, 0.0, -4.0, 15.0, 40.0)
			EndIf
		EndIf
	EndEvent
endState

State stateAnimatingStep1
	Event OnTranslationComplete()
		Utility.Wait(0.6)
		rumbleEffect.Remove()
		
		GotoState("stateAnimatingStep2")
		rumbleEffect.Apply(0.2)
		yankSound.Play(self)
		Game.ShakeCamera(afStrength = 0.2, afDuration = 0.9)
		TranslateTo(self.GetPositionX() - 14, self.GetPositionY(), self.GetPositionZ() + 5, 91.0, 0.0, 8.0, 20.0, 80.0)
	EndEvent
EndState

State stateAnimatingStep2
	Event OnTranslationComplete()
		Utility.Wait(1.0)
		rumbleEffect.Remove()
		
		GotoState("stateRemove")
		rumbleEffect.Apply(0.3)
		yankSound.Play(self)
		Game.ShakeCamera(afStrength = 0.8, afDuration = 1.3)
		TranslateTo(self.GetPositionX() + 8, self.GetPositionY(), self.GetPositionZ() + 24, 90.0, 0.0, 0.0, 25.0, 120.0)
	EndEvent
EndState

State stateRemove
	Event OnTranslationComplete()
		rumbleEffect.Remove()
		finalEffect.Apply(1.0)
		portSound.Play(self)

		Utility.Wait(2.5)

		; Game.GetPlayer().MoveTo(teleportDestination)
		porterQuest.Start()
		porterQuest.SetStage(porterStage)
		porterQuest.Stop()

		Utility.Wait(4.0)

		finalEffect.Remove()
		realActivator.Enable()
		self.Disable()
	EndEvent
EndState


Quest Property porterQuest  Auto  

Int Property porterStage  Auto  
