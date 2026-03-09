Scriptname DLC1VLCrimeScript extends Actor  

; When the player is a vampire lord, traditional crime reporting is turned off.
; Since most actors attack the player in this form, that is fine.
; However, the DLC1VampireCrimeFaction members do not.
; Unfortunately, this also means they don't react to being attacked

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	;UDGP 2.0.1 - Rewrote this block. It is clearly intended to invoke the penalty only for the player.
	;Previous block was trying to upcast an ObjectReference to an Actor, which is not possible.
	if( Attacker == Game.GetPlayer() )
		if( Game.GetPlayer().GetRace() == DLC1VampireBeastRace )
			DLC1VampireFaction.SetPlayerEnemy()
			StartCombat(Game.GetPlayer())
			DLC1VampireFaction.SetPlayerEnemy(false)
		EndIf
	endIf
EndEvent

Race Property DLC1VampireBeastRace  Auto  

Faction Property DLC1VampireFaction  Auto  
