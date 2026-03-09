Scriptname MS11InsideHjerim extends ObjectReference  

Quest Property ms11 Auto
ReferenceAlias Property Viola Auto
ReferenceAlias Property Calixto Auto
MS11QuestScript Property MS11Script Auto
ReferenceAlias Property Witness1 Auto
ReferenceAlias Property Witness2 Auto
ReferenceAlias Property Witness3 Auto

bool FirstEntry = false
bool EntryWithViola = false

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		; The first time the player enters, we set the stage to tell him to investigate
		if ( (ms11.IsRunning()) && (FirstEntry == False) )
			;USKP 2.0.4 - Clear up the witness aliases and move the body.
			if( ms11.GetStage() < 40 )
				Witness1.Clear()
				Witness2.Clear()
				Witness3.Clear() 
				
				MS11Script.MoveBody()
			EndIf

			;USKP 2.0.4 - If you broke in and read a flyer/grabbed the amulet, don't trigger stage 60. You're past that.
			if( ms11.GetStage() < 70 )
				ms11.SetStage(60)
			EndIf
			FirstEntry = True
		endif
		
		; If the player enters while investigating with Viola, we teleport her there
		if ( (ms11.GetStage()) == 80 && (EntryWithViola == False) )
			Viola.GetReference().MoveTo(Game.GetPlayer())
			EntryWithViola = True
		endif

		; final entrance for the exciting climax
		if ( (ms11.GetStage() == 130))
			Calixto.GetActorReference().StartCombat(Game.GetPlayer())
		endif
	endif
EndEvent
