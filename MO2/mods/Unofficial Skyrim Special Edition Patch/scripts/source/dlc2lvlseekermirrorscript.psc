Scriptname DLC2LvlSeekerMirrorScript extends Actor  

SPELL Property DLC2Seeker01RightHandSpell  Auto  
SPELL Property DLC2Seeker02RightHandSpell  Auto  
SPELL Property DLC2Seeker03RightHandSpell  Auto  

ActorBase Property DLC2EncSeeker01Mirror  Auto
ActorBase Property DLC2EncSeeker02Mirror  Auto
ActorBase Property DLC2EncSeeker03Mirror  Auto

ActorBase MirrorBase
Actor Mirror1
Actor Mirror2
Actor Mirror3
bool Mirrored

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (GetActorValuePercentage ("health") <= 0.5) && (GetActorValue ("health") > 0) && (Mirrored == False)

		;UDBP 1.0.5 - More sanity checking added since most seekers don't have all of these set.
		If DLC2Seeker01RightHandSpell
			If (HasSpell (DLC2Seeker01RightHandSpell) == True)
				MirrorBase = DLC2EncSeeker01Mirror
			EndIf
		ElseIf DLC2Seeker02RightHandSpell
			If (HasSpell (DLC2Seeker02RightHandSpell) == True)
				MirrorBase = DLC2EncSeeker02Mirror
			EndIf
		ElseIf DLC2Seeker03RightHandSpell
			If (HasSpell (DLC2Seeker03RightHandSpell) == True)
				MirrorBase = DLC2EncSeeker03Mirror
			EndIf
		EndIf

		If MirrorBase
		
			Mirror1 = PlaceActorAtMe (MirrorBase)
		
			If DLC2Seeker02RightHandSpell
				If (HasSpell (DLC2Seeker02RightHandSpell) == True)
					Mirror2 = PlaceActorAtMe (MirrorBase)
				EndIf
			ElseIf DLC2Seeker03RightHandSpell
				If (HasSpell (DLC2Seeker03RightHandSpell) == True)
					Mirror2 = PlaceActorAtMe (MirrorBase)
					Mirror3 = PlaceActorAtMe (MirrorBase)
				EndIf
			EndIf

			Mirrored = True

		EndIf

	EndIf

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

