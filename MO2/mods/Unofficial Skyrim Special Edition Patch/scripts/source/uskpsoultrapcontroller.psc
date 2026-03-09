Scriptname USKPSoulTrapController extends Quest
{USKP Soul Trap Controller Functions}
;Bottleneck controller to ensure actors only make one soul trap attempt at a time.
;Since we may be removing soul gems momentarily from their inventory, we must make
;sure those gems are returned before the next TrapSoul() attempt is processed.

;main tracking array & index:
Actor[] SoulTrappingActors
int TrappingActorIndex = 0


Event OnInit()
  SoulTrappingActors = new Actor[128]
EndEvent


Bool Function SecurePermission(Actor requestingActor)
  if SoulTrappingActors.find(requestingActor) >= 0
    if requestingActor != None
      return False ;actor is in the middle of another soul trap right now
    else
      return True ;bypass lock if requestingActor is NONE for some reason
    endif

  else ;add actor to array until this soul trap completes:
    SoulTrappingActors[TrappingActorIndex] = requestingActor
    TrappingActorIndex += 1
    return True
  endif
EndFunction



Function ReleasePermission(Actor releasingActor)
  int releaseIndex = SoulTrappingActors.find(releasingActor)
  if releaseIndex >= 0
    SoulTrappingActors[releaseIndex] = None
    TrappingActorIndex -= 1
    SoulTrappingActors[releaseIndex] = SoulTrappingActors[TrappingActorIndex]
	SoulTrappingActors[TrappingActorIndex] = None
  endif
EndFunction 