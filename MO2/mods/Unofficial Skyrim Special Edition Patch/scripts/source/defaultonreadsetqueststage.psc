Scriptname DefaultOnReadSetQuestStage extends ReferenceAlias  

int Property myStage  Auto  

Quest Property myQuest  Auto  

; Fixed by the USKP adding the GetStageDone check to prevent repeated quests

event onRead()
	if (myQuest.GetStageDone(myStage) == 0)
		myQuest.setStage(myStage)
	endif
endEvent

