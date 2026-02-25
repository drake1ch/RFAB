Scriptname powerShrineScript extends ObjectReference

RFAB_DoomStoneMenu Property DoomStoneController Auto

Event OnActivate(ObjectReference akRef)
	if akRef != Game.GetPlayer()
		return
	endif
	if DoomStoneController.GetDoomStoneID() != 13 ; Ќет знака хранител€
		debug.notification(" амень никак не реагирует на мое прикосновение...")		
	else	
		if SkyMessage.Show(GetStandingStoneMessage(), "я знаю, что это мой знак рождени€.", "Ёто не мой знак рождени€.", getIndex = true) == 0
			int DoomStoneId = DoomStoneController.GetDoomStoneIdByName(self.GetDisplayName())
			if DoomStoneId != -1
				DoomStoneController.SetDoomStoneById(DoomStoneId)
				PlayAnimation("playanim01")
				Game.AddAchievement(29)
			endif
		endif	
	endif
EndEvent

string Function GetStandingStoneMessage()
	string DoomStoneName = self.GetDisplayName()
	return DoomStoneController.GetTextByKey(DoomStoneName, "Immersive") + "\n\n" + DoomStoneController.GetTextByKey(DoomStoneName, "Bonus")
EndFunction
