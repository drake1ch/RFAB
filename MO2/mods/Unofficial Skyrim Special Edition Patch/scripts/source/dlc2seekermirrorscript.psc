Scriptname DLC2SeekerMirrorScript extends Actor  

ActorBase Property DLC2EncSeekerMirror  Auto

Actor Mirror1
Actor Mirror2
Actor Mirror3
bool Mirrored
Int Property MirrorCount  Auto  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetActorValuePercentage("health") <= 0.5 && GetActorValue("health") > 0 && Mirrored == false
		Mirror1 = PlaceActorAtMe(DLC2EncSeekerMirror)
		if MirrorCount > 1
			Mirror2 = PlaceActorAtMe(DLC2EncSeekerMirror)
			if MirrorCount > 2
				Mirror3 = PlaceActorAtMe(DLC2EncSeekerMirror)
			endif
		endif
		Mirrored = true
	endif
EndEvent

Event OnDying(Actor akKiller)
	;UDBP 1.0.4 added sanity checking to these kill commands since not all mirrors will be generated
	if( Mirror1 != None )
		Mirror1.kill()
	EndIf
	
	if( Mirror2 != None )
		Mirror2.kill()
	EndIf
	
	if( Mirror3 != None )
		Mirror3.kill()
	EndIf
EndEvent
