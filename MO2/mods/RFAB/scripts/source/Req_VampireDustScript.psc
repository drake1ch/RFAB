Scriptname Req_VampireDustScript extends activemagiceffect  

SPELL Property DiseaseSanguinareVampiris  Auto  
MagicEffect Property DisDamageHealthVampire Auto



Event OnEffectStart(Actor Target, Actor Caster)
	while Target.GetActorValue("DiseaseResist") < 100 && !Target.HasMagicEffect(DisDamageHealthVampire)
		Target.AddSpell(DiseaseSanguinareVampiris, false)
	endwhile
	

EndEvent

