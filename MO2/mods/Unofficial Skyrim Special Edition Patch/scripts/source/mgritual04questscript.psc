Scriptname MGRitual04QuestScript extends Quest  Conditional
;USKP 2.0.1 - All RegisterForUpdate() calls have been replaced with RegisterForSingleUpdate() instead to prevent this script from getting stuck in an infinite update loop.

int Property testinfo  Auto  Conditional

int Property InTrigger  Auto  Conditional

int Property Blocker  Auto  Conditional

int Property TimerVar  Auto  Conditional

Scene Property MGRitual04AugurEndScene  Auto

ReferenceAlias Property Alias_Augur  Auto

ReferenceAlias Property Alias_ItemTrigger  Auto

ObjectReference Property FXMarker  Auto

Activator Property SummonFXActivator  Auto


Event OnUpdate()

	if (GetStage() == 20)
		while (InTrigger == 0)
			FXMarker.PlaceAtMe(SummonFXActivator)
			Alias_ItemTrigger.GetReference().Enable()
			Utility.Wait(3)
		endwhile
	endif


	if (GetStage() == 40) 
		if (TimerVar == 0)
			TimerVar = 10
			Ghost01.GetReference().Enable(true)
			RegisterForSingleUpdate(8)
			RETURN
		endif


		if (TimerVar == 10)
			TimerVar = 20
			Ghost02.GetReference().Enable(true)
			RegisterForSingleUpdate(10)
			RETURN
		endif

		if (TimerVar == 20)
			TimerVar = 30
			Ghost03.GetReference().Enable(true)
			RegisterForSingleUpdate(10)
			RETURN
		endif


		if (TimerVar == 30)
			Ghost01.GetReference().Disable(true)
			Ghost02.GetReference().Disable(true)
			Ghost03.GetReference().Disable(true)
			Alias_Augur.GetReference().Enable()
			while !(Alias_Augur.GetReference().Is3DLoaded())
				Utility.Wait(2)
			endwhile
			MGRitual04AugurEndScene.Start()
			UnregisterForUpdate()
		endif
	endif

EndEvent
ReferenceAlias Property Ghost01  Auto  

ReferenceAlias Property Ghost02  Auto  

ReferenceAlias Property Ghost03  Auto  
