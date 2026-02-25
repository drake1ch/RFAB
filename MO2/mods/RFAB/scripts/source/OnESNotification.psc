ScriptName OnESNotification Extends activemagiceffect

String Property Text Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
  debug.Notification(Text as String)
EndEvent
