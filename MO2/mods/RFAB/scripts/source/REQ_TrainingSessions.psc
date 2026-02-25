Scriptname REQ_TrainingSessions extends REQ_PlayerAlias
{sets the global flag that disables experience-rate rescaling effects during training sessions}

GlobalVariable Property REQ_Player_Is_Training Auto

Event OnAliasInit()
	RegisterForMenu("Training Menu")
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("Training Menu")
EndEvent

Event OnMenuOpen(String menuName)
	REQ_Player_Is_Training.SetValueInt(1)
EndEvent

Event OnMenuClose(String menuName)
	REQ_Player_Is_Training.SetValueInt(0)
EndEvent