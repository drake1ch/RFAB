Scriptname RFAB_ArcaneFatigueScript extends ActiveMagicEffect  

ImageSpaceModifier Property ISM  Auto  

Sound Property FatigueSound  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int instanceID = FatigueSound.Play(Game.GetPlayer())
	ISM.ApplyCrossFade(2) 
endevent