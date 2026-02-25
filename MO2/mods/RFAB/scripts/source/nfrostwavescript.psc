;/ Decompiled by Champollion V1.0.1
Source   : nFrostWaveScript.psc
Modified : 2012-11-08 21:06:03
Compiled : 2012-11-08 21:06:03
User     : User
Computer : MYPC
/;
scriptName nFrostWaveScript extends activemagiceffect

;-- Properties --------------------------------------
activator property aSource auto
Float property fHeight = 0.000000 auto
spell property abToCast auto
Float property fOffset = 0.000000 auto
activator property aTarget auto

;-- Variables ---------------------------------------
objectreference obj1
actor he
objectreference obj2
actor me
;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)
	me = akCaster
	he = akTarget
	if (me.GetCombatState() == 1)
	obj1 = he.placeatme(aSource as form, 1, false, false)
	obj2 = he.placeatme(aTarget as form, 1, false, false)
	obj2.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ() + fHeight)
	obj1.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
	abToCast.RemoteCast(obj1, me, obj2)
	utility.wait(8.10000)
	obj1.delete()
	obj2.delete()
	elseif (me.GetCombatState() != 1)
		obj1 = he.placeatme(aSource as form, 1, false, false)
		obj2 = he.placeatme(aTarget as form, 1, false, false)
		obj2.SetPosition(he.GetPositionX() + 300.0 , he.GetPositionY() + 200.0 , he.GetPositionZ() + fHeight)
		obj1.SetPosition(he.GetPositionX() + 300.0 , he.GetPositionY() + 200.0 , he.GetPositionZ())
		abToCast.RemoteCast(obj1, me, obj2)
		utility.wait(8.10000)
		obj1.delete()
		obj2.delete()
	endif
endFunction

; Skipped compiler generated GotoState