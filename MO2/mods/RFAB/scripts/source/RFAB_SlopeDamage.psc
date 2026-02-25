;/ Decompiled by Champollion V1.0.1
Source   : RFAB_SlopeDamage.psc
Modified : 2023-10-25 13:39:18
Compiled : 2023-10-25 13:39:22
User     : Ilya SSD
Computer : HOME-PC
/;
scriptName RFAB_SlopeDamage extends ObjectReference

;-- Properties --------------------------------------
sound property wavesound auto
Float property damage auto

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
		if math.abs(player.getpositionx() - self.getpositionx()) < 300 as Float && math.abs(player.getpositiony() - self.getpositiony()) < 1350 as Float && !hit
			RFAB_PapyrusFunctions.ScriptDamage(player, none, damage, "frost", true)
			hit = true
		endIf
		utility.wait(0.100000)
	endWhile
endFunction
