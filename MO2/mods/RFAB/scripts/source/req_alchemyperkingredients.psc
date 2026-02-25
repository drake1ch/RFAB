scriptName REQ_AlchemyPerkIngredients extends ActiveMagicEffect
{attached to effects that remove ingredients required for Alchemy perks}

Bool property Silent = false auto
spell property RemoveWhenDone auto
globalvariable property AlchPerkTake auto
form[] property Ingredients auto

function OnEffectStart(Actor akTarget, Actor akCaster)

	if ui.IsMenuOpen("StatsMenu") && akTarget == game.GetPlayer()
		Int i = 0
		if AlchPerkTake.GetValue() == 0
			AlchPerkTake.Mod(1 as Float)
			while i < Ingredients.length
				akTarget.RemoveItem(Ingredients[i], 1, Silent, none)
				i += 1
			endWhile
		endIf
	endIf
	if RemoveWhenDone
		akTarget.RemoveSpell(RemoveWhenDone)
	endIf
endFunction