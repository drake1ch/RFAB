ScriptName USKP_CaravanFollowerScript Extends ReferenceAlias Conditional

Int Property CaravanNumber Auto
{0: Caravan A, 1: Caravan B, 2: Caravan C}

Int Property MemberIndex Auto
{0: Leader, 1: Follower 1, 2: Follower 2, 3: Follower 3}

Event OnDeath (Actor akKiller)
	
  (GetOwningQuest() as CaravanScript).UpdateAliases (CaravanNumber, MemberIndex)
	
EndEvent
