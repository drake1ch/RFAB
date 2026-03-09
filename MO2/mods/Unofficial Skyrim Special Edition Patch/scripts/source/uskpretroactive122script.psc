Scriptname USKPRetroactive122Script extends Quest  

Quest Property MQ101 Auto
Actor Property Player Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive123Script Property Retro123 Auto

Quest Property DA08 Auto
ReferenceAlias Property Jora Auto
ReferenceAlias Property Lortheim Auto
ReferenceAlias Property Viola Auto
ReferenceAlias Property OlfinaAlias Auto
ReferenceAlias Property Mikael Auto
ReferenceAlias Property Hulda  Auto
ReferenceAlias Property DialogueWhiterunInnkeeper  Auto
ReferenceAlias Property DialogueWhiterunInnkeeperBackup  Auto
ReferenceAlias Property BrillAlias Auto
ReferenceAlias Property WHSteward Auto
ReferenceAlias Property Ysolda Auto
ReferenceAlias Property WHPawnshop Auto
ReferenceAlias Property Caius Auto
ReferenceAlias Property GuardAlias Auto
ReferenceAlias Property Ahlam Auto
ReferenceAlias Property DialogueSolitudeTailor  Auto
ReferenceAlias Property Endarie  Auto
ReferenceAlias Property VittoriaVici  Auto
ReferenceAlias Property AquilliusAeresius  Auto
ReferenceAlias Property DialogueSolitudeEastEmpire Auto
ReferenceAlias Property DialogueSolitudeEastEmpireBackup  Auto
ReferenceAlias Property Faida  Auto
ReferenceAlias Property JulienneLylvieve  Auto
ReferenceAlias Property MichelLylvieve  Auto
ReferenceAlias Property DialogueDragonBridgeTavernkeeper  Auto
ReferenceAlias Property DialogueDragonBridgeTavernkeeperBackup  Auto
ReferenceAlias Property Alias_Narri  Auto
ReferenceAlias Property ValgaVinicia  Auto
ReferenceAlias Property DialogueFalkreathInnkeeper  Auto
ReferenceAlias Property DialogueFalkreathInnkeeperBackup  Auto
ReferenceAlias Property SybilleStentor  Auto
ReferenceAlias Property DialogueSolitudeCourtWizard  Auto
ReferenceAlias Property Melaran  Auto
ReferenceAlias Property Shadr  Auto
ReferenceAlias Property Hofgrir  Auto
ReferenceAlias Property DialogueRiftenHostler Auto
ReferenceAlias Property DialogueRiftenTavernkeeper Auto
ReferenceAlias Property Vekel  Auto
ReferenceAlias Property Dirge  Auto
ReferenceAlias Property Alias_Nelkir  Auto
ReferenceAlias Property Alias_Dagny  Auto
ReferenceAlias Property Alias_Frothar  Auto
ReferenceAlias Property Alias_ExiledImperialMarker Auto
Faction Property WindhelmViolaFaction Auto
Faction Property ServicesWhiterunBanneredMare Auto
Faction Property WhiterunBelethorsGoodsFaction Auto
Faction Property WhiterunArcadiasCauldronFaction Auto
Faction Property TownDragonBridgeFaction  Auto
Faction Property CrimeFactionHaafingar  Auto
Faction Property ServicesFalkreathDeadMansDrinkInn  Auto
Faction Property GovExiled  Auto
Faction Property GovRuling  Auto
Faction Property GovImperial  Auto
Location Property WhiterunHoldLocation  Auto
Keyword Property CWOwner  Auto

GlobalVariable Property PlayerIsWerewolf auto
Quest Property PlayerWerewolfCureQuest Auto

Quest Property C03PostQuest Auto
Quest Property C04 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.2 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 122
		Retro123.Process()
		Stop()
		Return
	EndIf
	
	;Various fixes to correct the backup ownership mess in Whiterun and elsewhere
	OlfinaAlias.TryToRemoveFromFaction(ServicesWhiterunBanneredMare)
	
	Mikael.TryToAddToFaction(ServicesWhiterunBanneredMare)
	DialogueWhiterunInnkeeperBackup.ForceRefTo(Mikael.GetReference())
	if(Hulda.GetActorReference().IsDead())
		DialogueWhiterunInnkeeper.ForceRefTo(Mikael.GetActorReference())
		Mikael.TryToEvaluatePackage()
	endif
	
	WHSteward.ForceRefTo(BrillAlias.GetReference())
	WHPawnshop.ForceRefTo(Ysolda.GetReference())
	Ysolda.TryToAddToFaction(WhiterunBelethorsGoodsFaction)
	Ahlam.TryToAddToFaction(WhiterunArcadiasCauldronFaction)
	if (WhiterunHoldLocation.GetKeywordData(CWOwner) == 1)
		GuardAlias.ForceRefTo(Caius.GetReference())
	endif

	Jora.TryToRemoveFromFaction(WindhelmViolaFaction)
	Lortheim.TryToRemoveFromFaction(WindhelmViolaFaction)
	Viola.TryToAddToFaction(WindhelmViolaFaction)
	if !(Endarie.GetActorReference().IsDead())
		DialogueSolitudeTailor.ForceRefTo(Endarie.GetActorReference())
	endif
	
	Actor Aquillius = AquilliusAeresius.GetActorReference()
	(DialogueSolitudeEastEmpire as SwapAliasOnDeath).BackupAlias = DialogueSolitudeEastEmpireBackup
	if (VittoriaVici.GetActorReference().IsDead())
		DialogueSolitudeEastEmpire.ForceRefTo(Aquillius)
		Aquillius.EvaluatePackage()
	endif
	DialogueSolitudeEastEmpireBackup.ForceRefTo(Aquillius)
	
	Actor Julienne = JulienneLylvieve.GetActorReference()
	Julienne.AddToFaction(TownDragonBridgeFaction)
	Julienne.AddToFaction(CrimeFactionHaafingar)
	Julienne.SetCrimeFaction(CrimeFactionHaafingar)
	if(Faida.GetActorReference().IsDead())
		DialogueDragonBridgeTavernkeeper.ForceRefTo(Julienne)
		Julienne.EvaluatePackage()
	endif
	DialogueDragonBridgeTavernkeeperBackup.ForceRefTo(Julienne)
	MichelLylvieve.GetActorReference().SetCrimeFaction(CrimeFactionHaafingar)
	
	Actor Narri = Alias_Narri.GetActorReference()
	Narri.AddToFaction(ServicesFalkreathDeadMansDrinkInn)
	if(ValgaVinicia.GetActorReference().IsDead())
		DialogueFalkreathInnkeeper.ForceRefTo(Narri)
		Narri.EvaluatePackage()
	endif
	DialogueFalkreathInnkeeperBackup.ForceRefTo(Narri)

	if (SybilleStentor.GetActorReference().IsDead())
		DialogueSolitudeCourtWizard.ForceRefTo(Melaran.GetActorReference())
	endif

	if (Hofgrir.GetActorReference().IsDead())
		DialogueRiftenHostler.ForceRefTo(Shadr.GetActorReference())
	endif

	if (Vekel.GetActorReference().IsDead()) ;Vekel is permanently essential, but what the hell.
		DialogueRiftenTavernkeeper.ForceRefTo(Dirge.GetActorReference())
	endif

	;Bugzilla #4715 - Player lycanthropy global variable is never unset when cured
	if( PlayerWerewolfCureQuest.GetStageDone(100) == 1 )
		PlayerIsWerewolf.SetValueInt(0)
	EndIf
	
	;Bugzilla #303 - Blood's Honor fails to start due to potential alias conflict with C00.
	if( C03PostQuest.GetStageDone(200) == 1 && C04.GetStageDone(1) == 0 )
		C04.Start()
	EndIf
	
	;Clean up the big mess that Bethesda left behind when DA08 had most of its content cut.
	if( DA08.GetStage() == 80 ) ;Player finished what's left of the quest and restored the blade.
		DA08.Stop()
	endif

	Actor Nelkir = Alias_Nelkir.GetActorReference()
	Actor Frothar = Alias_Frothar.GetActorReference()
	Actor Dagny = Alias_Dagny.GetActorReference()
	Nelkir.AddToFaction(GovImperial)
	Nelkir.AddToFaction(GovRuling)
	Frothar.AddToFaction(GovImperial)
	Frothar.AddToFaction(GovRuling)
	Dagny.AddToFaction(GovImperial)
	Dagny.AddToFaction(GovRuling)

	if( WhiterunHoldLocation.GetKeywordData(CWOwner) == 2 )
		ObjectReference ExiledImperialMarker = Alias_ExiledImperialMarker.GetReference()
		Nelkir.RemoveFromFaction(GovRuling)
		Nelkir.AddToFaction(GovExiled)
		Frothar.RemoveFromFaction(GovRuling)
		Frothar.AddToFaction(GovExiled)
		Dagny.RemoveFromFaction(GovRuling)
		Dagny.AddToFaction(GovExiled)
		Nelkir.SetRelationshipRank(Player, -2)
		Frothar.SetRelationshipRank(Player, -2)
		Dagny.SetRelationshipRank(Player, -2)
		Nelkir.MoveTo(ExiledImperialMarker)
		Frothar.MoveTo(ExiledImperialMarker)
		Dagny.MoveTo(ExiledImperialMarker)
	endif

	debug.trace( "USKP 1.2.2 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 122
	Retro123.Process()
	Stop()
EndFunction
