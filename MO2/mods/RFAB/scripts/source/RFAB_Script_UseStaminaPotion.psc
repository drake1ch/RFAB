Scriptname RFAB_Script_UseStaminaPotion extends ActiveMagicEffect  

Potion[] Property StaminaPotion  Auto  

MagicEffect Property PotionEffect  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

	int i= 0
		Utility.wait(0.5)

		while (i<staminapotion.length) && !aktarget.HasMagicEffect(PotionEffect)&& !aktarget.isDead()

			if akTarget.GetItemCount(StaminaPotion[i]) > 0
				akTarget.Equipitem(StaminaPotion[i])

			endif

			i=i+1

		endwhile

endevent