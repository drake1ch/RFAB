Scriptname RFAB_AllyHitAllow extends ActiveMagicEffect  

int iAllyHitNonCombatAllowed

Event OnEffectStart(Actor akTarget, Actor akCaster)
	iAllyHitNonCombatAllowed = Game.GetGameSettingInt("iAllyHitNonCombatAllowed")
    Game.SetGameSettingInt("iAllyHitNonCombatAllowed", 1000)
EndEvent

Event OnPlayerLoadGame()
    Game.SetGameSettingInt("iAllyHitNonCombatAllowed", 1000)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Game.SetGameSettingInt("iAllyHitNonCombatAllowed", iAllyHitNonCombatAllowed)
EndEvent