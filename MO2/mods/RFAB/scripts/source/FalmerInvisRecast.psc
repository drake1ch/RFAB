scriptName FalmerInvisRecast extends ActiveMagicEffect

Float property fDelay = 3.00000 auto
Bool property bEvaluatePackage = true auto
spell property SpellToCast auto
ReferenceAlias Property Falmer Auto

Event OnCellAttach()
	Falmer.ForceRefIfEmpty(self.GetCasterActor() as ObjectReference)
EndEvent

Event OnCellDetach()
	Falmer.Clear()
	self.Dispel()
endEvent

Event OnDying(Actor akKiller)
	Falmer.Clear()
	self.Dispel()
EndEvent

function OnEffectStart(Actor akTarget, Actor akCaster)
	Falmer.TryToEvaluatePackage()
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)
	utility.Wait(fDelay)
	Falmer.TryToEvaluatePackage()
	SpellToCast.Cast(akCaster as objectreference, none)
endFunction