Scriptname RFAB_Script_SummonSpirit extends ActiveMagicEffect

GlobalVariable Property BA_Stage  Auto
Spell[] Property SummonSpell  Auto
Spell[] Property AuraSpell  Auto   
Quest[] Property Quests  Auto 
Spell Property CooldownSpell Auto
MagicEffect Property Cooldown Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !akTarget.HasMagicEffect(Cooldown)
		int i = 0
		while i < AuraSpell.length
			akTarget.RemoveSpell(AuraSpell[i])
			i += 1
		endwhile
		if BA_Stage.GetValueInt() < 3.0
			i = 0
		elseif BA_Stage.GetValueInt() < 5.0
			i = 1
		elseif BA_Stage.GetValueInt() >= 5.0
			i = 2
		endif
		CooldownSpell.Cast(akCaster)
		SummonSpell[i].Cast(akCaster)
		akTarget.AddSpell(AuraSpell[i])
	else 
		debug.notification("Способность на перезарядке")
	endif
endevent
