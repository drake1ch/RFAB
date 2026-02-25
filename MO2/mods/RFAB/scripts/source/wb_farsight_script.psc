Scriptname WB_Farsight_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_IllusionPuppeteer_Imod_MindLoop Auto
ImagespaceModifier Property WB_IllusionPuppeteer_Imod_MindEnd Auto
Float Property WB_ImodStrength Auto
Float Property WB_CheckEquippedRate Auto

; -----

Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_IllusionPuppeteer_Imod_MindLoop.Apply(WB_ImodStrength)

;	Game.DisablePlayerControls(abCamSwitch=true, abSneaking=true)
;	Game.DisablePlayerControls(abCamSwitch=true)
	Game.SetCameraTarget(akTarget)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()

	TheCaster = akCaster
	RegisterForUpdate(WB_CheckEquippedRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

;	Game.EnablePlayerControls()
	Game.SetCameraTarget(Game.GetPlayer())

	WB_IllusionPuppeteer_Imod_MindEnd.Apply(WB_ImodStrength)
	WB_IllusionPuppeteer_Imod_MindLoop.Remove()

EndEvent

; -----

Event OnUpdate()

	If !TheCaster.IsWeaponDrawn()
		Dispel()
	EndIf

EndEvent

; -----