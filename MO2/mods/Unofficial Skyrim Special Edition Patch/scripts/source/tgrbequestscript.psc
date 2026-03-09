Scriptname TGRBEQuestScript extends Quest  Conditional

int Property pTGRBEFail Auto Conditional
int Property pTGRBETold Auto Conditional
Quest Property pTGRShellQuest Auto Conditional
Quest Property pTGRBEQuest Auto Conditional
TGRQueueQuestScript Property pTGRQueueQuestScript Auto
int Property pTGRLoot01 Auto Conditional
Activator Property pHorn Auto Conditional
Activator Property pFlagon Auto Conditional
Activator Property pUrn Auto Conditional
Activator Property pGoblet Auto Conditional
Activator Property pPitcher Auto Conditional
Activator Property pModel Auto Conditional
Activator Property pCandle Auto Conditional
ReferenceAlias Property Alias_ItemToGet Auto Conditional
ReferenceAlias Property Alias_ItemMarker Auto Conditional
ReferenceAlias Property Boss Auto Conditional
ReferenceAlias Property pHornM Auto Conditional
ReferenceAlias Property pFlagonM Auto Conditional
ReferenceAlias Property pUrnM Auto Conditional
ReferenceAlias Property pGobletM Auto Conditional
ReferenceAlias Property pPitcherM Auto Conditional
ReferenceAlias Property pModelM Auto Conditional
ReferenceAlias Property pCandleM Auto Conditional
GlobalVariable Property pTGRQuitVex Auto Conditional

Function Generate()

	pTGRLoot01 = Utility.RandomInt(1,7)

	if pTGRLoot01 == 1
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pHorn))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 2
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pFlagon))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 3
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pUrn))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 4
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pGoblet))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 5
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pPitcher))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 6
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pModel))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	elseif pTGRLoot01 == 7
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetReference().PlaceAtMe(pCandle))
		Alias_ItemToGet.GetReference().SetActorOwner(Boss.GetActorReference().GetActorBase())
	endif

	pTGRBEQuest.SetStage(10)

endFunction

Function CleanUp()

	if Game.GetPlayer().GetItemCount(pHornM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pHornM.GetReference())
	Else
		pHornM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pFlagonM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pFlagonM.GetReference())
	Else
		pFlagonM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pUrnM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pUrnM.GetReference())
	Else
		pUrnM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pGobletM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pGobletM.GetReference())
	Else
		pGobletM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pPitcherM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pPitcherM.GetReference())
	Else
		pPitcherM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pModelM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pModelM.GetReference())
	Else
		pModelM.GetReference().Delete()
	EndIf

	if Game.GetPlayer().GetItemCount(pCandleM.GetReference()) == 1
		Game.GetPlayer().RemoveItem(pCandleM.GetReference())
	Else
		pCandleM.GetReference().Delete()
	EndIf

endFunction
