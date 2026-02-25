Scriptname RFAB_CompleteBonus extends ActiveMagicEffect  

Perk Property MyPerk Auto

Spell[] Property MySpells Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddPerk(MyPerk)
	int i = 0
	while i < MySpells.Length
    	akTarget.AddSpell(MySpells[i])
		i += 1
	endwhile
	Debug.Notification("\"" + GetBaseObject().GetName() + "\" - выучено")
	
	Spell kMySpell = PO3_SKSEFunctions.GetActiveEffectSpell(self) as Spell
	akTarget.RemoveSpell(kMySpell)
EndEvent