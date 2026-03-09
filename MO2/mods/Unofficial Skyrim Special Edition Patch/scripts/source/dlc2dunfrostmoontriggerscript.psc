ScriptName DLC2dunFrostmoonTriggerScript extends ObjectReference
{Script on the trigger around Frostmoon Crag. Manages Rakel's warnings and the camp's aggression.}

Quest property DLC2dunFrostmoonQST Auto
Scene property DLC2dunFrostmoonQST_RakelWarning1 Auto
Scene property DLC2dunFrostmoonQST_RakelWarning2 Auto
Scene property DLC2dunFrostmoonQST_RakelWarning3 Auto
Spell property WerewolfChange Auto
ReferenceAlias property Alias_Majni Auto
ReferenceAlias property Alias_Akar Auto
ReferenceAlias property Alias_Hjordis Auto
ReferenceAlias property Alias_Rakel Auto
Actor Rakel
float EntryTimestamp
float ExitTimestamp

Event OnTriggerEnter(ObjectReference triggerRef)
	if (Rakel == None)
		Rakel = Alias_Rakel.GetActorReference()
	EndIf
	if (triggerRef == Game.GetPlayer() && Rakel != None)
		UnregisterForUpdate()
		if (Rakel.IsDead())
			;Omit the first warning entirely.
			Rakel.SetAV("Variable06", 3)
		ElseIf (Rakel.GetAV("Variable06") == 0)
			;First time.
			Rakel.SetAV("Variable06", 2)
		ElseIf (Rakel.GetAV("Variable06") == 1)
			;Subsequent times.
			if (Game.GetPlayer().HasSpell(WerewolfChange))
				Rakel.SetAV("Variable06", 2)
			Else
				Rakel.SetAV("Variable06", 3)
			EndIf
			DLC2dunFrostmoonQST_RakelWarning1.Start()
		EndIf
		Rakel.EvaluatePackage()
		EntryTimestamp = Utility.GetCurrentGameTime()
	EndIf
EndEvent

Event OnTrigger(ObjectReference triggerRef)
	if (triggerRef == Game.GetPlayer() && !Game.GetPlayer().HasSpell(WerewolfChange) && EntryTimestamp > 0 && !DLC2dunFrostmoonQST.GetStageDone(1))
; 		;Debug.Trace("Passed. Time differential:  " + (Utility.GetCurrentGameTime() - EntryTimeStamp) + ", " + Rakel.GetAV("Variable06"))
		if ((Utility.GetCurrentGameTime() > 0.003 + EntryTimeStamp) && Rakel.GetAV("Variable06") == 3)
			;Second warning.
			DLC2dunFrostmoonQST_RakelWarning2.Start()
		ElseIf ((Utility.GetCurrentGameTime() > 0.006 + EntryTimeStamp) && Rakel.GetAV("Variable06") == 4)
			;Third warning.
			DLC2dunFrostmoonQST_RakelWarning3.Start()
		ElseIf ((Utility.GetCurrentGameTime() > 0.009 + EntryTimeStamp) && Rakel.GetAV("Variable06") == 5)
			;Start combat.
			Rakel.SetAV("Variable06", 10)
			DLC2dunFrostmoonQST.SetStage(20)
		EndIf
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference triggerRef)
	RegisterForSingleUpdate(10)
EndEvent

Event OnUpdate()
; 	Debug.Trace("Reset")
	;UDBP 2.0.1 - Added None check here because it's possible to get to this point without the property being filled yet.
	if (Rakel == None)
		Rakel = Alias_Rakel.GetActorReference()
	EndIf
	
	;UDBP 2.0.7 - If it's still empty, it's possible Stage 200 has been hit and these aliases are no good now.
	if( Rakel != None )
		Rakel.SetAV("Variable06", 1)
		Rakel.EvaluatePackage()
	EndIf
	EntryTimestamp = 0
EndEvent
