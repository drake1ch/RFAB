;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname USKP_TIF_MGRAppBrelyna01_000C04ED Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;USKP 2.0.5 - Failsafe in case player was in 3rd person, or line of sight was lost.
;USKP 2.0.6 - Bug #17133: Handled the failsafe wrong. Oops.
if( !Game.GetPlayer().HasMagicEffect(MGRAppBSpell01Effect) )
	MGAppBSpell01.Cast(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property MGAppBSpell01 Auto
MagicEffect Property MGRAppBSpell01Effect Auto 