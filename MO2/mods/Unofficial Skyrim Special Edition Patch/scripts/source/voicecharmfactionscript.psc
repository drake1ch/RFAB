Scriptname VoiceCharmFactionScript extends ActiveMagicEffect  

Faction Property CharmFaction Auto
bool Property bMakePlayerTeammate = false Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(CharmFaction)
	akCaster.StopCombat()
	akTarget.StopCombat()
	if bMakePlayerTeammate
		akTarget.SetPlayerTeammate(true, false)
	endif
	
	;USLEEP 3.0.13 Bug #21554
	Quest FollowerQuest = Game.GetFormFromFile( 0x000750ba, "Skyrim.esm" ) as Quest
	ReferenceAlias Follower = FollowerQuest.GetAlias(0) as ReferenceAlias
	ReferenceAlias AnimalFollower = FollowerQuest.GetAlias(1) as ReferenceAlias
	
	if( Follower.GetReference() != None )
		Follower.GetActorReference().StopCombat()
	endif
	if( AnimalFollower.GetReference() != None )
		AnimalFollower.GetActorReference().StopCombat()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(CharmFaction)
	if bMakePlayerTeammate
		akTarget.SetPlayerTeammate(false, false)
	endif
EndEvent