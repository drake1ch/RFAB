Scriptname MS08InteriorBaseTriggerScript extends ObjectReference  

Quest Property MS08  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

MS08QuestScript QuestScript = MS08 as MS08QuestScript


	if ActionRef == Game.GetPlayer()
		;USLEEP 3.0.10 Bug #22354
		if( MS08.GetStage() >= 10 && MS08.GetStage() < 101 )
			if MS08.GetStage() < 75
				QuestScript.DungeonFound = 1
			else
				MS08.SetStage(100)
			endif
		endif
	endif


EndEvent