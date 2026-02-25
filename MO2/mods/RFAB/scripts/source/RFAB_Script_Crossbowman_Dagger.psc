Scriptname RFAB_Script_Crossbowman_Dagger extends ActiveMagicEffect  

WEAPON[] Property Dagger  Auto 


Event OnEffectStart(Actor akTarget, Actor akCaster)

	int i= 0

		while (i<dagger.length) 

			if akTarget.GetItemCount(Dagger[i]) > 0
				akTarget.Equipitem(Dagger[i])
				i = dagger.length
			endif

			i=i+1

		endwhile
endevent
