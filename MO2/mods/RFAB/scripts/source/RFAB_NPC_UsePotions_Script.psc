Scriptname RFAB_NPC_UsePotions_Script extends ActiveMagicEffect  


Potion[] Property Alcohol  Auto  

Potion[] Property HPPot  Auto  

MagicEffect Property AlcoholEffect  Auto  

MagicEffect Property HealEffect  Auto  

SPELL Property SpellScript  Auto  

SPELL Property ForbidStance  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

	int a= 0
		Utility.wait(0.5)

		while (a<alcohol.length) && !aktarget.HasMagicEffect(AlcoholEffect) && !aktarget.isDead()

			if akTarget.GetItemCount(Alcohol[a]) > 0
				akTarget.Equipitem(Alcohol[a])

			endif

			a=a+1

		endwhile


	int h= 0
		Utility.wait(0.5)

		while (h<HPPot.length) && !aktarget.HasMagicEffect(HealEffect) && !aktarget.isDead()

			if akTarget.GetItemCount(HPPot[h]) > 0
				akTarget.Equipitem(HPPot[h])

			endif

			h=h+1

		endwhile
			
			if aktarget.HasMagicEffect(HealEffect) && !aktarget.HasSpell(ForbidStance)
				
				akTarget.Addspell(SpellScript)
				Utility.wait(5.0)

				akTarget.removespell(SpellScript)
		endif

endevent


