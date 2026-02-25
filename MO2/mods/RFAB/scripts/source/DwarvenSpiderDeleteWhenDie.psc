Scriptname DwarvenSpiderDeleteWhenDie extends Actor  

Event OnDying(Actor akKiller)
	Utility.Wait(0.5)
	self.Delete()
EndEvent