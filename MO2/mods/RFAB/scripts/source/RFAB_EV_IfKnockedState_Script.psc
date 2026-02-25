Scriptname RFAB_EV_IfKnockedState_Script extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
akTarget.EvaluatePackage()
endevent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
akTarget.EvaluatePackage()
endevent