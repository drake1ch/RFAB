Scriptname FFRiften21QuestScript extends Quest  Conditional

int Property pFFR21Entered Auto Conditional
GlobalVariable Property pFFR21Count Auto Conditional
Quest Property pFFRiften21Quest Auto Conditional

Function JournalCheck()

	if pFFRiften21Quest.IsRunning() == 1

		;USSEP 4.2.4 Bug #29310
		if( pFFRiften21Quest.GetStageDone(20) == 1 )
			ModObjectiveGlobal(1, pFFR21Count, 20)
		else
			pFFR21Count.Mod(1)
		endif

		if pFFR21Count.Value >= 4
			;USLEEP 3.0.5 Bug #20959
			if (pFFRiften21Quest.GetStageDone(20) == 1)
				pFFRiften21Quest.SetStage(40)
			endif
		endif
	endif

endFunction