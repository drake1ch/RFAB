;/ Decompiled by Champollion V1.0.1
Source   : nDragonGripControllerScript.psc
Modified : 2012-11-15 15:39:24
Compiled : 2012-11-15 15:39:24
User     : User
Computer : MYPC
/;
scriptName nDragonGripControllerScript extends Actor

;-- Properties --------------------------------------
spell property xDragonLandingArea auto
spell property xDragonBiteStagger auto
globalvariable property dKnockdownEnabled auto
spell property xGrip auto

;-- Variables ---------------------------------------
Float PosY
Float PosX
Actor he
Actor me
Float PosZ
Bool bready = false

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnLoad()

	me = self as Actor
	self.registerForAnimationEvent(self as objectreference, "DragonBiteEffect")
	self.registerForAnimationEvent(self as objectreference, "DragonLandEffect")
	self.registerForAnimationEvent(self as objectreference, "DragonForcefulLandEffect")
	self.registerForAnimationEvent(self as objectreference, "DragonTakeoffEffect")
	self.RegisterForUpdate(10.0000)
endFunction

function OnUpdate()

	if bready
		if me.GetDistance(he as objectreference) >= 2500.000
			he = me.GetCombatTarget()
			me.docombatspellapply(xGrip, he as objectreference)
		endIf
	endIf
endFunction

function onAnimationEvent(objectreference dragonref, String eventName)

	if eventName == "DragonBiteEffect"
		debug.trace("===========DD AnimEvent=========== " + me as String + " bite stagger effect.", 0)
		me.docombatspellapply(xDragonBiteStagger, me.GetCombatTarget() as objectreference)
	elseIf eventName == "DragonTakeoffEffect"
		bready = false
	elseIf eventName == "DragonlLandEffect"
		if dKnockdownEnabled.value > 0 as Float
			debug.trace("===========DD AnimEvent===========> " + me as String + " is knocking back actors.", 0)
			xDragonLandingArea.Cast(me as objectreference, none)
		endIf
		bready = true
	elseIf eventName == "DragonForcefulLandEffect"
		if dKnockdownEnabled.value > 0 as Float
			debug.trace("===========DD AnimEvent===========> " + me as String + " is knocking back actors.", 0)
			xDragonLandingArea.Cast(me as objectreference, none)
		endIf
		bready = true
	endIf
endFunction
