Scriptname RFAB_BA_DungeonBoss extends Actor  

int Property StageWhenNotActual = 212 Auto
{
	1. Бандиты и Звери
	2. Изгои и Великаны
	3. Фалмеры
	4. Двемеры
	5. Драугры
	6. Вампиры
	7. Драконы
}

Auto State Ready
	Event OnLoad()
		if BizarreAdventure.GetDungeonScript().StageNumber.GetValueInt() >= StageWhenNotActual
			GoToState("")
		else
			SendEvent("RFAB_BA_Event_BossLoad") 
		endif
	EndEvent

	Event OnDying(Actor akKiller)
	   	GoToState("")
		SendEvent("RFAB_BA_Event_BossSlain") 
	EndEvent
EndState

Function SendEvent(string asEventName)
	int iHandle = ModEvent.Create(asEventName)
	if (iHandle)
		ModEvent.PushForm(iHandle, self)
		ModEvent.Send(iHandle)
	endIf
EndFunction