;/ Decompiled by Champollion V1.0.1
Source   : nDragonVileSporesScript.psc
Modified : 2012-11-12 09:26:40
Compiled : 2012-11-12 09:26:40
User     : User
Computer : MYPC
/;
scriptName nDragonVileSporesScript extends activemagiceffect

;-- Properties --------------------------------------
activator property nactivatorcaster auto
Float property fRand auto
activator property nactivatortarget auto
spell property ThisSpell auto
Float property fDelay auto
spell property xSpore auto
activator property nactivatorhole auto

;-- Variables ---------------------------------------
Float fZ
Float fP
Float fY
objectreference obj
Float fX
actor me
objectreference obt
objectreference obc
actor he
int random 
;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function onUpdate()
	if !me.IsDead()
		obt.SetPosition(fX + utility.RandomFloat(-fRand, fRand), fY + utility.RandomFloat(-fRand, fRand), fZ)
		xSpore.remotecast(obc, me, obt)
		self.RegisterForSingleUpdate(0.500000 + utility.RandomFloat(-fDelay, fDelay))
	else
		he.dispelspell(ThisSpell)
	endIf
endFunction

; Skipped compiler generated GotoState

function OnEffectFinish(actor akTarget, actor akCaster)
	obj.disable(false)
	obj.delete()
	obc.disable(false)
	obc.delete()
	obt.disable(false)
	obt.delete()
endFunction

function OnEffectStart(actor akTarget, actor akCaster)
	me = akCaster
	he = akTarget
	random = Utility.RandomInt(0, 2)
	if (me.GetCombatState() == 1)
	obj = he.placeatme(nactivatorhole as form, 1, false, false)
	obt = he.placeatme(nactivatortarget as form, 1, false, false)
	obj.SetAngle(0.000000, 0.000000, 0.000000)
	fX = he.GetPositionX()
	fY = he.GetPositionY()
	fZ = he.GetPositionZ() + 50.0000
	obc = he.placeatme(nactivatorcaster as form, 1, false, false)
	obc.SetPosition(fX, fY, fZ)
	fX = he.GetPositionX()
	fY = he.GetPositionY()
	fZ = he.GetPositionZ() + 500.000
	self.RegisterForSingleUpdate(0.500000)
	elseif (me.GetCombatState() != 1) && random ==0
	obj = he.placeatme(nactivatorhole as form, 1, false, false)
	obt = he.placeatme(nactivatortarget as form, 1, false, false)
	obj.SetAngle(0.000000, 0.000000, 0.000000)
	fX = he.GetPositionX()
	fY = he.GetPositionY()
	fZ = he.GetPositionZ() + 50.0000
	obc = he.placeatme(nactivatorcaster as form, 1, false, false)
	obc.SetPosition(fX, fY, fZ)
	fX = he.GetPositionX() + 500.000
	fY = he.GetPositionY() + 500.000
	fZ = he.GetPositionZ() + 500.000
	obj.SetPosition(fX, fY, fZ)
	self.RegisterForSingleUpdate(0.500000)
	endIf
endFunction