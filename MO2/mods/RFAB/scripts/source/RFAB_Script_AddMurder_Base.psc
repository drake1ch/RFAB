Scriptname RFAB_Script_AddMurder_Base extends Actor

Event OnDeath(Actor akKiller)
	If akKiller == Game.GetPlayer()
		Game.IncrementStat("Murders")
	Endif
EndEvent