Scriptname RFAB_Alduin_MeteorRain_Script extends ActiveMagicEffect  

ObjectReference[] Property Box  Auto  

SPELL[] Property mySpell  Auto  

Actor Property Player  Auto  

Float Property Period Auto

Int Property MaxCount Auto

MagicEffect Property ClearSkiesEffect  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
		int Count = 0
		int i = 0

		while akTarget.isInCombat() && Count<MaxCount && !Game.GetPlayer().HasMagicEffect(ClearSkiesEffect)
			int a = 0
			while a<5
				Float X = Utility.RandomFloat(-1600.0, 1600.0)
				Float Y = Utility.RandomFloat(-1600.0, 1600.0)
				Box[i].MoveTo(Player as ObjectReference, X as float, Y as float, 3500 as float)
				Box[i+1].MoveTo(Player as ObjectReference, X as float, Y as float, 0 as float)
				int Type = Utility.RandomInt(0, MySpell.length)
				Myspell[Type].Cast(Box[i], Box[i+1])
				a+=1
			endwhile
			Utility.wait(Period)
			Count+=1
		endwhile

endevent

		


