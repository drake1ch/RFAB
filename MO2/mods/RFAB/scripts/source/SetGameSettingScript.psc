scriptName SetGameSettingScript extends activemagiceffect

Float OldStealthSetting

function OnEffectStart(Actor akTarget, Actor akCaster)

OldStealthSetting = game.GetGameSettingFloat("fCombatStealthPointRegenAlertWaitTime")

    game.SetGameSettingFloat("fCombatStealthPointRegenAlertWaitTime", OldStealthSetting as Float / 2)
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)

    game.SetGameSettingFloat("fCombatStealthPointRegenAlertWaitTime", OldStealthSetting as Float)
endFunction