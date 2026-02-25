scriptName WB_EQDualCast_Script extends ActiveMagicEffect

spell property WB_SelfSpell auto
Float property WB_UpdateRate auto
spell property WB_EQSpell auto
spell property FireAvatatSpell auto

Actor TheTarget

function OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.EquipSpell(WB_EQSpell, 0)
	akTarget.EquipSpell(WB_EQSpell, 1)
	akTarget.AddSpell(FireAvatatSpell, false)
	TheTarget = akTarget
	self.RegisterForUpdate(WB_UpdateRate)
endFunction

function OnUpdate()

	if TheTarget.GetEquippedSpell(0) != WB_EQSpell && TheTarget.GetEquippedSpell(1) != WB_EQSpell
		self.Dispel()
	endIf
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)

	if akTarget.GetEquippedSpell(0) == WB_EQSpell
		akTarget.UnequipSpell(WB_EQSpell, 0)
		akTarget.RemoveSpell(WB_EQSpell)
		akTarget.EquipSpell(WB_SelfSpell, 0)
		akTarget.RemoveSpell(FireAvatatSpell)
	endIf
	if akTarget.GetEquippedSpell(1) == WB_EQSpell
		akTarget.UnequipSpell(WB_EQSpell, 1)
		akTarget.RemoveSpell(WB_EQSpell)
		akTarget.EquipSpell(WB_SelfSpell, 1)
		akTarget.RemoveSpell(FireAvatatSpell)
	endIf
endFunction