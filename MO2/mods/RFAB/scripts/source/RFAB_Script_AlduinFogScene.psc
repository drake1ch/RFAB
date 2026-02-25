Scriptname RFAB_Script_AlduinFogScene extends ActiveMagicEffect  

Scene Property myScene  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)
	myScene.Start()
endevent
SPELL Property FogSpell  Auto  
