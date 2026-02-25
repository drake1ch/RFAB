Scriptname RFAB_CastSpellOnEffectStart extends ActiveMagicEffect  

SPELL[] Property mySpell  Auto  

Int Property Times  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)
int a = 1

	while a<=Times
		int g = 0
		while g < MySpell.length
			MySpell[g].Cast(akTarget)
			g+=1
		endwhile
		utility.wait(1.0)
	
	a += 1
	
	endwhile

endevent
