Scriptname RFAB_ForswornShamanAuraScript extends ActiveMagicEffect  


SPELL Property HealSpell  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

while !akTarget.isdead()
	utility.wait(1)
	HealSpell  .Cast(akTarget,akTarget)
endwhile

endevent

