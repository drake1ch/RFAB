;/ Decompiled by Champollion V1.0.1
Source   : nColdBurstTargetScript.psc
Modified : 2012-11-09 07:22:36
Compiled : 2012-11-09 07:22:36
User     : User
Computer : MYPC
/;
scriptName nColdBurstTargetScript extends activemagiceffect

;-- Properties --------------------------------------
activator property aTarget auto
spell property abToCast auto
Float property fOffset auto
activator property aSource auto
Float property fHeight auto

;-- Variables ---------------------------------------
actor me
objectreference obj1
actor he
objectreference obj2

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)

	me = akCaster
	he = akTarget
	obj1 = he.placeatme(aSource as form, 1, false, false)
	obj2 = he.placeatme(aTarget as form, 1, false, false)
	obj1.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ() + fHeight)
	Utility.WaitMenuMode(1.5)
	abToCast.RemoteCast(obj1, me, obj2)
	utility.wait(0.100000)
	obj1.delete()
	obj2.delete()
endFunction

; Skipped compiler generated GotoState