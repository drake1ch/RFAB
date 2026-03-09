scriptName USKP_WEArdwenDeathScript extends actor
{script that sets a global variable when Ardwen is killed}

globalVariable property USKPWEJS13ArdwenIsDead auto

Event OnDeath(Actor akKiller)
	USKPWEJS13ArdwenIsDead.setValue(1)
endEvent
