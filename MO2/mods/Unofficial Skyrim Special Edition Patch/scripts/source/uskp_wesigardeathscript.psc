scriptName USKP_WESigarDeathScript extends actor
{script that sets a global variable when Sigar is killed}

globalVariable property USKPWEJS11SigarIsDead auto

Event OnDeath(Actor akKiller)
	USKPWEJS11SigarIsDead.setValue(1)
endEvent
