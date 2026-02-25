Scriptname RFAB_BallLightning_Spell_Script extends ActiveMagicEffect  

SPELL Property SpellToCast  Auto  

Actor Property Player  Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)


	while akTarget.isInCombat() 
			
		int a = Utility.RandomInt(0, 4)

			while akTarget.GetDistance(Player as ObjectReference) < 2000 && akTarget.GetDistance(Player as ObjectReference) >300 && akTarget.isInCombat() && a<10
				Utility.wait(0.5)
				a+=1
			endwhile
	
			if a>=10
				SpellToCast.RemoteCast(akTarget, akTarget, Player)
			endif

	endwhile

endevent
			
			