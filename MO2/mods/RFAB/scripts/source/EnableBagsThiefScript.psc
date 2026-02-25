Scriptname EnableBagsThiefScript extends ObjectReference  

Quest Property DealWithThiefQuest Auto

Event OnRead()
	DealWithThiefQuest.SetStage(10)
endEvent