Scriptname RFAB_LevelUpBonuses extends ReferenceAlias  
{Дает дополнительные 5 статов каждые 5 уровней для имперца}

Race Property ImperialRace Auto
Race Property ImperialRaceVampire Auto

Message Property LevelUpBonus Auto
Message Property FirstLevelBonus Auto

Actor Player

int LevelUpCounter = 1

Event OnInit()
    Player = Game.GetPlayer()
    RegisterForMenu("StatsMenu")
EndEvent

Event OnPlayerLoadGame()
    RegisterForMenu("StatsMenu")   
EndEvent

;/ Auto State Initial
	Event OnMenuOpen(string asMenuName)
		Utility.WaitMenuMode(1.0)
		bool Done = false
		while (!Done)
			int ResultID = FirstLevelBonus.Show()
			if SkyMessage.Show(GetGuideText(ResultID), "ОК", "Отмена", getIndex = true) == 0
				GoToState("")
				Done = true
				ModBaseActorValue(GetActorValueByID(ResultID), 5)
				UpdateAttributeInMenu(ResultID)
			endif
		endwhile
	EndEvent
EndState

Event OnMenuOpen(string asMenuName)
EndEvent /;

Event OnMenuClose(string asMenuName)
	if Player.GetRace() == ImperialRace || Player.GetRace() == ImperialRaceVampire
		ShowLevelUpBonus()
	endif
EndEvent

Function ShowLevelUpBonus()
	int BonusCount = Math.Floor(Player.GetLevel() / 5)
	if BonusCount >= LevelUpCounter 
		int i = 0
		while i < BonusCount - LevelUpCounter + 1
			bool Done = false
			while (!Done)
				int ResultID = LevelUpBonus.Show()
				if SkyMessage.Show(GetGuideText(ResultID), "ОК", "Отмена", getIndex = true) == 0
					Done = true
					ModBaseActorValue(GetActorValueByID(ResultID), 5)
				endif
			endwhile
			i += 1	
		endwhile
		LevelUpCounter = BonusCount + 1
	endif 
EndFunction

Function UpdateAttributeInMenu(int aiAttributeId)
	int iAttributeId = aiAttributeId * 3
	string sAttribute = GetActorValueByID(aiAttributeId)
	UI.SetString("StatsMenu", "_root.StatsMenuBaseInstance.AttributesA." + iAttributeId + 1, Player.GetActorValue(sAttribute))
	UI.SetString("StatsMenu", "_root.StatsMenuBaseInstance.AttributesA." + iAttributeId + 2, Player.GetActorValueMax(sAttribute))
	float[] fBaseAttributeLevels = new float[3]
	fBaseAttributeLevels[0] = Player.GetBaseActorValue("Magicka")
	fBaseAttributeLevels[1] = Player.GetBaseActorValue("Health")
	fBaseAttributeLevels[2] = Player.GetBaseActorValue("Stamina")
	UI.InvokeFloatA("StatsMenu", "_root.StatsMenuBaseInstance.setMetersModified", fBaseAttributeLevels)
EndFunction

string Function GetActorValueByID(int aiID)
	if aiID == 0
		return "Magicka"
	elseif aiID == 1
		return "Health"
	elseif aiID == 2
		return "Stamina"
	endif
EndFunction

string Function GetGuideText(int aiId)
	string sResult = "Повысить " + GetActorValueNameByID(aiId) + "?\n\n"
	if aiId == 0
		sResult += "Ранг I = 250 ед. базовой магии\n200% регенерации магии\nРанг II = 300 ед. базовой магии\n15% сопротивление магии\nРанг III = 350 ед. базовой магии\n20% увеличение скорости произношения заклинаний"
	elseif aiId == 1
		sResult += "Ранг I = 250 ед. базового здоровья\n250 ед. переносимого веса\nРанг II = 300 ед. базового здоровья\n25% сопротивления ядам\nРанг III = 350 ед. базового здоровья\n20% увеличение базового физического урона"
	elseif aiId == 2
		sResult += "Ранг I = 250 ед. базового запаса сил\n100% регенерации запаса сил\nРанг II = 300 ед. базового запаса сил\n25% сопротивление болезням\nРанг III = 350 ед. базового запаса сил\n10% увеличение скорости атаки любым оружием"
	endif
	return sResult
EndFunction

string Function GetActorValueNameByID(int aiId)
	if aiId == 0
		return "Магия"
	elseif aiId == 1
		return "Здоровье"
	elseif aiId == 2
		return "Запал сил"
	endif
EndFunction

Function ModBaseActorValue(string asActorValue, int aiValue)
	Player.SetActorValue(asActorValue, Player.GetBaseActorValue(asActorValue) + aiValue)
EndFunction