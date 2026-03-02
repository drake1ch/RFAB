scriptName RFAB_Deadlands_OblTowerBossScript extends ObjectReference

form property darkfire auto
sound property BossVoicePhase4 auto
Int[] property firesounds auto
ObjectReference property bossbarrier auto
ObjectReference property ShrineSigilStone auto
ObjectReference property GateInShrineActi auto
activator property portal auto
ObjectReference property ShrineSigilStoneFX auto
sound property BossVoicePhase1 auto
ObjectReference property PostMarker auto
actor property Boss auto
objectreference[] property fires auto
sound property BossVoicePhase3 auto
spell property Mark auto
sound property BossVoiceBattle auto
Int property markdamage auto
Int property maxdamagefire auto
ObjectReference property sigilbarrier auto
objectreference[] property portals auto
objectreference[] property newfire auto
sound property BossVoicePhase0 auto
sound property BossVoicePhase2 auto
sound property firesound auto

Int battlevoice
actor Player

function OnActivate(ObjectReference akActionRef)
	Player = game.GetPlayer()
	Boss.GetActorBase().Setessential(true)
	newfire = new objectreference[10]
	BossVoicePhase0.play(Boss as ObjectReference)
	utility.wait(20 as Float)
	self.phase1()
endFunction

function phase1()
	BossVoicePhase1.play(Boss as ObjectReference)
	utility.wait(1.50000)
	Int i = 0
	while i < fires.length
		newfire[i] = fires[i].placeatme(darkfire, 1, false, false)
		newfire[i].setscale(0.400000)
		firesounds[i] = firesound.play(fires[i])
		i += 1
	endWhile
	Boss.StartCombat(Player)
	bossbarrier.disablenowait(true)
	while Boss.GetActorValuePercentage("health") > 0.300000
		i = 0
		while i < 15 && Boss.GetActorValuePercentage("health") > 0.300000
			utility.wait(1 as Float)
			Player.Damageav("health", (maxdamagefire / self.DistanceCheck()) as Float)
			i += 1
		endWhile
		if Boss.GetActorValuePercentage("health") > 0.300000
			battlevoice = BossVoiceBattle.play(Boss as ObjectReference)
		endIf
	endWhile
	self.phase2()
endFunction

function phase2()
	sound.stopinstance(battlevoice)
	Boss.restoreav("health", 10000 as Float)
	Int i = 0
	while Boss.GetActorValuePercentage("health") > 0.300000
		if i == 0
			BossVoicePhase2.play(Player as ObjectReference)
			Int fire_removed = utility.randomint(0, 9)
			newfire[fire_removed].disablenowait(false)
			while Player.GetDistance(fires[fire_removed]) > 200 as Float
				Boss.SetGhost(true)
				Player.Addspell(Mark, false)
				utility.wait(1 as Float)
				Player.Damageav("health", markdamage as Float)
				Player.Damageav("health", (maxdamagefire / self.DistanceCheck()) as Float)
			endWhile
			Player.removespell(Mark)
			Boss.SetGhost(false)
			newfire[fire_removed].enablenowait(false)
		elseIf i == 10 || i == 20
			battlevoice = BossVoiceBattle.play(Boss as ObjectReference)
		elseIf i == 30
			i = -1
		endIf
		utility.wait(1 as Float)
		Player.Damageav("health", (maxdamagefire / self.DistanceCheck()) as Float)
		i += 1
	endWhile
	self.phase3()
endFunction

function phase3()
	sound.stopinstance(battlevoice)
	Boss.GetActorBase().Setessential(false)
	Boss.restoreav("health", 10000 as Float)
	BossVoicePhase3.play(Boss as ObjectReference)
	Portals = new ObjectReference[10]
	Int i = 0
	while (i < Portals.Length && !Boss.IsDead())
		newfire[i].disablenowait(true)
		portals[i] = fires[i].placeatme(portal as form, 1, false, false)
		Int k = 0
		while k < 30
			Player.Damageav("health", (maxdamagefire / self.DistanceCheck()) as Float)
			utility.wait(1 as Float)
			if !Boss.IsDead()
				k += 1
			else
				k = 30
			endIf
		endWhile
		battlevoice = BossVoiceBattle.play(Boss as ObjectReference)
		i += 1
	endWhile
	self.phase4()
endFunction

function phase4()
	sound.stopinstance(battlevoice)
	BossVoicePhase4.playandwait(sigilbarrier)
	sigilbarrier.disablenowait(true)
	Int i = 0
	while i < newfire.length
		newfire[i].disablenowait(true)
		i += 1
	endWhile
	GateInShrineActi.disablenowait(false)
	PostMarker.enablenowait(false)
	ShrineSigilStone.disablenowait(false)
	ShrineSigilStoneFX.disablenowait(false)
endFunction

Event OnWarlordDie()
	int i = 0
	while i < Portals.Length
		(Portals[i] as RFAB_OblTowerGateSummonScript).OnWarlordDie()
		i += 1
	endwhile
EndEvent

Int function DistanceCheck()
	Float Distance = 99999 as Float
	Int i = 0
	while i < newfire.length
		if Player.GetDistance(newfire[i]) < Distance && newfire[i].IsEnabled()
			Distance = Player.GetDistance(newfire[i])
		endIf
		i += 1
	endWhile
	return math.floor(Distance)
endFunction
