Scriptname RFAB_BA_StageHandler extends Quest  

GlobalVariable[] Property GrishnakTiers Auto

GlobalVariable Property VampireChanceNone Auto
ObjectReference Property VampireBloodBarrel Auto
ObjectReference Property VampireBloodChalice Auto

Formlist Property DragonPriestMasks Auto

ObjectReference[] Property VendorsChests Auto

bool Property IsNeedShowMovie = true Auto Hidden

int iBandits   = 1
int iForsworns = 2
int iFalmers   = 3
int iDwemers   = 4
int iDraugrs   = 5
int iVampires  = 6
int iDragons   = 7

Event OnInit()
	RegisterForModEvent("RFAB_BA_Event_StageUpdate", "OnStageUpdate")
	OnStageUpdate(1, 1, false)
EndEvent

Event OnStageUpdate(int aiStage, int aiDungeon, bool abNewStage)
	GrishnakTiers[aiStage - 1].SetValueInt(0)

	if (abNewStage)
		IsNeedShowMovie = true
		UpdateVendors()
		if (aiStage == 2 || aiStage == 5 || aiStage == 6)
			Debug.Notification("Возможно, стоит прикупить себе снаряжение получше...")
		endif
	endif

	if (aiStage == iDraugrs && VampireChanceNone.GetValueInt() == 0)
		VampireBloodBarrel.Disable(true)
		VampireBloodChalice.Enable(true)
	endif

	if (aiStage == iDragons)
		EnableObjects(DragonPriestMasks)
	endif
EndEvent

Function EnableObjects(Formlist akList)
	int i = akList.GetSize()
	while (i > 0)
		i -= 1
		(akList.GetAt(i) as ObjectReference).Enable()
	endwhile
EndFunction

Function DisableObjects(Formlist akList)
	int i = akList.GetSize()
	while (i > 0)
		i -= 1
		(akList.GetAt(i) as ObjectReference).Disable()
	endwhile
EndFunction

Function UpdateVendors()
	int i = 0
	while (i < VendorsChests.Length)
		VendorsChests[i].Reset()
		i += 1
	endwhile
EndFunction