Scriptname RFAB_BA_CuralmilDiary extends ObjectReference  

Quest Property MyQuest Auto

Event OnRead()

	if MyQuest.GetStage() == 10
		MyQuest.SetStage(20)
	endif

EndEvent