Scriptname setstageoncombatstate extends ReferenceAlias  

Quest Property MQuest  Auto  

Int Property StageToSet  Auto  

Int Property CurrentStage  Auto  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	If MQuest.GetStage() == CurrentStage
MQuest.Setstage(StageToSet)
	EndIF

EndEvent