Scriptname AddItemMenuSEObject extends ObjectReference  

import AddItemMenuSE

bool Property searchOption Auto
MiscObject Property searchObject Auto
AddItemMenuSEContainerScript property ContainerScript Auto

Event OnEquipped(Actor akActor)

	if (akActor != Game.GetPlayer())
		return
	endif

	AIM_CloseAllMenu()
	
	if (!AIM_InitListMenu() || !AIM_InitTextMenu())
		return
	endif

	int itemCount = 0
	string searchText = ""
	searchObject.SetName("")

	bool itemSearch = searchOption
	bool loop = true
	int resultIndex = -1

	if (itemSearch)
		searchText = AIM_OpenTextMenu(searchText)
		searchObject.SetName(searchText)

;		AIM_DebugTrace("AIM_GetEntries "+ (AIM_GetEntries(0, searchText)).length)

		if ((AIM_GetEntries(0, searchText)).length == 1)
			loop = false
			resultIndex = 999
		endif
	endif

	while(loop)
		int menuResult = AIM_OpenListMenu(searchObject)
		if (menuResult == 1)
			loop = false
		elseif (menuResult == -1)
			; 
		elseIf (menuResult == -2)
			searchText = AIM_OpenTextMenu(searchText)
			searchObject.SetName(searchText)
			itemSearch = true

			if ((AIM_GetEntries(0, searchText)).length == 1)
				loop = false
				resultIndex = 999
			endif
		elseIf (menuResult == -3)
			itemCount = AIM_OpenTextMenu("") as int
		else
			return
		endif
	endWhile

	if (resultIndex != 999)
		resultIndex = AIM_GetListResultInt()
	endif

	if (itemSearch)
		if (resultIndex != 999)
			searchText = ""
			itemSearch = false
		endif
	else
		searchText = ""
	endif
	
	if (ContainerScript.Ready(resultIndex, itemSearch, searchText, itemCount))
		ContainerScript.Open(akActor)
	else
		Debug.Notification("$AIM_NOT_FOUND")
	endif
endEvent

; waste
Formlist[] Property lists Auto
ObjectReference Property Chest Auto
