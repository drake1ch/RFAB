Scriptname WB_InvisibleManagerInCombat_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto
GlobalVariable Property WB_Destruction_Crackle_Global Auto
MagicEffect Property BloodMagick Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
if akCaster.HasMagicEffect(BloodMagick) == false
	float total_cost = 0.0
	float Magicka = akTarget.GetAV("Magicka")	

	; Ocatos Recital
	Int i = 0
	bool bEnd = false
	While !bEnd && (i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize())
		Spell TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		total_cost += TheSpell.GetEffectiveMagickaCost(akTarget)
		
		if Magicka >= total_cost
			TheSpell.Cast(akTarget)	
		else
			bEnd = true
		endif
		
		i += 1
	EndWhile
	
	akTarget.DamageAV("Magicka", total_cost)	
	;Debug.Notification("Ocato total cost: " + total_cost)
endif

if akCaster.HasMagicEffect(BloodMagick) == true
	float total_cost = 0.0
	float Health = akTarget.GetAV("Health")	

	; Ocatos Recital
	Int i = 0
	bool bEnd = false
	While !bEnd && (i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize())
		Spell TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		total_cost += TheSpell.GetEffectiveMagickaCost(akTarget)
		
		if Health >= total_cost
			TheSpell.Cast(akTarget)	
		else
			bEnd = true
		endif
		
		i += 1
	EndWhile
	
	akTarget.DamageAV("Health", total_cost)	
	;Debug.Notification("Ocato total cost: " + total_cost)
endif

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	; Crackle
	WB_Destruction_Crackle_Global.SetValue(0.0)

EndEvent

; -----