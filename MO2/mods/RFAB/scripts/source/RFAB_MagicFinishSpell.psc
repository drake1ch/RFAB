Scriptname RFAB_MagicFinishSpell extends ActiveMagicEffect  
Spell[] Property ToDispel Auto
Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (Todispel != None)
		int i = 0
		while i < ToDispel .length
			akTarget.DispelSpell(ToDispel[i])
			i +=1
		endwhile
	endif
EndEvent