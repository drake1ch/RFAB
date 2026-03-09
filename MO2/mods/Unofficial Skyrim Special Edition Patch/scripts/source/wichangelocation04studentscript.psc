Scriptname WIChangeLocation04StudentScript extends ReferenceAlias  Conditional
{Script on Student Alias in WIChangeLocation04}

;USSEP 4.1.8 Bug #26775
Event OnDeath( actor akKiller )
	if( GetOwningQuest().IsObjectiveDisplayed(100) )
		GetOwningQuest().SetStage(200)
	endif
EndEvent

Event OnUnLoad()
	if( GetOwningQuest().IsObjectiveDisplayed(100) )
		GetOwningQuest().SetStage(200)
	endif
EndEvent
