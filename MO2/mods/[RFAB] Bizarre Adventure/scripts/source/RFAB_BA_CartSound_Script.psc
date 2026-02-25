Scriptname RFAB_BA_CartSound_Script extends ObjectReference  

Event OnLoad()
	while !QuestProperty.IsStageDone(43)
		int instanceID = CartSound.play(Game.GetPlayer())  
		Utility.wait(9.8)
	endwhile
endEvent
Sound Property CartSound  Auto  

Quest Property QuestProperty  Auto  
