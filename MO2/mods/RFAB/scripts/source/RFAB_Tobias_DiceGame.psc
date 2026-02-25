scriptName RFAB_Tobias_DiceGame extends Quest

;-- Properties --------------------------------------
objectreference property dice2 auto
sound property PlayerThrowGoodSound auto
objectreference property enemymarker auto
sound property Draw auto
sound property PlayerSurrenderedSound auto
actor property enemy auto
sound property DiceRolling auto
key property TurtleKey auto
sound property Win auto
sound property PlayerThrowNormalSound auto
objectreference property spawnmarker auto
perk property cheat1perk auto
perk property cheat2perk auto
shout property cheatshout auto
sound property DiceShaking auto
static[] property dices auto
objectreference property playermarker auto
sound property Loss auto
sound property PlayerThrowBadSound auto
objectreference property dice1 auto
objectreference property dicemarker auto

;-- Variables ---------------------------------------
String ShoutAvailable
Int enemyscore = 0
String Cheat2Available
Bool throw_complete = false
Bool cheat1used = false
String Cheat1Available
Int playerscore = 0
Bool shoutused = false
Bool cheat2used = false
actor player

;-- Functions ---------------------------------------

function MoveDice(objectreference dice, Float Zangle)

	Int x_offset = utility.randomint(-15, 15)
	Int y_offset = utility.randomint(-30, 30)
	Int z_offset = utility.randomint(20, 40)
	DiceRolling.Play(dice)
	rfab_papyrusfunctions.RollDice(dice)
endFunction

Bool function CheckForCheat1Oppotunity()

	if !player.hasperk(cheat1perk)
		Cheat1Available = "\n[Недоступно]"
		return false
	elseIf cheat1used
		Cheat1Available = "\n[Использовано]"
		return false
	else
		return true
	endIf
endFunction

Bool function CheckForCheat2Oppotunity()

	if !player.hasperk(cheat2perk)
		Cheat2Available = "\n[Недоступно]"
		return false
	elseIf cheat2used
		Cheat2Available = "\n[Использовано]"
		return false
	else
		return true
	endIf
endFunction

; Skipped compiler generated GotoState

Bool function CheckForShoutAvailable()

	if !player.hasspell(cheatshout as form)
		ShoutAvailable = "\n[Недоступно]"
		return false
	elseIf shoutused
		ShoutAvailable = "\n[Использовано]"
		return false
	else
		return true
	endIf
endFunction

function DiceGameEnemy()

	skymessage.Show("Ваш счёт: " + playerscore as String + "\tСчёт соперника: " + enemyscore as String + "\n\nОчередь соперника бросать кубики", "Наблюдать", "", "", "", "", "", "", "", "", "", false, 0.100000, 0.000000)
	enemyscore += self.ThrowDice(false, 1, enemy as objectreference)
	utility.wait(3 as Float)
endFunction

Int function ThrowDice(Bool cheat, Int minimum_throw, objectreference Thrower)

	dice1.delete()
	dice1.disablenowait(false)
	dice2.delete()
	dice2.disablenowait(false)
	DiceShaking.Play(Thrower)
	utility.wait(1.30000)
	Int score = 0
	Int randomizer = utility.randomint(0, 5) + minimum_throw
	if randomizer > 5 || cheat
		randomizer = 5
	endIf
	score = randomizer + 1
	dice1 = spawnmarker.placeatme(dices[randomizer] as form, 1, false, false)
	Float Xoffset = utility.randomfloat(-30 as Float, 30 as Float)
	Float Yoffset = utility.randomfloat(-30 as Float, 30 as Float)
	Float Zangle = utility.randomfloat(-180 as Float, 180 as Float)
	dice1.moveto(dicemarker, Xoffset, Yoffset, 0 as Float, true)
	dice1.setangle(-90 as Float, 90 as Float, -Zangle)
	rfab_papyrusfunctions.RollDice(dice1)
	randomizer = utility.randomint(0, 5)
	if randomizer > 5 || cheat
		randomizer = 5
	endIf
	score = score + randomizer + 1
	dice2 = spawnmarker.placeatme(dices[randomizer] as form, 1, false, false)
	Xoffset = utility.randomfloat(20 as Float, 40 as Float)
	Yoffset = utility.randomfloat(20 as Float, 40 as Float)
	Zangle = utility.randomfloat(-180 as Float, 180 as Float)
	dice2.moveto(dicemarker, Xoffset, Yoffset, 0 as Float, true)
	rfab_papyrusfunctions.RollDice(dice2)
	return score
endFunction

; Skipped compiler generated GetState

function DiceGamePlayer()

	Int currentthrow
	self.CheckForCheat1Oppotunity()
	self.CheckForCheat2Oppotunity()
	self.CheckForShoutAvailable()
	throw_complete = false
	while !throw_complete
		String result = skymessage.Show("Ваш счёт: " + playerscore as String + "\tСчёт соперника: " + enemyscore as String + "\n\nВаша очередь бросать кубики", "Бросить", "Сжульничать\n[" + cheat1perk.GetName() + "]" + Cheat1Available, "Отвлечь\n[" + cheat2perk.GetName() + "]" + Cheat2Available, "Отвлечь\n[" + cheatshout.GetName() + "]" + ShoutAvailable, "", "", "", "", "", "", false, 0.100000, 0.000000)
		if result == "Бросить"
			currentthrow = self.ThrowDice(false, 0, player as objectreference)
			throw_complete = true
		elseIf result == "Сжульничать\n[" + cheat1perk.GetName() + "]"
			currentthrow = self.ThrowDice(true, 0, player as objectreference)
			cheat1used = true
			throw_complete = true
		elseIf result == "Отвлечь\n[" + cheat2perk.GetName() + "]"
			currentthrow = self.ThrowDice(true, 0, player as objectreference)
			cheat2used = true
			throw_complete = true
		elseIf result == "Отвлечь\n[" + cheatshout.GetName() + "]"
			currentthrow = self.ThrowDice(true, 0, player as objectreference)
			shoutused = true
			throw_complete = true
		endIf
	endWhile
	playerscore += currentthrow
	if currentthrow <= 4
		PlayerThrowBadSound.Play(enemy as objectreference)
	elseIf currentthrow <= 8
		PlayerThrowNormalSound.Play(enemy as objectreference)
	else
		PlayerThrowGoodSound.Play(enemy as objectreference)
	endIf
	utility.wait(3 as Float)
endFunction

function StartGame()

	player = game.getplayer()
	player.moveto(playermarker, 0.000000, 0.000000, 0.000000, true)
	enemy.moveto(enemymarker, 0.000000, 0.000000, 0.000000, true)
	dice1.delete()
	dice2.delete()
	Float zOffset = player.GetHeadingAngle(dicemarker)
	player.setangle(player.GetAngleX(), player.GetAngleY(), player.GetAngleZ() + zOffset)
	zOffset = enemy.GetHeadingAngle(dicemarker)
	enemy.setangle(enemy.GetAngleX(), enemy.GetAngleY(), enemy.GetAngleZ() + zOffset)
	utility.wait(1 as Float)
	game.RequestSave()
	utility.wait(1 as Float)
	game.DisablePlayerControls(true, true, false, false, false, true, true, false, 0)
	enemy.SetDontMove(true)
	Int i = 0
	while i < 3
		self.DiceGamePlayer()
		self.DiceGameEnemy()
		i += 1
	endWhile
	if playerscore > enemyscore
		Win.Play(enemy as objectreference)
		player.additem(TurtleKey as form, 1, false)
	elseIf playerscore == enemyscore
		Draw.Play(enemy as objectreference)
		player.additem(TurtleKey as form, 1, false)
	else
		Loss.Play(enemy as objectreference)
		utility.wait(3 as Float)
		player.kill(none)
	endIf
	game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	enemy.SetDontMove(false)
endFunction

function PlayerSurrendered()

	PlayerSurrenderedSound.Play(enemy as objectreference)
	utility.wait(3 as Float)
	player.kill(none)
endFunction
