Scriptname WB_TharnsGibbet_Script extends activemagiceffect  


; -----

Float Property WB_Z Auto
Static Property WB_Object Auto
Float Property WB_Scale Auto
EffectShader Property WB_AlterationAlt_FXS_CreatedObject_LR Auto

; -----

ObjectReference TheCage

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetdontMove(true)
	TheCage = akTarget.PlaceAtMe(WB_Object, 1, false, true)
	TheCage.SetScale(WB_Scale)
	TheCage.Enable()
	TheCage.MoveTo(akTarget, 0, 0, WB_Z)
	TheCage.SetAngle(0,0,0)
	Utility.Wait(0.05)
	WB_AlterationAlt_FXS_CreatedObject_LR.Play(TheCage)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.SetdontMove(false)
	TheCage.Disable(true)
	Utility.Wait(2.5)
	TheCage.Delete()

EndEvent

; -----