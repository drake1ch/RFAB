Scriptname RFAB_ArctusTransformationDynamic extends ActiveMagicEffect

String[] Property PhysicalDamageActorValues Auto

Float Property AttributeStep Auto
Float Property AttributeBonusPerStep Auto
Float Property PhysicalDamagePerMagicka Auto

Actor TargetRef
Float LastBaseMagicka = -1.0
Float LastHealthStaminaBonus = 0.0
Float LastPhysicalDamageBonus = 0.0
Bool Applied = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TargetRef = akTarget
	RegisterForModEvent("RFAB_BaseAttributesChanged", "OnBaseAttributesChanged")
	RegisterForMenu("StatsMenu")
	Reapply(true)
EndEvent

Event OnPlayerLoadGame()
	RegisterForModEvent("RFAB_BaseAttributesChanged", "OnBaseAttributesChanged")
	RegisterForMenu("StatsMenu")
	Reapply(true)
EndEvent

Event OnBaseAttributesChanged(string eventName, string strArg, float numArg, Form sender)
	Reapply(false)
EndEvent

Event OnMenuClose(string menuName)
	Reapply(false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	RemoveLast()
EndEvent

Function Reapply(Bool force)
	Float baseMagicka = GetCappedBaseMagicka(TargetRef.GetBaseActorValue("Magicka"))
	if !force && Applied && baseMagicka == LastBaseMagicka
		return
	endif

	RemoveLast()

	LastBaseMagicka = baseMagicka
	LastHealthStaminaBonus = GetSteppedValue(baseMagicka, AttributeStep, AttributeBonusPerStep)
	LastPhysicalDamageBonus = baseMagicka * PhysicalDamagePerMagicka

	TargetRef.ModActorValue("Health", LastHealthStaminaBonus)
	TargetRef.ModActorValue("Stamina", LastHealthStaminaBonus)
	ModPhysicalDamage(LastPhysicalDamageBonus)
	Applied = true
EndFunction

Float Function GetSteppedValue(Float baseValue, Float step, Float valuePerStep)
	if step <= 0.0
		return 0.0
	endif
	return Math.Floor(baseValue / step) * valuePerStep
EndFunction

Float Function GetCappedBaseMagicka(Float baseMagicka)
	Float cap = GetMagnitude()
	if cap > 0.0 && baseMagicka > cap
		return cap
	endif
	return baseMagicka
EndFunction

Function RemoveLast()
	if !Applied
		return
	endif

	TargetRef.ModActorValue("Health", -LastHealthStaminaBonus)
	TargetRef.ModActorValue("Stamina", -LastHealthStaminaBonus)
	ModPhysicalDamage(-LastPhysicalDamageBonus)

	LastBaseMagicka = -1.0
	LastHealthStaminaBonus = 0.0
	LastPhysicalDamageBonus = 0.0
	Applied = false
EndFunction

Function ModPhysicalDamage(Float value)
	int i = 0
	while i < PhysicalDamageActorValues.Length
		TargetRef.ModActorValue(PhysicalDamageActorValues[i], value)
		i += 1
	endwhile
EndFunction
