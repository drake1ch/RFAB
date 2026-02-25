Scriptname AddItemMenuSEContainerScript extends Quest  

import AddItemMenuSE

string property		ROOT_MENU	= "ContainerMenu" autoReadonly
string Property 	MENU_ROOT	= "_root.Menu_mc." autoReadonly

Formlist[] Property lists Auto
ObjectReference Property chest Auto

int clipboardSearchKey = 0
int quantityKey = 0

int s_resultIndex
bool s_itemSearch
string s_searchText
int s_itemCount



bool Function Ready(int resultIndex, bool itemSearch, string searchText, int itemCount)

	;init
	s_resultIndex = resultIndex
	s_itemSearch = itemSearch
	s_searchText = searchText
	s_itemCount = itemCount
	
	chest.Reset()
	
;	AIM_DebugTrace("AddItemMenuSEContainerScript::0")

	if (AIM_GetItems(resultIndex, lists, searchText))
;		AIM_DebugTrace("AddItemMenuSEContainerScript::1")
		if (AddItemsToContainer(chest, itemCount))
;			AIM_DebugTrace("AddItemMenuSEContainerScript::2")
;			chest.GetBaseObject().SetName(GetChestName(itemSearch, searchText)) ; for skse209
			chest.SetDisplayName(GetChestName(itemSearch, searchText))
			return true
		endif
	endif
	return false
endFunction

string Function GetChestName(bool bSearch, string str)
	string result
	if(bSearch && str)
		string translation = AIM_GetTranslation("$AIM_SEARCHCHEST_NAME")
		if (translation)
			result = AIM_Replace(translation, "{SEARCH_STRING}", str)
		else
			result = AIM_GetListResultString()
		endif
	else
		result = AIM_GetListResultString()
	endif
	return result
endFunction

bool Function AddItemsToContainer(ObjectReference refr, int itemCount)
	bool result = false
	int index = 0
	if (!refr)
		return false
	endif
	while (index < lists.length)
		if (lists[index].GetSize() > 0)
			int quantity = 1
			if (itemCount > 0)
				quantity = itemCount
			else
				quantity = AIM_GetQuantity(index)
			endif
			refr.AddItem(lists[index], quantity)
			if (!result)
				result = true
			endif
		endif
		index += 1
	endWhile
	return result
endFunction

Function Open(Actor akActor)
	RegisterForMenu("ContainerMenu")
	chest.Activate(akActor)
endFunction

Event OnMenuOpen(String MenuName)
	clipboardSearchKey = AIM_GetClipboardKeyCode()
	if (clipboardSearchKey != 0)
		RegisterForKey(clipboardSearchKey)
	endif

	quantityKey = AIM_GetQuantityChangeKeyCode()
	if (quantityKey != 0)
		RegisterForKey(quantityKey)
	endif
	
EndEvent

Event OnMenuClose(String MenuName)
	UnregisterForMenu("ContainerMenu")
	
;	if (clipboardSearchKey != 0)
;		UnregisterForKey(clipboardSearchKey)
;		clipboardSearchKey = 0
;	endif
;
;	if (quantityKey != 0)
;		UnregisterForKey(quantityKey)
;		quantityKey = 0
;	endif

	UnregisterForAllKeys()
EndEvent

Event OnKeyDown(Int KeyCode)
	if (KeyCode == clipboardSearchKey)
	int entryID = UI.GetInt(ROOT_MENU, MENU_ROOT + "inventoryLists.itemList.selectedEntry.formId")
	if (entryID == 0)
		return
	endif
	form item = Game.GetFormEx(entryID)
	if (!item)
		return
	endif
	string name = item.GetName()
	if (name && AIM_SetClipboardText(name))
	;		AIM_DebugTrace(name)
		string translation = AIM_GetTranslation("$AIM_COPYNAME")
		if (translation)
			string str = AIM_Replace(translation, "{NAME}", name)
			Debug.Notification(str)
		endif	
	endif
	elseif(KeyCode == quantityKey)
		AIM_CloseContainerMenu()
		int itemCount = AIM_OpenTextMenu("") as int
		if (itemCount >= 1)
			if (Ready(s_resultIndex, s_itemSearch, s_searchText, itemCount))
				Open(Game.GetPlayer())
			endif
		else
			Open(Game.GetPlayer())
		endif
	endif
EndEvent
