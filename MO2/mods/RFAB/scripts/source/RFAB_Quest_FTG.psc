Scriptname RFAB_Quest_FTG extends Quest  

Quest[] Property TGQuests Auto

int[] Property Stages Auto

Quest[] Property PostTGQuests Auto

Function StopTGQuests()
	int i = 0
	while i < TGQuests.Length
		TGQuests[i].SetStage(Stages[i])
		i += 1
	endwhile
EndFunction

Function StartPostTGQuests()
	int i = 0
	while i < TGQuests.Length
		PostTGQuests[i].Start()
		i += 1
	endwhile
EndFunction