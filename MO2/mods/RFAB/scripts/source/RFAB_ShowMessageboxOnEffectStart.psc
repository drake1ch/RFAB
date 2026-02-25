Scriptname RFAB_ShowMessageboxOnEffectStart extends ActiveMagicEffect  
string property messageToShow auto
bool property showOnStart = true auto
bool property showOnFinish = false auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if showOnStart 
		debug.messagebox(messageToShow )
	endif
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if showOnFinish 
		debug.messagebox(messageToShow )
	endif
endEvent