Scriptname RFAB_MarkRecallScript extends ActiveMagicEffect  

FormList Property Markers Auto
Activator Property MarkerPrefab Auto

Actor _player

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_player = akTarget

	string[] sButtons = new string[4]
	sButtons[0] = "Телепортироваться к метке"
	sButtons[1] = "Установить метку"
	sButtons[2] = "Удалить метку"
	sButtons[3] = "Отмена"	

	bool bDone = false

	while (!bDone)
		int iChoice = SkyMessage.ShowArray("Что вы хотите сделать?", sButtons, getIndex = true) as int

		if (iChoice == 0)
			bDone = TryTeleportToMarker()
		elseif (iChoice == 1)
			bDone = TryAddMarker()
		elseif (iChoice == 2)
			bDone = TryDeleteMarker()
		else
			bDone = true
		endif
	endwhile
EndEvent

bool Function TryTeleportToMarker()
	int iSize = Markers.GetSize()

	if (iSize == 0)
		Debug.Notification("Метки отсутствуют!")
		return false
	endif

	int iIndex = SkyMessage.ShowArray("К какой метке телепортироваться?", GetMarkersButtons(), getIndex = true) as int

	if (iIndex == iSize)
		return false
	endif

	ObjectReference kMarker = Markers.GetAt(iIndex) as ObjectReference
	_player.MoveTo(kMarker)

	return true
EndFunction

bool Function TryAddMarker()
	UIMenuBase kMenu = UIExtensions.GetMenu("UITextEntryMenu")
	kMenu.OpenMenu()

	while (UI.IsMenuOpen("CustomMenu"))
		Utility.Wait(0.1)
	endwhile

	string sName = kMenu.GetResultString()

	if (IsNotEmpty(sName))
		RFAB_NamedObject kNewMarker = _player.PlaceAtMe(MarkerPrefab, abForcePersist = true) as RFAB_NamedObject
		kNewMarker.Name = sName
		Markers.AddForm(kNewMarker)
		return true
	endif

	Debug.Notification("Неккоректное название!")
	return false
EndFunction

bool Function TryDeleteMarker()
	int iSize = Markers.GetSize()

	if (iSize == 0)
		Debug.Notification("Метки отсутствуют!")
		return false
	endif

	int iIndex = SkyMessage.ShowArray("Какую метку удалить?", GetMarkersButtons(), getIndex = true) as int

	if (iIndex == iSize)
		return false
	endif

	ObjectReference kMarker = Markers.GetAt(iIndex) as ObjectReference
	Markers.RemoveAddedForm(kMarker)
	kMarker.Delete()
EndFunction

bool Function IsNotEmpty(string asText)
	if (asText == "")
		return false
	endif

	int i = StringUtil.GetLength(asText)
	while (i > 0)
		i -= 1
		if (StringUtil.GetNthChar(asText, i) != " ")
			return true
		endif
	endwhile
	return false
EndFunction

string[] Function GetMarkersButtons()
	int iSize = Markers.GetSize()
	string[] sMarkers = Utility.CreateStringArray(iSize + 1)
	sMarkers[iSize] = "Отмена"

	int i = 0
	while (i < iSize)
		sMarkers[i] = (Markers.GetAt(i) as RFAB_NamedObject).Name
		i += 1
	endwhile
	return sMarkers
EndFunction