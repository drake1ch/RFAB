Scriptname powerShrineScript extends ObjectReference

RFAB_StartMenu Property DoomStoneController Auto

Event OnActivate(ObjectReference akRef)
	if akRef != Game.GetPlayer()
		return
	endif
	if DoomStoneController.GetDoomStoneID() != 13 ; Нет знака хранителя
		debug.notification("Камень никак не реагирует на мое прикосновение...")		
	else	
		int DoomStoneId = DoomStoneController.GetDoomStoneIdByName(self.GetDisplayName())
		if SkyMessage.Show(GetStandingStoneMessage(DoomStoneId), "Я знаю, что это мой знак рождения.", "Это не мой знак рождения.", getIndex = true) == 0
			if DoomStoneId != -1
				DoomStoneController.SetDoomStoneById(DoomStoneId)
				PlayAnimation("playanim01")
				Game.AddAchievement(29)
			endif
		endif	
	endif
EndEvent

string Function GetStandingStoneMessage(int arg1)
	string [] Descriptions = DoomStoneController.DataSetup(false, "Камень в мире", "Описание")
	string [] Bonuses = DoomStoneController.DataSetup(false, "Камень", "Бонус")
	return DoomStoneController.ReplaceEnters(Descriptions[arg1]  + "\n\n" + Bonuses[arg1])
EndFunction
