Scriptname USKP_ClearAliasOnDeath extends ReferenceAlias  
{USKP Script to clear an alias when the aliased actor dies. Prevents corpses from persisting forever.}

Event OnDeath( Actor akActor )
	Self.Clear()
EndEvent
