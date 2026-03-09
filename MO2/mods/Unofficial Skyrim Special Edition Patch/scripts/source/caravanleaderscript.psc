ScriptName CaravanLeaderScript Extends ReferenceAlias  Conditional

Int Property CaravanNumber Auto
{0: Caravan A, 1: Caravan B, 2: Caravan C}

Event OnUpdateGameTime()

  Actor LeaderRef = GetActorReference()

  (GetOwningQuest() as CaravanScript).UpdateCaravan (CaravanNumber, LeaderRef, WeAreDisablingCamp = True)

EndEvent

Event OnDeath (Actor akKiller)
	
  (GetOwningQuest() as CaravanScript).UpdateAliases (CaravanNumber, 0)
	
EndEvent
