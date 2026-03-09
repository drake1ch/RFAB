Scriptname DLC1SeranaCureQuestScript extends Quest  


FormList Property FactionsToRemove  Auto  
FormList Property SpellsToRemove  Auto  
ReferenceAlias Property AliasToClear  Auto  

ReferenceAlias Property SeranaAlias auto

Race Property DLC1NordRace auto
TextureSet Property PrettyEyes auto

bool WaitingFor3D = False

Function Cure()
	Actor serana = SeranaAlias.GetActorReference()

	AliasToClear.Clear()
	; serana.SetRace(DLC1NordRace) ; whoops, can't do this on NPCs
	
	SetEyes()

	int count = 0
	while (count < FactionsToRemove.GetSize())
		Faction removed = FactionsToRemove.GetAt(count) as Faction
;		Debug.Trace("SERANA CURE QUEST: Factions removed: " + count + "; " + removed)
		serana.RemoveFromFaction(removed)
		count += 1
	endwhile

	count = 0
	while (count < SpellsToRemove.GetSize())
		Spell removed = SpellsToRemove.GetAt(count) as Spell
;		Debug.Trace("SERANA CURE QUEST: Spells removed: " + count + "; " + removed)
		serana.RemoveSpell(removed)
		count += 1
	endwhile

EndFunction


;UDGP 2.0.4 - Added thread blocker to keep this function from piling up multiple calls on the stack.
Function SetEyes()

	Actor Serana = SeranaAlias.GetActorReference()
	
	if (AliasToClear.GetReference() == None)
		;Debug.Trace("SERANA CURE QUEST: Setting eye texture.")
		if( !WaitingFor3D )
			WaitingFor3D = True
		Else
			Return
		EndIf
		While !Serana.Is3DLoaded()
			Utility.Wait (0.1)
		EndWhile
		Serana.SetEyeTexture(PrettyEyes)
		WaitingFor3D = False
	endif

EndFunction
