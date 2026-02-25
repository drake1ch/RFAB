Scriptname ShadowStonePowerUpdateScript extends ActiveMagicEffect  

Spell property ShadowStonePowerSpellDispel auto
Spell property ShadowStonePowerSpell auto
Spell property ShadowStonePowerTimer auto

actor SpellTarget

Event OnEffectStart(actor akTarget, actor akCaster)
		SpellTarget = akTarget
EndEvent

Event OnDying(actor akKiller)
	if akKiller == Game.GetPlayer()
		Game.GetPlayer().DispelSpell(ShadowStonePowerSpellDispel)
		Game.GetPlayer().DispelSpell(ShadowStonePowerTimer)
		ShadowStonePowerSpell.Cast(akKiller, none)
		ShadowStonePowerTimer.Cast(akKiller, none)
	endif
endEvent