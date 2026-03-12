;/ Decompiled by Champollion V1.0.1
Source   : RFAB_TurtleSmallWaveDamage.psc
Modified : 2023-10-25 13:40:52
Compiled : 2023-10-25 13:40:54
User     : Ilya SSD
Computer : HOME-PC
/;
scriptName RFAB_TurtleSmallWaveDamage extends ObjectReference

;-- Properties --------------------------------------
Float property damage auto
sound property wavesound auto
spell property staggerSpell auto
actor property turtle auto
;-- Variables ---------------------------------------
Bool hit = false

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnActivate(ObjectReference akActionRef)

	utility.wait(0.500000)
	hit = false
	actor player = game.getplayer()
	Int soundcounter = 0
	while self.isenabled()
		soundcounter += 1
		if soundcounter == 3
			wavesound.play(self as ObjectReference)
			soundcounter = 0
		endIf
		if self.getdistance(player as ObjectReference) < 200 as Float && !hit
			hit = true
			staggerSpell.cast(turtle, player)

			Float frostres = player.getav("FrostResist")
			if frostres > 70 as Float
				frostres = 70 as Float
			endIf
			Float magicres = player.getav("MagicResist")
			if magicres > 70 as Float
				magicres = 70 as Float
			endIf
			player.damageav("health", damage * (1 as Float - frostres / 100 as Float) * (1 as Float - magicres / 100 as Float))
			utility.wait(1 as Float)
		endIf
		utility.wait(0.100000)
	endWhile
endFunction
