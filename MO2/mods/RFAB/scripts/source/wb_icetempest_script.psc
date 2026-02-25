Scriptname WB_IceTempest_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
Activator Property FXEmptyActivator Auto
MagicEffect Property WB_D100_IceTempest_EffectUp Auto
Int Property WB_DeltaPolarD Auto
Int Property WB_DeltaCenterHeight Auto
Int Property WB_DeltaRadius Auto
Int Property WB_StartPolarD Auto
Int Property WB_StartCenterHeight Auto
Int Property WB_StartRadius Auto
ImagespaceModifier Property WB_DestructionFrost_Imod_Tornado Auto
Explosion Property WB_DestructionFrost_Explosion_Tornado Auto

; -----

Actor TheCaster
Actor TheTarget
ObjectReference TheCenter
ObjectReference TheBox
Int CenterHeight
Int PolarD
Int Radius

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PolarD = WB_StartPolarD
	CenterHeight = WB_StartCenterHeight
	Radius = WB_StartRadius
	TheCaster = akCaster
	TheTarget = akTarget
	TheCenter = akTarget.PlaceAtMe(FXEmptyActivator)
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	WB_DestructionFrost_Imod_Tornado.Apply()
	akTarget.PlaceAtMe(WB_DestructionFrost_Explosion_Tornado)
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheCenter.Delete()
	TheBox.Delete()
	WB_DestructionFrost_Imod_Tornado.Apply()

EndEvent

; -----

Event OnUpdate()

	If TheTarget.HasMagicEffect(WB_D100_IceTempest_EffectUp)
		PolarD += WB_DeltaPolarD
		CenterHeight += WB_DeltaCenterHeight
		Radius += WB_DeltaRadius
	Else
;		PolarD -= WB_DeltaPolarD
;		CenterHeight -= WB_DeltaCenterHeight
;		Radius -= WB_DeltaRadius
		PolarD = WB_StartPolarD
		CenterHeight = WB_StartCenterHeight
		Radius = WB_StartRadius
	EndIf
	TheBox.MoveTo(TheCenter,Math.Cos(PolarD) * Radius,Math.Sin(PolarD) * Radius,CenterHeight)
	TheBox.PushActorAway(TheTarget,-3)
	TheCenter.RampRumble(0.5, 0.2, 1024)

EndEvent

; -----
