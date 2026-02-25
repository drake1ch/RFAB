Scriptname RFAB_Kematu_IsDead_Global extends activemagiceffect

GlobalVariable Property KematuIsDead Auto

Event OnDying(Actor akTarget)
	KematuIsDead.SetValue(1)
EndEvent