Scriptname WB_TransferStatToStat_Script extends activemagiceffect  

; -----

String Property WB_StatFrom Auto
String Property WB_StatTo Auto
Float Property WB_Mult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetStatFrom = akTarget.GetAV(WB_StatFrom) * WB_Mult
	akTarget.DamageAV(WB_StatFrom,TargetStatFrom)
	akTarget.RestoreAV(WB_StatTo,TargetStatFrom)

EndEvent

; -----