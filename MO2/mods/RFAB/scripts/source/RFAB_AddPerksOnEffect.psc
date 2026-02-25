Scriptname RFAB_AddPerksOnEffect extends ActiveMagicEffect  

Int Property CountOfPerks = 0 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Game.AddPerkPoints(CountOfPerks)
EndEvent
