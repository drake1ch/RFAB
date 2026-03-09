Scriptname NilsneKillScript extends ObjectReference  


Quest Property pDB03  Auto  
 
;This tracks Nilsine Shatter-Shield getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

	DB03Script pDB03Script = pDB03 as DB03Script

	if pDB03.GetStage () >= 20
		if pDB03.GetStage () <= 40
			pDB03.SetObjectiveCompleted(30)
			pDB03Script.NilsineDead = 1

			;USLEEP 3.0.4 Bug #20610
			if( Favor110.IsRunning() && Favor110.GetStage() == 0 )
				TorbjornRef.RemoveFromFaction(Favor110QuestGiverFaction)
				Favor110.SetStage(200)
			endif
		endif
	endif

	if pDB03.GetStage () < 20
		pDB03Script.NilsineDead = 1
		
		;USLEEP 3.0.4 Bug #20610
		if( Favor110.IsRunning() && Favor110.GetStage() == 0 )
			TorbjornRef.RemoveFromFaction(Favor110QuestGiverFaction)
			Favor110.SetStage(200)
		endif
	endif

EndEvent

Faction Property Favor110QuestGiverFaction Auto ;USLEEP 3.0.4 Bug #20610
Actor Property TorbjornRef Auto ;USLEEP 3.0.4 Bug #20610
Quest Property Favor110 Auto ;USLEEP 3.0.4 Bug #20610