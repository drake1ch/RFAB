ScriptName CombatReflexDispell Extends activemagiceffect

Float Property Duration Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Utility.Wait(Duration)
  self.Dispel()
EndEvent
