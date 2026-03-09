Scriptname C03QuestScript extends CompanionsStoryQuest conditional

Quest Property C02PostQuest auto
Quest Property C03PostQuest auto

ObjectReference Property SilverHandEnableMarker auto
bool Property PlayerGotReward auto conditional
bool Property AelaGreetPostTransform auto conditional
bool Property AelaShouldForceGreet auto conditional

ReferenceAlias Property Aela auto
ReferenceAlias Property Skjor auto
ReferenceAlias Property EssentialSkjor auto
ReferenceAlias Property Krev auto

Weapon Property SwordReward auto
Weapon Property DaggerReward auto
Weapon Property BattleaxeReward auto
Weapon Property GreatswordReward auto
Weapon Property WarhammerReward auto
Weapon Property WaraxeReward auto
Weapon Property MaceReward auto

bool Property SkjorOfferingTransform auto conditional
bool Property CheckedInWithAela = false auto
bool Property TransformedRecently = true auto conditional

ReferenceAlias Property DebugFollower auto ; on remote quest

Function Init()
	C02PostQuest.Stop()
	DebugFollower.ForceRefTo(Aela.GetReference())
	parent.Init()
EndFunction

Function PoorSkjor()
	EssentialSkjor.Clear()
	Actor s = Skjor.GetActorReference()
	Actor k = Krev.GetActorReference()
	s.MoveTo(k)
	s.Kill(k)
	;USKP 2.0.6 - You killed Skjor, but didn't immediately cycle the radiants. Shit breaks if you don't.
	(CentralQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
EndFunction

Function Teardown()
	;(CentralQuest as CompanionsHousekeepingScript).GallowsRock.Clear() ;USKP 2.1.0 - Don't clear this reservation. Keeps radiants out.
	(CentralQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
	C03PostQuest.Start()
	DebugFollower.Clear()
	parent.Teardown()
EndFunction
