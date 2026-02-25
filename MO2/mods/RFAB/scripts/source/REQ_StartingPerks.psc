Scriptname REQ_StartingPerks extends REQ_PlayerAlias

Perk[] Property HiddenPerks Auto

Race[] Property Races Auto
Perk[] Property RacesPerks Auto

Event OnAliasInit()
	OnRaceSwitchComplete()
	int i = HiddenPerks.Length
	while (i > 0)
		i -= 1
		Player.AddPerk(HiddenPerks[i])
	endwhile
EndEvent

Event OnRaceSwitchComplete()
	int iIndex = Races.Find(Player.GetRace())

	int i = RacesPerks.Length
	while (i > 0)
		i -= 1
		Player.RemovePerk(RacesPerks[i])
	endwhile

	if (iIndex >= 0)
		Player.AddPerk(RacesPerks[iIndex])
	endif
EndEvent