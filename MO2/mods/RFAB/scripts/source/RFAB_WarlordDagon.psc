Scriptname RFAB_WarlordDagon extends ObjectReference  

RFAB_Deadlands_OblTowerBossScript Property BossScript Auto

Event OnDeath(Actor akKiller)
	BossScript.OnWarlordDie()
EndEvent