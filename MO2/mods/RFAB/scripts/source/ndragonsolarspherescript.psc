
;/ Decompiled by Champollion V1.0.1
Source   : nDragonSolarSphereScript.psc
Modified : 2012-11-10 13:30:41
Compiled : 2012-11-10 13:30:42
User     : User
Computer : MYPC
/;
scriptName nDragonSolarSphereScript extends activemagiceffect

;-- Properties --------------------------------------
activator property nActivatorSun auto
spell property xBeam auto
activator property FxEmpty auto


;-- Variables ---------------------------------------
Float fX
objectreference obj
objectreference obt
actor me
Float fY
Float fZ
actor he

;-- Functions ---------------------------------------

function OnEffectStart(actor akTarget, actor akCaster)
	he = akTarget
	me = akCaster
	;utility.wait(utility.RandomFloat(0.000000, 1.00000))
	fX = he.GetPositionX()
	fY = he.GetPositionY()
	fZ = he.GetPositionZ() + 500.000
	obj = he.placeatme(nActivatorSun as form, 1, false, false)
	obj.setposition(fX, fY, fZ)
	obj.setscale(4.00000)
	obt = he.placeatme(FxEmpty as form, 1, false, false)
	obt.setposition(fX, fY, he.GetPositionZ())
	Utility.WaitMenuMode(1.0)
	xBeam.remotecast(obj, me, obt as objectreference)
	utility.wait(1.50000)
	obj.disable(true)
	obt.disable(true)
	utility.wait(1.00000)
	obj.delete()
	obt.delete()
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState