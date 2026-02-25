ScriptName NightingaleSubterfugeScript Extends activemagiceffect

Float GetMagCap

Event OnEffectStart(Actor akTarget, Actor akCaster)
  GetMagCap = game.GetGameSettingFloat("fPlayerMaxResistance")
  game.SetGameSettingFloat("fPlayerMaxResistance", 100)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
  game.SetGameSettingFloat("fPlayerMaxResistance", GetMagCap as float)
EndEvent
