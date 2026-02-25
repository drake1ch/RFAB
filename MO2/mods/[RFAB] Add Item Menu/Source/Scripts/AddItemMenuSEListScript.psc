Scriptname AddItemMenuSEListScript extends UIMenuBase

import AddItemMenuSE

string property		ROOT_MENU		= "CustomMenu" autoReadonly
string Property 	MENU_ROOT		= "_root.listMenu." autoReadonly

float _resultFloat = -1.0
int _resultInt = -1
string _resultString = ""

int _menuMode = 0
string _searchString = ""

int Function GetResultInt()
	return _resultInt
EndFunction

float Function GetResultFloat()
	return _resultFloat
EndFunction

string Function GetResultString()
	return _resultString
EndFunction

Function OnInit()
; 	ResetMenu()
EndFunction

Function ResetMenu()
	isResetting = true

	_menuMode = 0
	_searchString = ""
	
	isResetting = false
EndFunction

Function CycleMenuMode()
	_menuMode += 1
	if (_menuMode == AIM_GetOrderListSize())
		_menuMode = 0
	endif
endFunction


Event OnKeyDown(Int KeyCode)
	if (KeyCode == AIM_GetSortOrderKeyCode())
		CycleMenuMode()
		_resultString = "SortEntries"
	elseif (KeyCode == AIM_GetQuantityChangeKeyCode())
		_resultString = "AmountOption"
	elseif (KeyCode == AIM_GetNameSearchKeyCode())
		_resultString = "SearchEntries"
	endif
	SendModEvent("UIListMenu_CloseMenu")
	UI.CloseCustomMenu()
	Unlock()
EndEvent

int Function OpenMenu(Form aForm = None, Form aReceiver = None)
	_resultFloat = -1.0
	_resultInt = -1
	_resultString = ""

	if (aForm)
		_searchString = aForm.GetName()
	endif
	
	If (!BlockUntilClosed() || !WaitForReset())
		return 0
	Endif

	int namesearchKey = AIM_GetNameSearchKeyCode()
	if (namesearchKey != 0)
		RegisterForKey(namesearchKey)
	endif

	int quantityKey = AIM_GetQuantityChangeKeyCode()
	if (quantityKey != 0)
		RegisterForKey(quantityKey)
	endif

	int sortKey = AIM_GetSortOrderKeyCode()
	if (sortKey != 0)
		RegisterForKey(sortKey)
	endif

	RegisterForModEvent("UIListMenu_LoadMenu", "OnLoadMenu")
	RegisterForModEvent("UIListMenu_CloseMenu", "OnUnloadMenu")
	RegisterForModEvent("UIListMenu_SelectItemText", "OnSelectText")
	RegisterForModEvent("UIListMenu_SelectItem", "OnSelect")

	Lock()
	UI.OpenCustomMenu("listmenu")
	
	If (!WaitLock())
		return 0
	Endif
	
	If (_resultString == "SortEntries")
		_resultString = ""
		return -1
	elseIf (_resultString == "SearchEntries")
		_resultString = ""
		return -2
	elseIf (_resultString == "AmountOption")
		_resultString = ""
		return -3
	Endif

	If (_resultFloat == -1.0)
		return 0
	Endif

	return 1
EndFunction

string Function GetMenuName()
	return "UIListMenu"
EndFunction

Event OnSelect(string eventName, string strArg, float numArg, Form formArg)
	_resultInt = strArg as int
	_resultFloat = numArg
	Unlock()
EndEvent

Event OnSelectText(string eventName, string strArg, float numArg, Form formArg)
	_resultString = strArg
EndEvent

Event OnLoadMenu(string eventName, string strArg, float numArg, Form formArg)

	string[] entries = AIM_GetEntries(_menuMode, _searchString)
	
	if (entries.length == 0)
		entries = AIM_GetEntries(_menuMode, "")
	endIf
	
	UI.InvokeStringA(ROOT_MENU, MENU_ROOT + "LM_AddTreeEntries", entries)
EndEvent

Event OnUnloadMenu(string eventName, string strArg, float numArg, Form formArg)
	UnregisterForModEvent("UIListMenu_LoadMenu")
	UnregisterForModEvent("UIListMenu_CloseMenu")
	UnregisterForModEvent("UIListMenu_SelectItem")
	UnregisterForModEvent("UIListMenu_SelectItemText")

	UnregisterForAllKeys()
EndEvent
