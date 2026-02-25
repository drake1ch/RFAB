Scriptname WB_MinorCreation_Script extends ActiveMagicEffect  

; -----

;Message Property WB_AlterationAlt_Message_MinorCreation Auto
Message Property WB_AlterationAlt_Message_FabricateObject_1 Auto
Message Property WB_AlterationAlt_Message_FabricateObject_2 Auto
Furniture[] Property WB_Furniture Auto
Static Property RTCanalsBridge01 Auto
Float Property WB_StaticAngleFudge Auto
Float Property WB_StaticDistFudge Auto
Float Property WB_StaticHeightFudge Auto
EffectShader Property WB_AlterationAlt_FXS_CreatedObject Auto
Float Property WB_DistanceInFront Auto
Explosion Property WB_AlterationAlt_Explosion_CreateLodeOrb Auto
Activator Property WB_AlterationAlt_Activator_MinorCreation Auto
Float Property WB_UpdateRate Auto
Furniture Property CommonChair01 Auto
Furniture Property CommonBed01 Auto

; -----

Actor CasterActor
ObjectReference CreatedObject
ObjectReference MagicalHalo

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CasterActor = akCaster
	Int j
	Int i = WB_AlterationAlt_Message_FabricateObject_1.Show()
	If i == 3
		j = WB_AlterationAlt_Message_FabricateObject_2.Show()
		CreatedObject = akTarget.PlaceAtMe(WB_Furniture[j], abInitiallyDisabled = true)
		Float CasterAngle = akCaster.GetAngleZ()
		CreatedObject.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),0)
		CreatedObject.SetAngle(0,0,CasterAngle)
	ElseIf i == 0
		; bridge
		CreatedObject = akTarget.PlaceAtMe(RTCanalsBridge01, abInitiallyDisabled = true)
		Float CasterAngle = akCaster.GetAngleZ()
		CreatedObject.MoveTo(akCaster,((WB_DistanceInFront + WB_StaticDistFudge)*Math.Sin(CasterAngle)),((WB_DistanceInFront + WB_StaticDistFudge)*Math.Cos(CasterAngle)),WB_StaticHeightFudge)
		CreatedObject.SetAngle(0,0,CasterAngle + WB_StaticAngleFudge)
	ElseIf i == 1
		; bed
		CreatedObject = akTarget.PlaceAtMe(CommonBed01, abInitiallyDisabled = true)
		Float CasterAngle = akCaster.GetAngleZ()
		CreatedObject.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),0)
		CreatedObject.SetAngle(0,0,CasterAngle)
	ElseIf i == 2
		; chair
		CreatedObject = akTarget.PlaceAtMe(CommonChair01, abInitiallyDisabled = true)
		Float CasterAngle = akCaster.GetAngleZ()
		CreatedObject.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),0)
		CreatedObject.SetAngle(0,0,CasterAngle)
	EndIf
	CreatedObject.PlaceAtMe(WB_AlterationAlt_Explosion_CreateLodeOrb)
	CreatedObject.Enable()
	MagicalHalo = CreatedObject.PlaceAtMe(WB_AlterationAlt_Activator_MinorCreation)
	Utility.Wait(0.1)
	WB_AlterationAlt_FXS_CreatedObject.Play(CreatedObject)
	RegisterForUpdate(WB_UpdateRate)		;using spell conditions is much better, but the PerMa patcher may crash if you do that
											;and then your mod is branded a BAD MOD and people uninstall it /rant

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	While akTarget.GetSitState() != 0
		Utility.Wait(0.5)
	EndWhile
	CreatedObject.Disable(true)
	MagicalHalo.Disable(true)
	Utility.Wait(5)
	CreatedObject.Delete()
	MagicalHalo.Delete()

EndEvent

; -----

Event OnUpdate()

	If CasterActor.IsInCombat() != 0
		Dispel()
	EndIf

EndEvent

; -----