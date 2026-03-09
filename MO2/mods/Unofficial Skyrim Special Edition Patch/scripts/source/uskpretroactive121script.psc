Scriptname USKPRetroactive121Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive122Script Property Retro122 Auto

Actor Property Player Auto

Quest Property FreeformRiften07 Auto
Ingredient Property Teeth Auto

Quest Property MS11 Auto
Quest Property MS11Pre Auto
ObjectReference Property WindhelmHjerimPlayerChestEnable Auto
DB03Script Property DB03 Auto
Actor Property Tova Auto
Actor Property Arivanya Auto
Actor Property Viola Auto
AchievementsScript Property AchievementsQuest  Auto
Armor Property StrangeAmulet Auto
Armor Property NecroAmulet Auto
ObjectReference Property ArivanyaHome Auto
ObjectReference Property ViolaHome Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.1 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 121
		Retro122.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #3687 - "Ice Cold" (FreeformRiften07) recycles itself because the inventory event filter was not properly removed before trying to close it.
	if( FreeformRiften07.GetStageDone(200) == 1 )
		Player.RemoveInventoryEventFilter(Teeth)
		FreeformRiften07.CompleteAllObjectives()
		FreeformRiften07.Stop()
	EndIf
	
	;Bugzilla #4070 - "Blood on the Ice" (MS11) never enables the chest unless Wuunferth is arrested.
	;Also fixes a separate issue where the quest doesn't count toward the "Sideways" Steam achievement.
	if( MS11.GetStageDone(250) == 1 )
		WindhelmHjerimPlayerChestEnable.Enable()
		AchievementsQuest.IncSideQuests()
	EndIf
	
	;If MS11 hasn't started, resurrect Arivanya and Viola if they are dead since they're required to advance the quest.
	if( MS11.GetStage() < 10 )
		if( Arivanya.IsDead() )
			Arivanya.Resurrect()
			Arivanya.MoveTo(ArivanyaHome)
		EndIf
		
		if( Viola.IsDead() )
			Viola.Resurrect()
			Viola.MoveTo(ViolaHome)
		EndIf
		Utility.Wait(3)
		
		;Yep, ever so slightly risky but it appears the only way to force the aliases to refill properly.
		MS11Pre.Stop()
		Utility.Wait(1)
		MS11Pre.Start()
	EndIf
	
	;MS11 - Clear "Get Assistance from Jorleif" objective.
	if( MS11.GetStage() >= 100 )
		MS11.SetObjectiveCompleted(1)
	EndIf
	
	;MS11 - Swap out the Strange Amulet for the Necromancer's Amulet if the player is still carrying it.
	;Point of no return is when you talk to Wuunferth and get told to watch the Stone Quarter the next day.
	if( MS11.GetStageDone(120) == 1 && Player.GetItemCount(StrangeAmulet) > 0 )
		Player.RemoveItem(StrangeAmulet, 1)
		Player.AddItem(NecroAmulet, 1)
	endif
	
	debug.trace( "USKP 1.2.1 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 121
	Retro122.Process()
	Stop()
EndFunction
