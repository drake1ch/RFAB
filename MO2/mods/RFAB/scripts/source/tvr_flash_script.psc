;/ Decompiled by Champollion V1.0.1
Source   : TVR_Flash_Script.psc
Modified : 2020-08-09 14:50:06
Compiled : 2020-08-09 14:50:07
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_Flash_Script extends activemagiceffect

;-- Properties --------------------------------------
Float property TVR_Speed auto
Float property TVR_DistanceInFront auto
visualeffect property TVR_VFX auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetAngle = akCaster.GetAngleZ()
	Float XLoc = akTarget.GetPositionX() + TVR_DistanceInFront * math.Sin(TargetAngle)
	Float YLoc = akTarget.GetPositionY() + TVR_DistanceInFront * math.Cos(TargetAngle)
	Float ZLoc = akTarget.GetPositionZ()
	akCaster.TranslateTo(XLoc, YLoc, ZLoc, 0 as Float, 0 as Float, TargetAngle, TVR_Speed, 0.000000)
	TVR_VFX.Play(akCaster as objectreference, 3.00000, none)
	self.Dispel()
endFunction
