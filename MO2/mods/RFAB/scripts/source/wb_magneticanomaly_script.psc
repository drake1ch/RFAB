Scriptname WB_MagneticAnomaly_Script extends ActiveMagicEffect  

; ------

Hazard Property WB_AlterationEarth_Hazard_MagneticAnomaly Auto
Float Property WB_SeekRange Auto
Float Property WB_Speed Auto
Float Property WB_DispelDelay Auto
Sound Property WB_AlterationTelekinesis_Marker_Effect_Slam Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ObjectReference NearestAnomaly = Game.FindClosestReferenceOfTypeFromRef(WB_AlterationEarth_Hazard_MagneticAnomaly, akTarget, WB_SeekRange)
	If NearestAnomaly
		WB_AlterationTelekinesis_Marker_Effect_Slam.Play(akTarget)
		akTarget.TranslateToRef(NearestAnomaly, WB_Speed)
	EndIf
	RegisterForSingleUpdate(WB_DispelDelay)

EndEvent

; ------

Event OnUpdate()

	Dispel()

EndEvent

; -----