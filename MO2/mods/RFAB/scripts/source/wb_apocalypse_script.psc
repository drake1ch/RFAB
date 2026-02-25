Scriptname WB_Apocalypse_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
Float Property WB_InitialUpdate Auto
Float Property WB_DeltaZ Auto
Float Property WB_DeltaZ2 Auto

Spell Property WB_S_D100_Apocalypse_Spell_Proc Auto

Float Property WB_Speed Auto
Float Property WB_Speed2 Auto

Float Property WB_PosDelta Auto

ImagespaceModifier Property WB_DestructionFire_Imod_Apocalypse Auto
ImagespaceModifier Property WB_DestructionFire_Imod_ApocalypseEnd Auto
Float Property WB_ImodStrength Auto

Static Property WB_DestructionFire_Static_Apocalypse Auto
Activator Property FXEmptyActivator Auto

Bool Property WB_MoveDown Auto

VisualEffect Property WB_IllusionShadow_VFX_GhostwalkReturn Auto

; -----

Actor TheTarget
ObjectReference OriginBox
ObjectReference DestinationBox
ObjectReference MoveDestBox
Float StartingZ

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_DestructionFire_Static_Apocalypse
		OriginBox = akTarget.PlaceAtMe(WB_DestructionFire_Static_Apocalypse)
	Else
		OriginBox = akTarget.PlaceAtMe(FXEmptyActivator)
	EndIf
	OriginBox.MoveTo(akTarget,0,0,64)
	OriginBox.SetAngle(0,0,0)

	StartingZ = akTarget.GetPositionZ()

	Game.DisablePlayerControls(abFighting = true, abCamSwitch = true, abMenu = true)
	Game.ForceFirstPerson()
	Game.SetHudCartMode(true)
	akTarget.TranslateTo((akTarget.GetPositionX()+Utility.RandomFloat(-WB_PosDelta,WB_PosDelta)),(akTarget.GetPositionY()+Utility.RandomFloat(-WB_PosDelta,WB_PosDelta)),(akTarget.GetPositionZ()+WB_DeltaZ),akTarget.GetAngleX(),akTarget.GetAngleY(),akTarget.GetAngleZ(),WB_Speed)
	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akTarget)
	WB_DestructionFire_Imod_Apocalypse.Apply(WB_ImodStrength)
	TheTarget = akTarget
	RegisterForSingleUpdate(WB_InitialUpdate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Game.SetHudCartMode(false)
	akTarget.StopTranslation()
	If WB_MoveDown
		akTarget.TranslateToRef(OriginBox,WB_Speed)
	Else
		akTarget.MoveTo(OriginBox)
	EndIf
	WB_DestructionFire_Imod_Apocalypse.Remove()
	WB_DestructionFire_Imod_ApocalypseEnd.Apply()
	WB_IllusionShadow_VFX_GhostwalkReturn.Play(akTarget)
	Game.EnablePlayerControls()
	OriginBox.Delete()

EndEvent

; -----

Event OnUpdate()

	WB_S_D100_Apocalypse_Spell_Proc.Cast(TheTarget)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnTranslationComplete()

	TheTarget.TranslateTo(TheTarget.GetPositionX(),TheTarget.GetPositionY(),(TheTarget.GetPositionZ()+WB_DeltaZ2),TheTarget.GetAngleX(),TheTarget.GetAngleY(),TheTarget.GetAngleZ(),WB_Speed2)

	; failsafe
	Utility.Wait(0.1)
	TheTarget.TranslateTo(TheTarget.GetPositionX(),TheTarget.GetPositionY(),(TheTarget.GetPositionZ()+WB_DeltaZ2),TheTarget.GetAngleX(),TheTarget.GetAngleY(),TheTarget.GetAngleZ(),WB_Speed2)

EndEvent

; -----