Scriptname RFAB_Righteous extends ReferenceAlias  

Faction Property PlayerFaction Auto

Faction[] Property CivilianFactions Auto

GlobalVariable Property KilledCiviliansGV Auto

Keyword Property RighteousIgnore Auto

Event OnInit()
	PO3_Events_Alias.RegisterForActorKilled(self)
	RegisterForMenu("Journal Menu")
EndEvent

Event OnActorKilled(Actor akVictim, Actor akKiller)
	if (akKiller.IsInFaction(PlayerFaction) && IsCivilian(akVictim) && !akVictim.HasKeyword(RighteousIgnore))
		KilledCiviliansGV.Mod(1.0)
	endif
EndEvent

Event OnMenuOpen(string asMenuName)
	int iDelta = (KilledCiviliansGV.Value as int) - Game.QueryStat("Murders")
	if (iDelta != 0)
		Game.IncrementStat("Murders", iDelta)
	endif
EndEvent

bool Function IsCivilian(Actor akActor)
	return CivilianFactions.Find(akActor.GetCrimeFaction()) != -1
EndFunction