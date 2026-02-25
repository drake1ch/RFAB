Scriptname SPFireSunBurn extends ActiveMagicEffect  

Spell Property Burn Auto
Keyword property MDF Auto
Keyword property MDSun Auto
Activator Property Box Auto
Int Check = 0 
Actor Target 

Event OnEffectStart(Actor akTarget, Actor akCaster)
  target = aktarget
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	if aksource.haskeyword(MDF) && !aksource.haskeyword(MDSun) && Check == 0
		Objectreference Crate = target.placeatme(Box)
		Burn.cast(crate, target)
		Check = 1
		registerforsingleupdate(0.5)
	endif
EndEvent

Event OnUpdate() ; This event occurs every five seconds		
	Check = 0
EndEvent