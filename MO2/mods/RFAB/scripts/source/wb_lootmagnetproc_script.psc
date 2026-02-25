Scriptname WB_LootMagnetProc_Script extends activemagiceffect  

; -----

EffectShader Property WB_AlterationAlt_LootMagnet_FXS Auto
Float Property WB_PushForce Auto
Race Property DwarvenSphereRace Auto
Weapon Property crDwarvenSphereCrossbow Auto
Weapon Property crDwarvenSphereCrossbow02 Auto
Ammo Property DwarvenSphereArrow Auto
Ammo Property DwarvenSphereBolt01 Auto
Ammo Property DwarvenSphereBolt02 auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationAlt_LootMagnet_FXS.Play(akTarget,3)
	akTarget.ApplyHavokImpulse(0,0,500, WB_PushForce)
	akTarget.RemoveAllItems(akCaster, false, true)
	If akTarget.GetRace() == DwarvenSphereRace
		akCaster.RemoveItem(crDwarvenSphereCrossbow, 2, true, NONE)
		akCaster.RemoveItem(crDwarvenSphereCrossbow02, 2, true, NONE)
		akCaster.RemoveItem(DwarvenSphereArrow, 999, true, NONE)
		akCaster.RemoveItem(DwarvenSphereBolt01, 999, true, NONE)
		akCaster.RemoveItem(DwarvenSphereBolt02, 999, true, NONE)
	EndIf

EndEvent

; -----