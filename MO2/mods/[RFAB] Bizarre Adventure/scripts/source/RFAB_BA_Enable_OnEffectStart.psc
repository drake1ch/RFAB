Scriptname RFAB_BA_Enable_OnEffectStart extends ActiveMagicEffect  

ObjectReference[] Property ObjToEnable  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i = 0
	while i < ObjToEnable.length
		ObjToEnable[i].Enable()
		i+=1
	endwhile
EndEvent

