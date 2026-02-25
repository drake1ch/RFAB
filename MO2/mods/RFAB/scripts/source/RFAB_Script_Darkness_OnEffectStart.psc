Scriptname RFAB_Script_Darkness_OnEffectStart extends ActiveMagicEffect  
ImageSpaceModifier Property Darkness  Auto 


Event OnEffectStart(Actor akTarget, Actor akCaster)
Darkness.ApplyCrossFade(2.0)
endevent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
ImageSpaceModifier.RemoveCrossFade(5.0)
endevent
 
