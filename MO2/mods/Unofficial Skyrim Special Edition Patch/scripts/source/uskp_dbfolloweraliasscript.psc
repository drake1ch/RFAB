ScriptName USKP_DBFollowerAliasScript Extends ReferenceAlias
{Script for keeping track of DB Followers so they'll go home if left waiting too long.}

DarkBrotherhood Property DBScript Auto
GlobalVariable Property PlayerFollowerCount Auto
Message Property FollowerDismissMessageWait Auto
int TeamInt ; 1 = Cicero, 2 = Male Initiate, 3 = Female Initiate

Function StartWaiting( int FollowerInt )
	TeamInt = FollowerInt
	Self.RegisterForUpdateGameTime(72)
EndFunction

Function StopWaiting()
	Self.UnregisterForUpdateGameTime()
EndFunction

Event OnUpdateGameTime()
	Self.UnregisterForUpdateGameTime()

	Self.GetActorReference().SetPlayerTeammate(False)
	PlayerFollowerCount.SetValue(0)
	
	if( TeamInt == 1 )
		DBScript.CiceroFollower = 0
		DBScript.CiceroState = 1
	elseif( TeamInt == 2 )
		DBScript.Initiate1Follower = 0
		DBScript.Initiate1State = 1
	elseif( TeamInt == 3 )
		DBScript.Initiate2Follower = 0
		DBScript.Initiate2State = 1
	EndIf
	
	FollowerDismissMessageWait.Show()
	Self.GetActorReference().EvaluatePackage()
EndEvent

Event OnDeath(Actor akKiller)
	Self.UnregisterForUpdateGameTime()

	if( (TeamInt == 1 && DBScript.CiceroFollower == 1) || (TeamInt == 2 && DBScript.Initiate1Follower == 1) || (TeamInt == 3 && DBScript.Initiate2Follower == 1) )
		PlayerFollowerCount.SetValue(0)
	EndIf
EndEvent
