Scriptname WB_ThrowIntoEvergloam_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
ObjectReference Property WB_StartPoint1 Auto
ObjectReference Property WB_StartPoint2 Auto
ObjectReference Property WB_StartPoint3 Auto
VisualEffect Property WB_IllusionShadow_VFX_GhostwalkReturn Auto
Explosion Property WB_IllusionShadow_Explosion_DeliverUntoVaermina Auto

; -----

ObjectReference PlayerBox
ObjectReference TargetBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetBox = akTarget.PlaceAtMe(FXEmptyActivator)
	PlayerBox = akCaster.PlaceAtMe(FXEmptyActivator)

	Int RandomMode = Utility.RandomInt(0,2)
	If RandomMode == 0
		akCaster.moveTo(WB_StartPoint1)
		akTarget.moveTo(WB_StartPoint2)
	ElseIf RandomMode == 1
		akCaster.moveTo(WB_StartPoint2)
		akTarget.moveTo(WB_StartPoint3)
	Else
		akCaster.moveTo(WB_StartPoint3)
		akTarget.moveTo(WB_StartPoint1)
	EndIf
	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akCaster)
	akCaster.PlaceAtMe(WB_IllusionShadow_Explosion_DeliverUntoVaermina)
	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akTarget)
	akTarget.PlaceAtMe(WB_IllusionShadow_Explosion_DeliverUntoVaermina)

	akTarget.StartCombat(akCaster)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !akTarget.IsDead()
		akTarget.MoveTo(TargetBox)
	Else
		akTarget.RemoveAllItems(akCaster, false, true)
		akTarget.Disable()
	EndIf
	akCaster.MoveTo(PlayerBox)

	akTarget.StartCombat(akCaster)

	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akCaster)
	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akTarget)

EndEvent

; -----

Event OnDying(Actor akKiller)

	Dispel()

EndEvent

; -----

Event OnEnterBleedout()

	Dispel()

EndEvent

; -----