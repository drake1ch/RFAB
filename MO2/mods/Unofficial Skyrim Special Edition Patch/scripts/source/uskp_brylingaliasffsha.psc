Scriptname USKP_BrylingAliasFFSHA extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	if( GetOwningQuest().GetStage() < 10 )
		GetOwningQuest().SetStage(25)
	Else
		GetOwningQuest().SetStage(30)
	EndIf
EndEvent
