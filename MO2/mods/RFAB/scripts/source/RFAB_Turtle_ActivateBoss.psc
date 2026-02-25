scriptName RFAB_Turtle_ActivateBoss extends ObjectReference

ObjectReference property bossmarker auto
musictype property TurtleCombatMusic auto
musictype property TurtleMusic auto
spell property RFAB_Spell_TurtleMusictracker auto
musictype property TurtleBossMusic auto
ObjectReference property turtleref auto
ObjectReference property HajmotaModel auto
objectreference[] property slopes auto

function OnActivate(ObjectReference akActionRef)

	HajmotaModel.enable()
	utility.wait(1.0)
	HajmotaModel.playgamebryoanimation("turtle_idle")
	turtleref.enablenowait(false)
	turtleref.moveto(bossmarker, 0.000000, 0.000000, 0.000000, true)
	turtleref.setangle(0 as Float, 0 as Float, -90 as Float)
	(turtleref as actor).setdontmove(true)
	game.GetPlayer().removespell(RFAB_Spell_TurtleMusictracker)
	utility.wait(1 as Float)
	TurtleCombatMusic.remove()
	TurtleMusic.remove()
	TurtleBossMusic.add()
	Int i = 0
	while i < slopes.length
		slopes[i].activate(slopes[i], false)
		i += 1
	endWhile
	utility.wait(10 as Float)
	turtleref.activate(turtleref, false)
endFunction
