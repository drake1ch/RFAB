Scriptname NN01QuestScript extends Quest  Conditional

GlobalVariable Property pNN01Count Auto Conditional
int Property pNNTold01 Auto Conditional
ObjectReference Property pSarethiFarmMapMarker Auto

Function GotARoot(int aiCount)
	if GetStage() == 10
		SetStage(15)
		pNN01Count.Value += aiCount
	elseif GetStage() == 15
		pNN01Count.Value += aiCount		
	elseif GetStage() == 20
		if pNN01Count.Value < 30
			ModObjectiveGlobal(aiCount, pNN01Count, 10)
		elseif pNN01Count.Value >= 30
			pNN01Count.Value += aiCount	
		endif
	endif

	if pNN01Count.Value >= 30
		SetObjectiveCompleted(10, 1)
		SetObjectiveDisplayed(20, 1)
		pSarethiFarmMapMarker.AddToMap()
	endif
EndFunction

Function LostARoot(int aiCount)
	if GetStage() < 20
		pNN01Count.Value -= aiCount		
	elseif GetStage() == 20
		ModObjectiveGlobal(-aiCount, pNN01Count, 10)			
	endif

	if IsObjectiveDisplayed(20)
		SetObjectiveDisplayed(20, 0)
	endif
EndFunction