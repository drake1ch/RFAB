Scriptname DLC2MH01QuestScript extends Quest conditional


bool Property BujoldFGPostCommune auto conditional
bool Property PlayerEnteredCamp auto conditional
bool Property PlayerOutsideBarrow auto conditional

ReferenceAlias[] Property DemRieklings auto

GlobalVariable Property RieklingsAlive auto
GlobalVariable Property RieklingsKilled auto

Actor Property RieklingChief auto
ActorBase Property RieklingMinion auto

ObjectReference Property RieklingClutterEnabler auto
ObjectReference Property NordClutterEnabler auto

ObjectReference Property CampInhabited auto
ObjectReference Property CampAbandoned auto


Function RieklingKilled()
	RieklingsAlive.SetValue( RieklingsAlive.Value - 1 ) ;USSEP 4.1.5 Bug #23415 - The -= and += methods don't work for globals. Same issue as with word wall triggers.
	ModObjectiveGlobal(1, RieklingsKilled, 21)

	if (RieklingsAlive.Value <= 0)	
		SetStage(25)
	endif
EndFunction


Function SpawnRieklings()
	; RieklingChief.PlaceAtMe(RieklingMinion, 8)
EndFunction


Function CleanupRieklings()
	RieklingClutterEnabler.Disable()
	NordClutterEnabler.Enable()

	int count = 0
	while (count < DemRieklings.length - 1) ;UDBP 2.0.1 - Syntax error, needs to check length -1 to avoid going out of bounds.
		DemRieklings[count].GetReference().Delete()
		count += 1
	endwhile

	; not related to Rieklings, but this is as good a place as any...
	CampInhabited.Disable()
	;CampAbandoned.Enable() - UDBP 2.0.1: This marker is opposite parented, it will enable without this.
EndFunction
