Scriptname USKP_ValdAliasOnDeath extends ReferenceAlias  

Quest Property FreeformValdDebt Auto

Event OnDeath(Actor akKiller)
	if( FreeformValdDebt.GetStage() == 10 )
		FreeformValdDebt.SetObjectiveFailed(10)
		FreeformValdDebt.Stop()
	EndIf
	
	if( FreeformValdDebt.GetStage() == 40 )
		FreeformValdDebt.Stop()
	EndIf
EndEvent
