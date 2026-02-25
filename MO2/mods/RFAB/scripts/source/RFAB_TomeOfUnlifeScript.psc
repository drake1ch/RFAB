Scriptname RFAB_TomeOfUnlifeScript extends ObjectReference  

SPELL Property UndeadBuff  Auto  
Message Property TomeOfUnlife  Auto  
Bool End = false

Event OnRead()
	if End == false
		Utility.waitMenuMode(1.5)
		if TomeOfUnlife.show() == 0
			Game.Getplayer().AddSpell(UndeadBuff)
			End = true
		endif
	endif
endEvent

