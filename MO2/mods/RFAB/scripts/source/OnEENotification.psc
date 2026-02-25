ScriptName OnEENotification Extends activemagiceffect

String Property Text Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
  debug.Notification(Text as String)
EndEvent
