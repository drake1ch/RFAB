Scriptname RFAB_Script_BosmerSummonDispel extends ActiveMagicEffect  

Event OnPlayerLoadGame()
RegisterForModEvent("RFAB_BosmerSummonDispel", "OnBosmerSummonDispel")
endEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
RegisterForModEvent("RFAB_BosmerSummonDispel", "OnBosmerSummonDispel")
endEvent

Event OnBosmerSummonDispel()
Dispel()
endevent