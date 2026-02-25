Scriptname RFAB_ChangeWeather_OnEffectStart extends ActiveMagicEffect  

Weather[] Property MyWeather  Auto  

SPELL[] Property Training  Auto    


Event OnEffectStart(Actor akTarget, Actor akCaster)

int i = 0

	while i<training.length

		if akTarget.HasSpell(Training[i])
			MyWeather[i].ForceActive(true)
		endif
		i += 1

	endwhile

endevent


Event OnEffectFinish(Actor akTarget, Actor akCaster)

Weather.ReleaseOverride()

endevent
