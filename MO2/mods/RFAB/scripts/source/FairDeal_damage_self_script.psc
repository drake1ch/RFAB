Scriptname FairDeal_damage_self_script extends ActiveMagicEffect  
SPELL Property REQ_Blessing_Boethiah  Auto  

float currenthp
Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (akCaster.Hasspell(REQ_Blessing_Boethiah))
 	currenthp = akCaster.GetActorValue("Health")
	akCaster.DamageActorValue("Health", currenthp/2)
else
	debug.Notification("Боэтия не принимает вашу жертву...")
endif
endEvent
