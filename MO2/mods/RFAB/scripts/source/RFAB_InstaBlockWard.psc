Scriptname RFAB_InstaBlockWard extends activemagiceffect  

Spell Property WardSpell Auto
Actor OwnerActor

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForAnimationEvent(akTarget, "blockStartOut")
	RegisterForAnimationEvent(akTarget, "blockStop")
	OwnerActor = akTarget
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	If akSource == (OwnerActor as ObjectReference)
		if eventName == "blockStartOut"
            WardSpell.SetNthEffectMagnitude(0, self.GetMagnitude())
			OwnerActor.AddSpell(WardSpell, False)
		elseif eventName == "blockStop"
			OwnerActor.RemoveSpell(WardSpell)
		endif
	Endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	OwnerActor.RemoveSpell(WardSpell)
	UnRegisterForAnimationEvent(akTarget, "blockStartOut")
	UnRegisterForAnimationEvent(akTarget, "blockStop")
EndEvent