Scriptname WB_MarkAndRecallAb_Script extends activemagiceffect  

; -----

Activator Property WB_AlterationAlt_Activator_MarkAndRecall Auto
Explosion Property WB_AlterationAlt_Explosion_MarkAndRecall Auto

Float Property WB_Scale Auto
Float Property WB_Height Auto

VisualEffect Property WB_AlterationAlt_VFX_Teleport Auto
VisualEffect Property WB_AlterationAlt_VFX_WarpTheFlesh Auto

; -----

ObjectReference TheMarker

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheMarker = akTarget.PlaceAtMe(WB_AlterationAlt_Activator_MarkAndRecall)
;	TheMarker.SetScale(WB_Scale)
	TheMarker.MoveTo(akTarget, 0, 0, WB_Height, true)
	TheMarker.SetAngle(0,0,0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.MoveTo(TheMarker)
	WB_AlterationAlt_VFX_Teleport.Play(akTarget,3.5)
	WB_AlterationAlt_VFX_WarpTheFlesh.Play(akTarget,3.5)
	akTarget.PlaceAtMe(WB_AlterationAlt_Explosion_MarkAndRecall)
	TheMarker.Disable(true)
	Utility.Wait(2.5)
	TheMarker.Delete()

EndEvent

; -----