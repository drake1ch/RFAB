Scriptname BizarreDebugFunctions extends ActiveMagicEffect  

import RFAB_PapyrusFunctions

Event OnEffectStart(Actor akTarget, Actor akCaster)
	string[] Buttons = new string[7]
	Buttons[0] = "Пройти 1 данж"
	Buttons[1] = "Откатить 1 данж"
	Buttons[2] = "Следующий этап"
	Buttons[3] = "Предыдущий этап"
	Buttons[4] = "Обновить данные"
	Buttons[5] = "Файл данжей"
	Buttons[6] = "Отмена"

	RFAB_BA_Dungeons DungeonsScript = BizarreAdventure.GetDungeonScript()

	string sInfo = \
		"Этап: " + DungeonsScript.CurrentStage + "\n" + \
		"Данж: " + DungeonsScript.DungeonNumber.GetValueInt()

	int iChoiceID = SkyMessage.ShowArray(sInfo, Buttons, getIndex = true) as int

	if iChoiceID == 0
		DungeonsScript.ModDungeonNumber(1)
	elseif iChoiceID == 1
		DungeonsScript.ModDungeonNumber(-1)
	elseif iChoiceID == 2
		DungeonsScript.ModStageNumber(1)
	elseif iChoiceID == 3
		DungeonsScript.ModStageNumber(-1)
	elseif iChoiceID == 4
		DungeonsScript.UpdateDungeonsData()
	elseif iChoiceID == 5
		CreateDungeonsFile()
	endif
EndEvent

Function CreateDungeonsFile()
	Form[] kFilter = new Form[1]
	kFilter[0] = PO3_SKSEFunctions.GetFormFromEditorID("RFAB_BA_DungeonMarker")
	ObjectReference[] kReferences = SkyPal_References.All_Filter_Bases(kFilter)

	string sFileName = "RFAB_BA_Dungeons.txt"

	int i = 0
	while (i < kReferences.Length)
		ObjectReference kMarker = kReferences[i]
		MiscUtil.WriteToFile(sFileName, kMarker.GetCurrentLocation().GetName() + " = " + PO3_SKSEFunctions.IntToString(kMarker.GetFormID(), true) + "\n")
		i += 1
	endwhile

	debug.messagebox("Создан файл " + sFileName)
EndFunction
