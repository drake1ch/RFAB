Scriptname WB_ElementalHost_Script extends ActiveMagicEffect  

; -----

Activator[] Property WB_Elementals Auto
Spell[] Property WB_ElementalSpells Auto
ObjectReference[] Property WB_ElementalObjRefs Auto
Float Property WB_UpdateRate Auto
Activator Property FXEmptyActivator Auto
Float Property WB_DestHeight Auto
Float Property WB_DestRadiusMax Auto
Float Property WB_Speed Auto
Float Property WB_DestHeightInterior Auto
Float Property WB_DestRadiusMaxInterior Auto

; -----

ObjectReference targetBox
Float destAngle
Actor spellCaster
Actor spellTarget
Float destHeight
Float destRadius

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	spellTarget = akTarget
	spellCaster = akCaster

	if akTarget.IsInInterior()
		destHeight = WB_DestHeightInterior
		destRadius = WB_DestRadiusMaxInterior
	else
		destHeight = WB_DestHeight
		destRadius = WB_DestRadiusMax
	endIf

	; spawn target box for translations
	targetBox = akTarget.PlaceAtMe(FXEmptyActivator)

	; spawn and position elementals
	int i = 0
	while i < WB_Elementals.Length
		destAngle = Utility.RandomFloat(-180, 180)
		WB_ElementalObjRefs[i] = akTarget.PlaceAtMe(WB_Elementals[i])
		WB_ElementalObjRefs[i].MoveTo(akTarget, Math.Sin(destAngle) * destRadius, Math.Cos(destAngle) * destRadius, destHeight)
		i += 1
	endWhile

	RegisterForSingleUpdate(WB_UpdateRate);

EndEvent

; -----

Event OnUpdate()

	RegisterForSingleUpdate(WB_UpdateRate)

	int i = Utility.RandomInt(0, WB_Elementals.Length - 1)

	destAngle = Utility.RandomFloat(-180, 180)
	WB_ElementalObjRefs[I].InterruptCast()
	WB_ElementalObjRefs[i].MoveTo(spellTarget, Math.Sin(destAngle) * destRadius, Math.Cos(destAngle) * destRadius, destHeight)
	WB_ElementalSpells[i].RemoteCast(WB_ElementalObjRefs[i], spellCaster, spellTarget)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(1.25)
	WB_ElementalObjRefs[0].InterruptCast()
	WB_ElementalObjRefs[1].InterruptCast()
	WB_ElementalObjRefs[2].InterruptCast()

	WB_ElementalObjRefs[0].DisableNoWait(true)
	WB_ElementalObjRefs[1].DisableNoWait(true)
	WB_ElementalObjRefs[2].Disable(true)

	targetBox.Delete()
	WB_ElementalObjRefs[0].Delete()
	WB_ElementalObjRefs[1].Delete()
	WB_ElementalObjRefs[2].Delete()

EndEvent

; -----