Scriptname CR05QuestScript extends CompanionsRadiantQuest Conditional


ReferenceAlias Property Boss auto

Function Accepted()
	parent.Accepted()
	;USKP 2.0.2 - Can't reset exterior cells.
	if( Boss.GetReference().GetParentCell() )
		Boss.GetReference().GetParentCell().Reset()
	EndIf
EndFunction
