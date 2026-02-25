Scriptname RFAB_Madness_IncreaseStats extends ActiveMagicEffect  

float property physDamageModifier auto
float property magicAVModifier auto

bool running = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if running 
		return
	endif
	running = true
	akTarget.modav("attackDamageMult", physDamageModifier )
	akTarget.modav("Alteration", magicAVModifier )
	akTarget.modav("Conjuration", magicAVModifier )
	akTarget.modav("Destruction", magicAVModifier )
	akTarget.modav("Illusion", magicAVModifier )
	akTarget.modav("Restoration", magicAVModifier )
	
endevent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.modav("attackDamageMult", -physDamageModifier )
	akTarget.modav("Alteration", -magicAVModifier )
	akTarget.modav("Conjuration", -magicAVModifier )
	akTarget.modav("Destruction", -magicAVModifier )
	akTarget.modav("Illusion", -magicAVModifier )
	akTarget.modav("Restoration", -magicAVModifier )
	running = false
endevent