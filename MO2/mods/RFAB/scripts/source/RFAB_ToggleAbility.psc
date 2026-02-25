Scriptname RFAB_ToggleAbility extends ActiveMagicEffect  

Spell Property ToggledSpell auto

string Property TextAdd Auto
string Property TextRemove Auto

Event OnEffectStart (Actor akTarget, Actor akCaster)
	if akTarget.HasSpell(ToggledSpell)
		akTarget.RemoveSpell(ToggledSpell)
		Debug.Notification(TextRemove)
	else
		akTarget.AddSpell(ToggledSpell, false)
		Debug.Notification(TextAdd)
	endif
EndEvent