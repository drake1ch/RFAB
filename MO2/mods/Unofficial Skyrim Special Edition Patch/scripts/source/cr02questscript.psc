Scriptname CR02QuestScript extends CompanionsRadiantQuest Conditional

LocationAlias Property AnimalDen auto
ReferenceAlias Property BeastBoss auto

Function Setup()
; 	Debug.Trace("CRQ: CR02 alias den: " + AnimalDen.GetLocation())
; 	Debug.Trace("CRQ: CR02 alias boss: " + BeastBoss.GetReference())
	parent.Setup()
EndFunction

Function Accepted()
	parent.Accepted()
	;USKP 2.0.1 - Sanity check. Some animal dens are in worldspaces and can't be reset.
	if( BeastBoss.GetReference().GetParentCell() )
		BeastBoss.GetReference().GetParentCell().Reset()
	EndIf
EndFunction
