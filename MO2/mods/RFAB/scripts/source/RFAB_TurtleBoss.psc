scriptName RFAB_TurtleBoss extends ObjectReference

objectreference[] property DeathFallingBlocks auto
ObjectReference property slope2 auto
actor property turtle auto
ObjectReference property waterexpl_marker auto
ObjectReference property turtlespawnbogmortmarker auto
sound property RFAB_SM_TurtleGeysers auto
ObjectReference property turtledieblock2 auto
sound property RFAB_SM_TurtleBigWave auto
ObjectReference property turtlebossmarker auto
sound property RFAB_SM_TurtleSmallWaves auto
sound property RFAB_SM_Stonefall auto
spell property waterexpl auto
sound property RFAB_SM_TurtleDeath auto
sound property RFAB_SM_TurtleLivingMud auto
actorbase property bogmortBase auto
objectreference[] property turtlecollisionmarkers auto
ObjectReference property turtlehidewave auto
ObjectReference property turtledieblock auto
objectreference[] property smallWaves auto
ObjectReference property waterexpltarget_marker auto
ObjectReference property HajmotaModel auto

Bool combat_started = false
actor player
actor[] bogmorts

function OnActivate(ObjectReference akActionRef)
	player = game.getplayer()
	bogmorts = new actor[5]
	combat_started = true
	self.Stage1()
endFunction

function Stage1()

	Int deltaY
	Int deltaX
	RFAB_SM_TurtleGeysers.play(turtle as ObjectReference)
	utility.wait(2 as Float)
	Int i = 0
	waterexpltarget_marker.moveto(turtle as ObjectReference, 0.000000, 0.000000, 0.000000, true)
	if waterexpltarget_marker.getpositionx() > player.getpositionx()
		deltaX = -1000
	else
		deltaX = 1000
	endIf
	if waterexpltarget_marker.getpositiony() > player.getpositiony()
		deltaY = -1000
	else
		deltaY = 1000
	endIf
	waterexpltarget_marker.setposition(waterexpltarget_marker.getpositionx() + deltaX as Float, waterexpltarget_marker.getpositiony() + deltaY as Float, waterexpltarget_marker.getpositionz())
	while i < 20
		if waterexpltarget_marker.getdistance(player as ObjectReference) > 200 as Float
			if waterexpltarget_marker.getpositionx() > player.getpositionx()
				deltaX = -200
			else
				deltaX = 200
			endIf
			if waterexpltarget_marker.getpositiony() > player.getpositiony()
				deltaY = -200
			else
				deltaY = 200
			endIf
			if waterexpltarget_marker.getdistance(player as ObjectReference) > 1500 as Float
				deltaX *= 2
				deltaY *= 2
			endIf
			waterexpltarget_marker.setposition(waterexpltarget_marker.getpositionx() + deltaX as Float, waterexpltarget_marker.getpositiony() + deltaY as Float, player.getpositionz())
		else
			waterexpltarget_marker.setposition(player.getpositionx(), player.getpositiony(), player.getpositionz())
		endIf
		waterexpl_marker.moveto(waterexpltarget_marker, utility.randomint(-10, 10) as Float, utility.randomint(-10, 10) as Float, 100 as Float, true)
		waterexpl.Cast(waterexpl_marker, waterexpltarget_marker)
		utility.wait(0.500000)
		i += 1
	endWhile
	self.setrandomstage(1)
endFunction

function stage2()

	RFAB_SM_TurtleBigWave.play(turtle as ObjectReference)
	utility.wait(2 as Float)
	slope2.activate(slope2, false)
	turtle.moveto(turtlebossmarker, 0.000000, 0.000000, 0.000000, true)
	utility.wait(10 as Float)
	self.setrandomstage(2)
endFunction

function stage3()

	RFAB_SM_TurtleLivingMud.play(turtle as ObjectReference)
	utility.wait(2 as Float)
	Int i = 0
	while i < bogmorts.length
		if bogmorts[i].isdead() || bogmorts[i] == none
			bogmorts[i].delete()
			bogmorts[i] = turtlespawnbogmortmarker.placeatme(bogmortBase as form, 1, false, false) as actor
			bogmorts[i].disablenowait(false)
			Int deltaX = 0
			while math.abs(deltaX as Float) < 200 as Float
				deltaX = utility.randomint(-350, 350)
			endWhile
			Int deltaY = 0
			while math.abs(deltaY as Float) < 200 as Float
				deltaY = utility.randomint(-350, 350)
			endWhile
			bogmorts[i].moveto(player as ObjectReference, deltaX as Float, deltaY as Float, 0 as Float, true)
			bogmorts[i].enable(true)
			bogmorts[i].startcombat(player)
		endIf
		i += 1
	endWhile
	turtle.moveto(turtlebossmarker, 0.000000, 0.000000, 0.000000, true)
	utility.wait(5 as Float)
	self.setrandomstage(3)
endFunction

function stage4()

	RFAB_SM_TurtleSmallWaves.play(turtle as ObjectReference)
	Int i = 0
	while i < smallWaves.length
		smallWaves[i].activate(smallWaves[i], false)
		utility.wait(1 as Float)
		i += 1
	endWhile
	turtle.moveto(turtlebossmarker, 0.000000, 0.000000, 0.000000, true)
	utility.wait(5 as Float)
	self.setrandomstage(4)
endFunction

function setrandomstage(Int previous_stage)

	if !turtle.isdead()
		turtle.moveto(turtlebossmarker, 0.000000, 0.000000, 0.000000, true)
		utility.wait(5 as Float)
		turtle.moveto(turtlebossmarker, 0.000000, 0.000000, 0.000000, true)
		Int stage = previous_stage
		while stage == previous_stage
			stage = utility.randomint(1, 4)
		endWhile
		if stage == 1
			self.Stage1()
		elseIf stage == 2
			self.stage2()
		elseIf stage == 3
			self.stage3()
		elseIf stage == 4
			self.stage4()
		endIf
	endIf
endFunction

function OnDying(actor akKiller)
	HajmotaModel.playgamebryoanimation("turtle_death")
	RFAB_SM_TurtleDeath.play(turtle as ObjectReference)
	RFAB_SM_Stonefall.play(turtle as ObjectReference)
	turtledieblock.disablenowait(false)
	turtledieblock2.disablenowait(false)
	turtle.enableai(false)
	Int i = 0
	while i < turtlecollisionmarkers.length
		turtlecollisionmarkers[i].disablenowait(false)
		i += 1
	endWhile
	Float x = turtle.getpositionx()
	Float y = turtle.getpositiony()
	Float z = turtle.getpositionz()
	Float xAngle = turtle.GetAngleX()
	Float yAngle = turtle.GetAngleY()
	Float zAngle = turtle.GetAngleZ()
	i = 0
	while i < DeathFallingBlocks.length
		DeathFallingBlocks[i].activate(DeathFallingBlocks[i], false)
		i += 1
	endWhile
	turtlehidewave.translateto(self.x - 700 as Float, self.y, self.z, xAngle, yAngle, zAngle, 1000 as Float, 0.000000)
	utility.wait(0.300000)
	turtle.translateto(self.x + 500 as Float, self.y, self.z - 10000 as Float, xAngle, yAngle, zAngle, 500 as Float, 0.000000)
	HajmotaModel.translateto(self.x + 500 as Float, self.y, self.z - 10000 as Float, xAngle, yAngle, zAngle, 500 as Float, 0.000000)
	turtle.disable(true)
endFunction
