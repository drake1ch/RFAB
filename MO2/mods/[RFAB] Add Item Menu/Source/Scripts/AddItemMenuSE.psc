Scriptname AddItemMenuSE hidden

;Function AIM_DebugTrace(string str) global native

string[] Function AIM_GetEntries(int mode, string str) global native
bool Function AIM_GetItems(int enrtyIndex, Formlist[] lists, string str = "") global native
int Function AIM_GetQuantity(int itemType = 0) global native
int Function AIM_GetOrderListSize() global native

int Function AIM_GetClipboardKeyCode() global native
int Function AIM_GetQuantityChangeKeyCode() global native
int Function AIM_GetNameSearchKeyCode() global native
int Function AIM_GetSortOrderKeyCode() global native

string Function AIM_GetClipboardText() global native
bool Function AIM_SetClipboardText(string str) global native

string Function AIM_GetTranslation(String key) global native
string Function AIM_Replace(String str, String target, String replacement) global native
string Function AIM_ReplaceArray(String str, String[] targets, String[] replacements) global native

Function AIM_CloseContainerMenu() global native
Function AIM_CloseAllMenu() global
	Game.DisablePlayerControls()
	Game.EnablePlayerControls()
EndFunction

UIMenuBase Function AIM_GetMenu(String modeString, bool bReset = true) global
	UIMenuBase menuBase = None
	if (modeString == "list")
		menuBase = (Game.GetFormFromFile(0x3319, "AddItemMenuSE.esp") as UIMenuBase)
	elseif (modeString == "text")
		menuBase = (Game.GetFormFromFile(0x8EC2, "AddItemMenuSE.esp") as UIMenuBase)
	endif
	if (menuBase)
		if (bReset)
			menuBase.ResetMenu()
		Endif
		return menuBase
	Endif
	return None
EndFunction

; ---- Text -----------------------------------------

bool Function AIM_InitTextMenu() global
	UIMenuBase menuBase = AIM_GetMenu("text", true)
	if (menuBase)
		return true
	endif
	return false
endFunction

string Function AIM_OpenTextMenu(string text, Form akForm = None, Form akReceiver = None) global
	AIM_GetMenu("text", false).SetPropertyString("text", text)
	AIM_GetMenu("text", false).OpenMenu(akForm, akReceiver)
	return AIM_GetMenu("text", false).GetResultString()
endFunction

; ---- List -----------------------------------------

bool Function AIM_InitListMenu() global
	UIMenuBase menuBase = AIM_GetMenu("list", true)
	if (menuBase)
		return true
	endif
	return false
EndFunction

int Function AIM_OpenListMenu(Form akForm = None, Form akReceiver = None) global
	return AIM_GetMenu("list", false).OpenMenu(akForm, akReceiver)
EndFunction

int Function AIM_GetListResultInt() global
	return AIM_GetMenu("list", false).GetResultInt()
EndFunction

string Function AIM_GetListResultString() global
	return AIM_GetMenu("list", false).GetResultString()
EndFunction
