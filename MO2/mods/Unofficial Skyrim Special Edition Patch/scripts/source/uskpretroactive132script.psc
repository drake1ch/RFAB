Scriptname USKPRetroactive132Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive133Script Property Retro133 Auto
Actor Property PlayerRef Auto

Quest Property MGRArniel02 Auto
Weapon Property StaffTandil Auto

NN01QuestScript Property NN01 Auto

Actor Property CaptainLonelyGaleREF Auto
ObjectReference Property PalaceMarker Auto

ActorBase Property Drifa Auto 
Actor Property DrifaRef Auto
Quest Property TG00 Auto
Quest Property TG01 Auto

C01QuestScript Property C01 Auto
Outfit Property ArmorCompanionsNoHelmetOutfit Auto
Weapon Property SkyforgeSteelGreatsword Auto
Actor Property FarkasRef Auto

ReferenceAlias Property SindingGhost Auto
ReferenceAlias Property SindingHuman Auto
Actor Property Sinding Auto
Faction Property CR08ExclusionFaction Auto
Quest Property DA05 Auto
Quest Property DA05_dunBloatedMansGrottoQST Auto

Quest Property MS11 Auto
HousePurchaseScript Property HouseQuest Auto
ObjectReference Property WindhelmPlayerHouseDecorateBasic Auto
ObjectReference Property WindhelmPlayerHouseDecorateBedroom Auto

Quest Property DB Auto
Quest Property DBDestroy Auto
Quest Property DBForever Auto

Quest Property dunNchuandZelQst Auto

Quest Property TG00MaulHandler Auto

Quest Property FreeformIvarstead02 Auto
ReferenceAlias Property Necklace Auto

Quest Property dunAngarvundeQST Auto

Quest Property CW Auto
Quest Property CWObj Auto
Quest Property CWFinale Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.3.2 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 132
		Retro133.Process()
		Stop()
		Return
	EndIf
	
	;Bug #12106 - Captain Lonely Gale needs to be resurrected for his role as Brunwulf's steward if dead.
	if( CaptainLonelyGaleREF.IsDead() )
		CaptainLonelyGaleREF.Resurrect()
		CaptainLonelyGaleREF.MoveTo(PalaceMarker)
	EndIf
	
	;Bug #12256 - Staff of Tandil is never taken from the player during MGRArniel02
	if( MGRArniel02.GetStageDone(40) == 1 )
		if( PlayerRef.GetItemCount(StaffTandil) > 0 )
			PlayerRef.RemoveItem(StaffTandil, 1)
		EndIf
	EndIf
	
	;Bug #12212 - Crimson Nirnroot count is borked
	if( NN01.GetStage() < 200 )
		NN01.CountRoots()
	EndIf
	
	;Bug #12209 - Taking Care of Business can't start because Drifa is dead.
	if( TG01.GetStage() < 10 )
		if( DrifaRef.IsDead() )
			DrifaRef.Resurrect()
			DrifaRef.Enable()
			DrifaRef.MoveToMyEditorLocation()
			
			if( TG00.GetStageDone(200) == 1 )
				TG01.SetStage(10)
			EndIf
		EndIf
	Else
		Drifa.SetEssential(false)
	EndIf
	
	;Bugzilla #288 - Farkas should not be using boring old vanilla gear
	;Bug #12211 - This got fubared slightly because it was checking if C01 was running, this propery needs to be corrected whether it is or not.
	if(C01.DogsOutoftheBag == true)
		FarkasRef.SetOutfit(ArmorCompanionsNoHelmetOutfit)
	else
		C01.FarkasOutfit = ArmorCompanionsNoHelmetOutfit
		C01.FarkasBaseMeleeWeapon = SkyforgeSteelGreatsword
	endif
	
	;Bug #6510 - Sinding can be selected for CR08 radiant quests, DA05 never stops once completed, and Sinding's duplicate in Falkreath Jail is never disabled.
	SindingGhost.TryToAddToFaction(CR08ExclusionFaction)
	SindingHuman.TryToAddToFaction(CR08ExclusionFaction)
	Sinding.AddToFaction(CR08ExclusionFaction)
	
	if( DA05_dunBloatedMansGrottoQST.GetStageDone(10) == 1 )
		SindingHuman.TryToDisable()
	EndIf
	
	if( DA05.GetStage() >= 200 )
		DA05.Stop()
	EndIf
	
	;Bug #12078 - Hjerim can still be a big fucking mess after completing Blood on the Ice.
	if( HouseQuest.WindhelmHouseVar >= 1 )
		if( MS11.GetStageDone(100) == 1 || MS11.GetStageDone(250) == 1 )
			if( WindhelmPlayerHouseDecorateBedroom.IsEnabled() )
				WindhelmPlayerHouseDecorateBasic.Disable()
			EndIf
		EndIf
	EndIf
	
	;Bug #12230 - Courier fails to show up after Innocence Lost
	DB.UnregisterForUpdate()
	if( DBForever.GetStage() < 10 && DBDestroy.GetStageDone(200) == 0 )
		DB.RegisterForSingleUpdate(5)
	EndIf
	
	;dunNchuandZelQst does not stop once completed.
	if( dunNchuandZelQst.GetStage() >= 100 )
		dunNchuandZelQst.Stop()
	EndIf
	
	;Speaking to Brynjolf before Maul could get the objective stuck in the journal.
	if( TG00.GetStageDone(5) == 1 || TG00.GetStageDone(8) == 1 )
		if( TG00MaulHandler.GetStage() == 10 )
			TG00MaulHandler.SetStage(200)
		EndIf
	EndIf
	
	;Resolve FreeformIvarstead02 if it's stuck because the necklace was picked up out of order.
	if( FreeformIvarstead02.IsRunning() )
		if( FreeformIvarstead02.GetStage() == 20 || FreeformIvarstead02.GetStage() == 30 )
			if( PlayerRef.GetItemCount(Necklace.GetReference()) > 0 )
				FreeformIvarstead02.SetStage(40)
			EndIf
		endif
	EndIf
	
	;dunAngarvundeQST never stops when completed.
	if( dunAngarvundeQST.Getstage() == 255 )
		dunAngarvundeQST.stop()
	EndIf
	
	;Civil War quests do not stop after the war is over.
	if( CWFinale.GetStageDone(500) == 1 )
		CWObj.Stop()
		CW.Stop()
	EndIf
	
	debug.trace( "USKP 1.3.2 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 132
	Retro133.Process()
	Stop()
EndFunction
