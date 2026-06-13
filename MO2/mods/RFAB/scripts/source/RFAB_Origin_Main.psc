Scriptname RFAB_Origin_Main extends Quest  

RFAB_StartMenu Property StartMenu Auto

ImageSpaceModifier property Fadeout auto

Cell OriginCell

Event OnInit()
	RegisterForMenu("RaceSex Menu")
EndEvent

Event OnMenuClose(String MenuName)
	Actor kPlayer = Game.GetPlayer()

	if (!OriginCell)
		OriginCell = kPlayer.GetParentCell()
	elseif (kPlayer.GetParentCell() != OriginCell)
		return
	endif

	Game.DisablePlayerControls()
	Utility.Wait(1.0)
	
	; Удаляем шмотки пленника
	kPlayer.RemoveItem(Game.GetForm(0x0003C9FE), 1, true)
	kPlayer.RemoveItem(Game.GetForm(0x0003CA00), 1, true)

	Fadeout.ApplyCrossFade(1.0)

	ImageSpaceModifier.RemoveCrossFade(1.00000)
	string iResult = StartMenu.Open()

	if (iResult == "")
		Game.ForceFirstPerson()
		kPlayer.RemoveAllItems(abRemoveQuestItems = true)
		kPlayer.EquipItem(Game.GetForm(0x0003C9FE), 1, true)
		kPlayer.EquipItem(Game.GetForm(0x0003CA00), 1, true)
		Game.ShowRaceMenu()
		return
	endif

	int iHandle = ModEvent.Create("RFAB_PlayerStartGame")
	
	if (iHandle)
		ModEvent.Send(iHandle)
	endIf

	Game.EnablePlayerControls()
EndEvent