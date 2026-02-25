;/ Decompiled by Champollion V1.0.1
Source   : RFAB_SkeeverQueenScript.psc
Modified : 2023-10-21 23:46:29
Compiled : 2023-10-21 23:46:31
User     : Ilya SSD
Computer : HOME-PC
/;
scriptName RFAB_SkeeverQueenScript extends ObjectReference

;-- Properties --------------------------------------
ObjectReference property SpawnSkeeverMarker auto
actor property SkeeverQueen auto
actorbase property SewerSkeeverSpawn auto
sound property SkeeverRage1 auto
actor[] property Skeevers auto
sound property SkeeverRage2 auto

;-- Variables ---------------------------------------
Bool combat_started = false

;-- Functions ---------------------------------------

function Stage3()

	Int i = 0
	SkeeverRage2.Play(self as ObjectReference)
	SkeeverQueen.restoreactorvalue("health", 10000 as Float)
	SkeeverQueen.GetActorBase().SetEssential(false)
	self.SpawnSkeevers()
	while SkeeverQueen.GetCombatState() > 0 && SkeeverQueen.GetActorValue("health") > 0 as Float
		if i == 5
			i = 0
			SkeeverRage1.Play(self as ObjectReference)
			self.SpawnSkeevers()
			SkeeverQueen.ModActorValue("UnarmedDamage", 25 as Float)
		endIf
		utility.wait(1 as Float)
		i += 1
	endWhile
endFunction

function SpawnSkeevers()

	Int j = 0
	while j < 3
		if Skeevers[j] == none || Skeevers[j].GetActorValue("health") < 1 as Float
			Skeevers[j].DisableNoWait(true)
			Skeevers[j].Delete()
			Skeevers[j] = SpawnSkeeverMarker.Placeatme(SewerSkeeverSpawn as form, 1, false, false) as actor
		endIf
		j += 1
	endWhile
endFunction

function OnLoad()

	Skeevers = new actor[3]
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function stage1()

	while SkeeverQueen.GetCombatState() > 0 && SkeeverQueen.GetActorValuePercentage("health") > 0.300000
		utility.wait(1 as Float)
	endWhile

		self.Stage2()

endFunction

function OnCombatStateChanged(actor akTarget, Int aeCombatState)

	if aeCombatState == 1 && !combat_started
		combat_started = true
		self.stage1()
	endIf
endFunction

function Stage2()

	Int i = 0
	SkeeverQueen.restoreactorvalue("health", 10000 as Float)
	SkeeverRage1.Play(self as ObjectReference)
	self.SpawnSkeevers()
	while SkeeverQueen.GetCombatState() > 0 && SkeeverQueen.GetActorValuePercentage("health") > 0.300000
		if i == 10
			i = 0
			SkeeverRage1.Play(self as ObjectReference)
			self.SpawnSkeevers()
		endIf
		utility.wait(1 as Float)
		i += 1
	endWhile

		self.Stage3()

endFunction
