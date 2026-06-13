Scriptname RFAB_BaseStatsBonus extends ActiveMagicEffect

String Property TrackedBaseActorValue Auto
String[] Property BonusActorValues Auto

Float Property StartAfter = 250.0 Auto
Float Property Step = 25.0 Auto
Float Property BonusPerStep = 5.0 Auto

Actor TargetRef
Float LastBaseValue = -1.0
Float LastBonus = 0.0
Bool Applied = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TargetRef = akTarget
	RegisterForMenu("StatsMenu")
	RegisterForModEvent("RFAB_BaseAttributesChanged", "OnBaseAttributesChanged")
	Reapply(true)
	RegisterForSingleUpdate(2.0)
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("StatsMenu")
	RegisterForModEvent("RFAB_BaseAttributesChanged", "OnBaseAttributesChanged")
	Reapply(true)
	RegisterForSingleUpdate(2.0)
EndEvent

Event OnBaseAttributesChanged(string eventName, string strArg, float numArg, Form sender)
	Reapply(false)
EndEvent

Event OnMenuClose(string menuName)
	Reapply(false)
EndEvent

Event OnUpdate()
	Reapply(false)
	RegisterForSingleUpdate(2.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForUpdate()
	UnregisterForMenu("StatsMenu")
	UnregisterForAllModEvents()
	RemoveLast()
EndEvent

Function Reapply(Bool force)
	Float baseValue = TargetRef.GetBaseActorValue(TrackedBaseActorValue)
	if !force && Applied && baseValue == LastBaseValue
		return
	endif

	RemoveLast()

	LastBaseValue = baseValue
	LastBonus = GetSteppedBonus(baseValue)
	ModBonusActorValues(LastBonus)
	Applied = true
EndFunction

Float Function GetSteppedBonus(Float baseValue)
	Float excess = baseValue - StartAfter
	if excess < Step
		return 0.0
	endif

	return Math.Floor(excess / Step) * BonusPerStep
EndFunction

Function RemoveLast()
	if !Applied
		return
	endif

	ModBonusActorValues(-LastBonus)

	LastBaseValue = -1.0
	LastBonus = 0.0
	Applied = false
EndFunction

Function ModBonusActorValues(Float value)
	int i = 0
	while i < BonusActorValues.Length
		TargetRef.ModActorValue(BonusActorValues[i], value)
		i += 1
	endwhile
EndFunction
