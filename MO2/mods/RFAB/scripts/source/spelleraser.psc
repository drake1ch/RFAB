Scriptname SpellEraser extends ActiveMagicEffect  
{Removes currently equipped spells.}

Keyword property excludeKeyword auto
{Exclude spells with the supplied keyword.}

event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell theSpell = akCaster.GetEquippedSpell(0)
	if (theSpell != None) && (!theSpell.HasKeyword(excludeKeyword))
		akCaster.UnequipSpell(theSpell, 0)
		akCaster.RemoveSpell(theSpell)
	endIf
	
	theSpell = akCaster.GetEquippedSpell(1)
	if (theSpell != None) && (!theSpell.HasKeyword(excludeKeyword))
		akCaster.UnequipSpell(theSpell, 1)
		akCaster.RemoveSpell(theSpell)
	endIf
endEvent
