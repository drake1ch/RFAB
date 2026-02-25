Scriptname RFAB_Script_ChangeNameOnInit extends ObjectReference  

String[] Property Name Auto  
Quest[] Property myQuest  Auto  

Event OnInit()
	if (MyQuest[0].IsCompleted() || MyQuest[1].IsCompleted())
		self.GetBaseObject().SetName(Name[0])
	endif
		if (MyQuest[0].IsCompleted() && MyQuest[1].IsCompleted())
		self.GetBaseObject().SetName(Name[1])
	endif
endevent

