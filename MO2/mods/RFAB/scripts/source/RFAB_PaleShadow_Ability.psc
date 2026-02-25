Scriptname RFAB_PaleShadow_Ability extends ActiveMagicEffect  

Actor Shadow

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Shadow = akTarget
	Shadow.SetDisplayName("Бледная тень")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Utility.Wait(1.0)
	Shadow.RemoveAllItems()
    Shadow.Delete()
EndEvent

Event OnDying(Actor akKiller)
	Shadow.RemoveAllItems()
	Utility.Wait(1.0)
    Shadow.Delete()
EndEvent
