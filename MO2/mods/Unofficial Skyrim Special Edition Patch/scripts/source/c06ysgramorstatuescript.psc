Scriptname C06YsgramorStatueScript extends ObjectReference  

Weapon Property BladeOfYsgramor auto
ObjectReference Property BladeInstance auto
Quest Property C06 auto
ObjectReference Property TombDoor auto
ObjectReference Property USKPWuuthradChestRef Auto ; Added by USKP 1.3.3. Wuuthrad can be modified after acquiring it. This script used to lose that.

auto State NoBlade
	Event OnBeginState()
		BladeInstance.Disable()
		;;TombDoor.Activate(Game.GetPlayer())
		TombDoor.Enable(true)
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			if (Game.GetPlayer().GetItemCount(BladeOfYsgramor) > 0)
				NorPortcullisSCRIPT doorScript = TombDoor as NorPortcullisSCRIPT
				;;if (doorScript.isAlreadyOpen || doorScript.isOpening)
				if (TombDoor.IsDisabled())
					return
				endif
				;Removal modified by USKP 1.3.3 to preserve any tempering the player may have done on the axe. Store in a non-respawning chest in the cell.
				Game.GetPlayer().RemoveItem(BladeOfYsgramor, 1, false, USKPWuuthradChestRef)
				if (C06.IsRunning() && C06.GetStageDone(40) == False)
					C06.SetStage(40)
				endif
				GoToState("Blade")
			endif
		endif
	EndEvent
EndState

State Blade
	Event OnBeginState()
		BladeInstance.Enable()
		TombDoor.PlayAnimation("open")
		Utility.Wait(10)
		TombDoor.Disable(true)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			; NorPortcullisSCRIPT doorScript = TombDoor as NorPortcullisSCRIPT
			; if (!doorScript.isAlreadyOpen || doorScript.isClosing)
			; if (TombDoor.IsEnabled())
				; return
			; endif
			; Block modified by USKP 1.3.3 - Since this can't be retroactive, make sure the chest has a copy before trying to transfer it back.
			if( USKPWuuthradChestRef.GetItemCount(BladeOfYsgramor) > 0 )
				USKPWuuthradChestRef.RemoveAllItems(Game.GetPlayer())
			Else
				Game.GetPlayer().AddItem(BladeOfYsgramor, 1)
			EndIf
			GoToState("Done") ; forget it, don't close the door once it's been opened
		endif
	EndEvent
EndState

State Done
	Event OnBeginState()
		BladeInstance.Disable()
	EndEvent
EndState