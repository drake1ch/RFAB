Scriptname AddItemMenuSETextEntryScript extends UIMenuBase

import AddItemMenuSE

string property		ROOT_MENU		= "CustomMenu" autoReadonly
string Property 	MENU_ROOT		= "_root.textEntry." autoReadonly

string _internalString = ""
string _internalResult = ""

string Function GetMenuName()
	return "UITextEntryMenu"
EndFunction

string Function GetResultString()
	return _internalResult
EndFunction

Function SetPropertyString(string propertyName, string value)
	If propertyName == "text"
		_internalString = value
	Endif
EndFunction

Function ResetMenu()
	isResetting = true
	_internalString = ""
	_internalResult = ""
	isResetting = false
EndFunction

int Function OpenMenu(Form inForm = None, Form akReceiver = None)
	_internalResult = ""

	If !BlockUntilClosed() || !WaitForReset()
		return 0
	Endif

	RegisterForModEvent("UITextEntryMenu_LoadMenu", "OnLoadMenu")
	RegisterForModEvent("UITextEntryMenu_CloseMenu", "OnUnloadMenu")
	RegisterForModEvent("UITextEntryMenu_TextChanged", "OnTextChanged")

	int clipboardKey = AIM_GetClipboardKeyCode()
	if (clipboardKey != 0)
		RegisterForKey(clipboardKey)
	endif

	Lock()
	UI.OpenCustomMenu("textentrymenu")
	If !WaitLock()
		return 0
	Endif
	return 1
EndFunction

Event OnLoadMenu(string eventName, string strArg, float numArg, Form formArg)
	UpdateTextEntryString()
EndEvent

Event OnUnloadMenu(string eventName, string strArg, float numArg, Form formArg)
	UnregisterForModEvent("UITextEntryMenu_LoadMenu")
	UnregisterForModEvent("UITextEntryMenu_CloseMenu")
	UnregisterForModEvent("UITextEntryMenu_TextChanged")

	UnregisterForAllKeys()
EndEvent

Event OnTextChanged(string eventName, string strArg, float numArg, Form formArg)
	_internalResult = strArg
	Unlock()
EndEvent

Function UpdateTextEntryString()
	UI.InvokeString(ROOT_MENU, MENU_ROOT + "setTextEntryMenuText", _internalString)
EndFunction

Event OnKeyDown(Int KeyCode)
	string str = AIM_GetClipboardText()
	if (str)
		UI.InvokeString(ROOT_MENU, MENU_ROOT + "setTextEntryMenuText", str)
	endif
endEvent
