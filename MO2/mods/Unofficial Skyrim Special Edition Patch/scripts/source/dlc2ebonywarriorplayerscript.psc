Scriptname DLC2EbonyWarriorPlayerScript extends ReferenceAlias  

Quest Property DLC2EbonyWarriorQuest  Auto  
ReferenceAlias Property EbonyWarrior  Auto  
ReferenceAlias Property LastVigil  Auto  
Location Property DLC2LastVigilLocation  Auto  
Faction Property CrimeFactionWhiterun  Auto  

bool OnlyOnce

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if OnlyOnce == false
		if DLC2EbonyWarriorQuest.GetStage() == 100
			OnlyOnce = true
			EbonyWarrior.GetReference().MoveTo(LastVigil.GetReference())
			EbonyWarrior.GetActorReference().SetCrimeFaction(none)
			EbonyWarrior.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
		endif
	endif

	if akNewLoc == DLC2LastVigilLocation && OnlyOnce == true
		;UDBP 2.0.2 - Uh, Beth, you forgot the EbonyWarrior part. Otherwise you're trying to make the player fight themselves :P
		EbonyWarrior.GetActorReference().StartCombat(game.GetPlayer())
	endif
EndEvent

