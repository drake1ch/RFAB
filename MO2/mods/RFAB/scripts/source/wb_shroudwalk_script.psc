scriptName WB_Shroudwalk_Script extends ActiveMagicEffect

keyword property MagicInvisibility auto
Float property WB_UpdateRate auto
spell property WB_S_I100_Shroudwalk_Spell auto
globalvariable property WB_Illusion_Shroudwalk_Global_BreakCount auto

Actor TheTarget
Int NumberOfBreaks
Int BreakCount

function OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	NumberOfBreaks = 0
	BreakCount = 1 + WB_Illusion_Shroudwalk_Global_BreakCount.GetValue() as int
	self.OnUpdate()
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(WB_S_I100_Shroudwalk_Spell)
endFunction

function OnUpdate()

	if !TheTarget.HasEffectKeyword(MagicInvisibility)
		if NumberOfBreaks <= WB_Illusion_Shroudwalk_Global_BreakCount.GetValue() as Int
			WB_S_I100_Shroudwalk_Spell.Cast(TheTarget as objectreference, none)
			BreakCount -= 1
			if BreakCount == 5
				debug.Notification("” мен€ есть "+BreakCount+" действий в невидимости")
			Elseif BreakCount < 5 && BreakCount > 0
				debug.Notification("ƒействий в невидимости осталось: "+BreakCount)
			ElseIf BreakCount == 0
				debug.Notification("Ёто последнее действие")
			endIf
			NumberOfBreaks += 1
			self.RegisterForSingleUpdate(WB_UpdateRate)
		else
			self.Dispel()
		endIf
	else
		self.RegisterForSingleUpdate(WB_UpdateRate)
	endIf
endFunction