Scriptname EbonyWarriorXMarkerToggle extends ObjectReference

Event OnCellAttach()
Actor EbonyWarrior = Game.GetFormFromFile(0x00030CC9, "Dragonborn.esm") As Actor
	if self.IsEnabled()
		if EbonyWarrior.IsDead() == 1
			EbonyWarrior.Disable()
			self.Disable()
		endif
	endif
EndEvent
