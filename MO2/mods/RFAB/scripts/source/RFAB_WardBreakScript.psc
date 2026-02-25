scriptName RFAB_WardBreakScript extends ActiveMagicEffect

spell property BanWardSpell auto
actor property Player auto
actor Target

function OnEffectStart(actor akTarget, actor akCaster)
	Target = akCaster
	if Target != Player
		Target.SetActorValue("WardPower", self.GetMagnitude() / 2 as Float)
	else
		Target.SetActorValue("WardPower", self.GetMagnitude() / 4 as Float)
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)
	Target.SetActorValue("WardPower", 0 as Float)
endFunction
