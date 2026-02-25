Scriptname WB_ControlWeather2_Script extends activemagiceffect  

; -----

Message Property WB_AlterationAlt_Message_ControlWeather Auto
Message Property WB_AlterationAlt_Message_ControlWeather_WrongWeather Auto
Message Property WB_AlterationAlt_Message_ControlWeather_Interior Auto
Message Property WB_AlterationAlt_Message_ControlWeather_ProjectileStorm Auto
Message Property WB_AlterationAlt_Message_ControlWeather_RegularWeather Auto
Message Property WB_AlterationAlt_Message_ControlWeather_DifficultWeather Auto

Explosion Property WB_AlterationAlt_Explosion_CreateLodeOrb Auto
Activator Property WB_AlterationAlt_Activator_MinorCreation Auto
FormList Property WB_AlterationAlt_FormList_WeatherBackup Auto

GlobalVariable Property MAGProjectileStormVar Auto
Spell Property MQClearSkyFogSpell Auto

FormList Property WB_AlterationAlt_FormList_WeatherExceptionList Auto

Float Property WB_HaloScale Auto

; -----

Weather FoundWeather
ObjectReference MagicalHalo

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If Weather.GetSkyMode() == 3
	;	If MAGProjectileStormVar.GetValue() == 0.0
			If WB_AlterationAlt_FormList_WeatherExceptionList.Find(Weather.GetCurrentWeather()) == -1

				Int ChosenWeather = WB_AlterationAlt_Message_ControlWeather.Show()
				If ChosenWeather <= 3
					FoundWeather = Weather.FindWeather(ChosenWeather)
					If FoundWeather
						FoundWeather.ForceActive(false)
						WB_AlterationAlt_Message_ControlWeather_RegularWeather.Show()
					Else
						(WB_AlterationAlt_FormList_WeatherBackup.GetAt(ChosenWeather) as Weather).ForceActive(false)
						WB_AlterationAlt_Message_ControlWeather_DifficultWeather.Show()
					EndIf
				Else
					Debug.Notification("APOCNEW ERROR: Invalid weather chosen!")
				EndIf

				MagicalHalo = akTarget.PlaceAtMe(WB_AlterationAlt_Activator_MinorCreation)
				MagicalHalo.SetScale(WB_HaloScale)
				Utility.Wait(3.0)
				MagicalHalo.Disable(true)
				Utility.Wait(2.0)
				MagicalHalo.Delete()
			Else
				WB_AlterationAlt_Message_ControlWeather_WrongWeather.Show()
			EndIf
	;	Else
	;		WB_AlterationAlt_Message_ControlWeather_ProjectileStorm.Show()
	;	EndIf
	Else
		WB_AlterationAlt_Message_ControlWeather_Interior.Show()
	EndIf

EndEvent

; -----