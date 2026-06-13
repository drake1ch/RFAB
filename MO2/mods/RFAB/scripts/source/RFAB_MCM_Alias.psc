Scriptname RFAB_MCM_Alias extends ReferenceAlias  
{Обновляет значения RFAB MCM после каждой перезагрузки игры, хранилище каких-то значений}

RFAB_MCM Property MCM Auto

bool Property IsBlessingMessageOn = true Auto Hidden
{Отображение сообщения о потери и восстановлении праведности}
bool Property IsFastTravelAllowed = false Auto Hidden
{Разрешение на быстрое перемещение, контролируется в RFAB_FastTravelControl}

Event OnInit()
    GoToState("Ready")
EndEvent

State Ready

Event OnPlayerLoadGame()
    MCM.StartMenu.UpdateDifficulty()
EndEvent

EndState

Event OnPlayerLoadGame()
	; ѕустышка
EndEvent