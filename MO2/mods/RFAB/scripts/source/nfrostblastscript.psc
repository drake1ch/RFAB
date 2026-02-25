;/ Decompiled by Champollion V1.0.1
Source   : nFrostBlastScript.psc
Modified : 2012-11-09 09:15:10
Compiled : 2012-11-09 09:15:11
User     : User
Computer : MYPC
/;
scriptName nFrostBlastScript extends activemagiceffect

;-- Properties --------------------------------------
activator property aTarget auto
Float property fOffset = 0.000000 auto
spell property abToCast auto
Float property fHeight = 0.000000 auto
activator property aSource auto

;-- Variables ---------------------------------------
actor he
objectreference obj2
actor me
objectreference obj1
objectreference obj3
;-- Functions ---------------------------------------

function OnEffectStart(actor akTarget, actor akCaster)
	me = akCaster
	he = akTarget
	if (me.GetCombatState() == 1)
	obj1 = me.placeatme(aSource as form, 1, false, false)
	obj2 = me.placeatme(aTarget as form, 1, false, false)
	obj1.SetPosition(me.GetPositionX(), me.GetPositionY(), me.GetPositionZ() + fHeight)
	obj2.SetPosition(me.GetPositionX(), me.GetPositionY(), me.GetPositionZ())
	abToCast.RemoteCast(obj1, me, obj2)
	obj1.TranslateToRef(he as objectreference, 600.000, 0.000000)
	obj2.TranslateToRef(he as objectreference, 600.000, 0.000000)
	while !obj1.IsDisabled()
		abToCast.RemoteCast(obj1, me, obj2)
		utility.wait(0.200000)
	endWhile
	elseif (me.GetCombatState() != 1)
	obj1 = me.placeatme(aSource as form, 1, false, false)
	obj2 = me.placeatme(aTarget as form, 1, false, false)
	obj3 = me.placeatme(aTarget as form, 1, false, false)
	obj1.SetPosition(me.GetPositionX(), me.GetPositionY(), me.GetPositionZ() + fHeight)
	obj2.SetPosition(me.GetPositionX(), me.GetPositionY(), me.GetPositionZ())
	obj3.SetPosition(he.GetPositionX(), he.GetPositionY(), he.GetPositionZ())
	abToCast.RemoteCast(obj1, me, obj2)
	obj1.TranslateToRef(obj3 as objectreference, 600.000, 0.000000)
	obj2.TranslateToRef(obj3 as objectreference, 600.000, 0.000000)
	while !obj1.IsDisabled()
		abToCast.RemoteCast(obj1, me, obj2)
		utility.wait(0.200000)
	endWhile
	endif
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState