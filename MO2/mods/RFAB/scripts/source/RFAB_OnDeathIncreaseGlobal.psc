Scriptname RFAB_OnDeathIncreaseGlobal extends ActiveMagicEffect  


GlobalVariable Property GlobalToIncrease  Auto  


Float Property Increment = 1.0  Auto  

event OnDying(Actor akKiller) 
	GlobalToIncrease .Mod(Increment)
endevent
