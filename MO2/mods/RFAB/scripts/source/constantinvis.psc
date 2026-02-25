scriptName ConstantInvis extends ActiveMagicEffect

keyword property MagicInvisibility auto
Float property UpdateRate auto
spell property InvisSpell auto
Float property Distance auto

Actor TheTarget

function OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	self.OnUpdate()
endFunction

function OnUpdate()

	if !TheTarget.HasEffectKeyword(MagicInvisibility)
		if TheTarget.GetDistance(game.GetPlayer()) >= Distance
			InvisSpell.Cast(TheTarget as objectreference, none)
		endIf
		self.RegisterForSingleUpdate(UpdateRate)
	else
		if TheTarget.GetDistance(game.GetPlayer()) < Distance
			TheTarget.DispelSpell(InvisSpell)
		endIf
		self.RegisterForSingleUpdate(UpdateRate)
	endIf
endFunction