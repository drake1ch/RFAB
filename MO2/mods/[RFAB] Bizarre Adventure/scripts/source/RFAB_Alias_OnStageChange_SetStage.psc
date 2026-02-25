Scriptname RFAB_Alias_OnStageChange_SetStage extends ReferenceAlias  

Quest Property ListenerQuest Auto
Quest Property NeededQuest Auto

Int Property ListenerStage Auto
Int Property NeededStage Auto  

Event OnInit()
    PO3_Events_Alias.RegisterForQuestStage(self as Alias, ListenerQuest)
EndEvent

Event OnQuestStageChange(Quest akQuest, Int aiNewStage)

	if aiNewStage == ListenerStage
		NeededQuest.SetStage(NeededStage)
	endif

EndEvent