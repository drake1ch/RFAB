Scriptname DBSanctuarySkillBooksScript extends ObjectReference  
{Track which DB Sanctuary skill books the player has acquired to prevent duplicates or interferance from the DB10 Fire.}

Quest property dunSkillBooksQST Auto
int property dunSkillBooksQSTStage Auto
Quest property DB10 Auto
Quest property DB11 Auto
Location property DarkBrotherhoodSanctuaryLocation Auto
Location property DawnstarSanctuaryLocation Auto

;USKP 2.0.4 - Rewritten to only mess with these books in one of the two sanctuaries.
Event OnCellLoad()
	if( !dunSkillBooksQST.GetStageDone(dunSkillBooksQSTStage) )
		if( Self.GetCurrentLocation() == DarkBrotherhoodSanctuaryLocation )
			if !(DB10.GetStageDone(1))
				Self.Enable()
			else
				Self.Disable()
			EndIf
		ElseIf( Self.GetCurrentLocation() == DawnstarSanctuaryLocation )
			if( DB11.GetStageDone(80) )
				Self.Enable()
			else
				Self.Disable()
			EndIf
		EndIf
	EndIf
EndEvent
