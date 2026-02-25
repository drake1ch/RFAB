;/ Decompiled by Champollion V1.0.1
Source   : nRoFScript.psc
Modified : 2013-01-09 11:37:51
Compiled : 2013-01-09 11:37:53
User     : User
Computer : USER-PC
/;
scriptName nRoFScript extends activemagiceffect

;-- Properties --------------------------------------
Int property iProjNum auto
Float property fOffset auto
activator property aTarget auto
Float property fHeight auto
spell property abToCast auto
activator property aSource auto

;-- Variables ---------------------------------------
actor he
Int count = 0
actor me
objectreference obj2
objectreference obj1
objectreference obj3
objectreference obj4
objectreference obj5
objectreference obj6
int random 
;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)
	me = akCaster
	he = akTarget
	if (me.GetCombatState() == 1)
	obj1 = he.placeatme(aSource as form, 1, false, false)
	obj2 = he.placeatme(aTarget as form, 1, false, false)
	while count < iProjNum
		obj1.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ() + fHeight)
		obj2.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
		abToCast.RemoteCast(obj1, me, obj2)
		count += 1
	endWhile
	utility.wait(1.00000)
	obj1.delete()
	obj2.delete()
	elseif (me.GetCombatState() != 1)
		obj1 = he.placeatme(aSource as form, 1, false, false)
		obj2 = he.placeatme(aTarget as form, 1, false, false)
		obj3 = he.placeatme(aTarget as form, 1, false, false)
		obj4 = he.placeatme(aTarget as form, 1, false, false)
		obj5 = he.placeatme(aTarget as form, 1, false, false)
		obj6 = he.placeatme(aTarget as form, 1, false, false)
		while count < iProjNum
			obj1.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ() + fHeight)
			obj2.SetPosition(he.GetPositionX() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
			obj3.SetPosition(he.GetPositionX() + 300.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
			obj4.SetPosition(he.GetPositionX() + 100.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + 500.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
			obj5.SetPosition(he.GetPositionX() + 200.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + 800.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
			obj6.SetPosition(he.GetPositionX() + 1000.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionY() + 400.0 + utility.RandomFloat(-fOffset, fOffset), he.GetPositionZ())
			random = Utility.RandomInt(0, 4)
			if random==0
			abToCast.RemoteCast(obj1, me, obj2)
			elseif random==1
			abToCast.RemoteCast(obj1, me, obj3)
			elseif random==2
			abToCast.RemoteCast(obj1, me, obj4)
			elseif random==3
			abToCast.RemoteCast(obj1, me, obj5)
			elseif random==4
			abToCast.RemoteCast(obj1, me, obj6)
			endif
			count += 1
		endWhile
		utility.wait(1.00000)
		obj1.delete()
		obj2.delete()
		obj3.delete()
		obj4.delete()
		obj5.delete()
		obj6.delete()
		endif
endFunction