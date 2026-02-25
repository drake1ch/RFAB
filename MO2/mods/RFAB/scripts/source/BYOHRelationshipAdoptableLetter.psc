scriptName BYOHRelationshipAdoptableLetter extends ObjectReference
{When the player reads Constance's Letter ('Consider Adoption'), notify the Adoptable quest so it can display an objective if appropriate.}

Quest property BYOHRelationshipAdoptable Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		(BYOHRelationshipAdoptable as BYOHRelationshipAdoptableScript).ShowOrphanageObjective(1)
	endif
EndEvent