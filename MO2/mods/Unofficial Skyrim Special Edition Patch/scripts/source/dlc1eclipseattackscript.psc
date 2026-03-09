Scriptname DLC1EclipseAttackScript extends Quest  

DLC1RadiantScript Property DLC1Radiant  Auto  

ReferenceAlias[] Property SpawnPointAliases auto
ReferenceAlias[] Property AttackerAliases auto

GlobalVariable property GameDaysPassed auto
GlobalVariable property DLC1EclipseAttackNextWait auto  ;next allowed is today + This
GlobalVariable property DLC1EclipseAttackNextAllowed auto ;today + NextWait

GlobalVariable property DLC1EclipseAttackNextChanceEclipse auto ;starts at 100, then drops to 25
GlobalVariable property DLC1EclipseAttackNextChanceNight auto ;starts at 100, then drops to 5

GlobalVariable property DLC1EclipseAttackNextGauranteed auto ;next time we should make sure this happens - today + NextMaxWait
GlobalVariable property DLC1EclipseAttackNextMaxWait auto ;today + this

GlobalVariable Property DLC1EclipseActive auto

Quest Property DLC1VQ01MiscObjective auto

GlobalVariable Property DLC1EclipseAttackGuardHellos  Auto  
{global to turn on guard hellos}

Function MoveAndEnableAttackersToFathestSpawnPointAlias()
	;UDGP 2.0.4 - Trying to deal with quests that can be severely disrupted or completely broken by a vampire attack.
	ObjectReference FarthestRefFromPlayer = GetFarthestAliasFromPlayer()
	Location AttackLoc = FarthestRefFromPlayer.GetEditorLocation()
	Location WindhelmLocation = Game.GetFormFromFile( 0x00018A57, "Skyrim.esm" ) as Location
	Location SolitudeLocation = Game.GetFormFromFile( 0x00018A5A, "Skyrim.esm" ) as Location
	Location MarkarthLocation = Game.GetFormFromFile( 0x00018A59, "Skyrim.esm" ) as Location
	Quest MS05 = Game.GetFormFromFile( 0x00053511, "Skyrim.esm" ) as Quest
	Quest MS11 = Game.GetFormFromFile( 0x0001F7A3, "Skyrim.esm" ) as Quest
	Quest DB01 = Game.GetFormFromFile( 0x0001EA50, "Skyrim.esm" ) as Quest
	Quest MS01 = Game.GetFormFromFile( 0x00018B4B, "Skyrim.esm" ) as Quest
	Quest MS02 = Game.GetFormFromFile( 0x00040a5e, "Skyrim.esm" ) as Quest
	Quest SolitudeOpening = Game.GetFormFromFile( 0x000B2FD9, "Skyrim.esm" ) as Quest

	bool StopQuest = False
	
	if( AttackLoc == WindhelmLocation )
		if( MS11.IsRunning() || (DB01.IsRunning() && DB01.GetStage() < 20) )
			StopQuest = True
		EndIf
	ElseIf( AttackLoc == SolitudeLocation )
		if( SolitudeOpening.GetStage() < 20 )
			StopQuest = True
		EndIf
		if( MS05.GetStage() >= 150 && MS05.Getstage() < 300 )
			StopQuest = true
		endif
	ElseIf( AttackLoc == MarkarthLocation )
		if( MS01.IsRunning() )
			StopQuest = True
		EndIf
		if( MS02.IsRunning() )
			StopQuest = True
		EndIf
	EndIf
	
	if( StopQuest )
		Stop()
		Return
	EndIf	
	
	;Debug.Trace(self + "MoveAndEnableAttackersToFathestSpawnPointAlias()")
	MoveAliasesToRef(FarthestRefFromPlayer)
EndFunction

objectReference Function GetFarthestAliasFromPlayer()
	int index = 0

	float farthestDistance
	ObjectReference farthestRef

	ObjectReference PlayerRef = Game.GetPlayer()

	while (index < SpawnPointAliases.Length)
		
		if SpawnPointAliases[index]
			ObjectReference currentRef = SpawnPointAliases[index].GetReference()
			if( currentRef != None ) ; Check to validate NONE objects added by UDGP 1.1.4
				float distance = currentRef.GetDistance(PlayerRef)

				if distance > farthestDistance
					farthestDistance = distance
					farthestRef = currentRef
				endif
			Else
				;debug.trace( "Spawn alias in slot " + index + " is a NONE object." )
			EndIf
		endif
		index += 1
	endwhile

	RETURN farthestRef

EndFunction

Function MoveAliasesToRef(ObjectReference RefToMoveTo)
	;Debug.Trace(self + "MoveAliasesToRef() AttackerAliases.Length == " + AttackerAliases.Length)
	int index = 0
		while (index < AttackerAliases.Length)
			;Debug.Trace(self + "MoveAliasesToRef() index: " + index + ", alias: " + AttackerAliases[index] + ", reference: " + AttackerAliases[index].GetReference())
			AttackerAliases[index].TryToMoveTo(RefToMoveTo)
			AttackerAliases[index].TryToEnable()
			index += 1
		endwhile	

EndFunction

function SetControllingGlobals()
	SetNextAllowed()
	SetNextChance()
	SetNextGauranteed()
EndFunction

Function SetNextAllowed()
	DLC1EclipseAttackNextAllowed.SetValue(GameDaysPassed.GetValue() + DLC1EclipseAttackNextWait.GetValue())
EndFunction

Function SetNextChance()


	int NewChance

	if DLC1EclipseActive.GetValue() == 1
		NewChance = 25 ;starts game at 100
		DLC1EclipseAttackNextChanceEclipse.SetValue(NewChance)

	Else ;not an eclipse - just happening because its nighttime
		NewChance = 5; starts game at 100
		DLC1EclipseAttackNextChanceNight.SetValue(NewChance)

	endIf

EndFunction


Function SetNextGauranteed()
	DLC1EclipseAttackNextGauranteed.SetValue(GameDaysPassed.GetValue() + DLC1EclipseAttackNextMaxWait.GetValue())
		
EndFunction
