Scriptname RFAB_Script_SummonSpirit extends ActiveMagicEffect

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
		if (Quests[0].IsCompleted() && Quests[1].IsCompleted())
			i = 2
		elseif (Quests[0].IsCompleted() || Quests[1].IsCompleted())
			i = 1
		elseif (!Quests[0].IsCompleted() && !Quests[1].IsCompleted())
			i = 0
		endif
		CooldownSpell.Cast(akCaster)
		SummonSpell[i].Cast(akCaster)
		akTarget.AddSpell(AuraSpell[i])
	else 
		debug.notification("Способность на перезарядке")
	endif
endevent
