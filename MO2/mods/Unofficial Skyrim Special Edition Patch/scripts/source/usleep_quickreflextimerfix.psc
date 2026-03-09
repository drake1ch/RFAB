Scriptname USLEEP_QuickReflexTimerFix extends activemagiceffect  
{USLEEP 3.0.1 workaround fix to stop Quick Reflexes from sticking for too long.}

MagicEffect Property PerkQuickReflexesEffect Auto
Spell Property PerkQuickReflexes Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if( akCaster == Game.GetPlayer() )
		;Effect lasts 1 second normally, give it 2 before checking if it needs to be removed.
		RegisterForSingleUpdate(2.0)
	EndIf
EndEvent

Event OnUpdate()
	if( Game.GetPlayer().HasMagicEffect(PerkQuickReflexesEffect) )
		Game.GetPlayer().DispelSpell(PerkQuickReflexes)
	EndIf
EndEvent
