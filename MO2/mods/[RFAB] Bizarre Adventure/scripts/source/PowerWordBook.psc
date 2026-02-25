Scriptname PowerWordBook extends ObjectReference  

WordOfPower Property WordInBook Auto 

Event OnRead()
	Game.TeachWord(WordInBook)
EndEvent
