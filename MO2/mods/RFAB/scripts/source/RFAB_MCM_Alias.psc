Scriptname RFAB_MCM_Alias extends ReferenceAlias  
{ќбновл€ет значени€ RFAB MCM после каждой перезагрузки игры, хранилище каких-то значений}

RFAB_MCM Property MCM Auto

bool Property IsBlessingMessageOn = true Auto Hidden
{ќтображение сообщени€ о потери и восстановлении праведности}
bool Property IsFastTravelAllowed = false Auto Hidden
{–азрешение на быстрое перемещение, контролируетс€ в RFAB_FastTravelControl}

Event OnInit()
    GoToState("Ready")
EndEvent

State Ready

Event OnPlayerLoadGame()
    MCM.DifficultyMenu.UpdateDifficulty()
EndEvent

EndState

Event OnPlayerLoadGame()
	; ѕустышка
EndEvent