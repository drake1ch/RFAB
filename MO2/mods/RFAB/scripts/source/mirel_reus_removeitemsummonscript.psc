ScriptName Mirel_REUS_RemoveItemSummonScript Extends ActiveMagicEffect
 
MiscObject Property ItemToAdd Auto
MiscObject Property ItemToRemove Auto
Int Property ItemCount = 1 Auto
Bool Property Silent = False Auto
 
Event OnEffectStart(Actor Target, Actor Caster)
    Caster.RemoveItem(ItemToRemove, ItemCount, Silent)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
    Caster.AddItem(ItemToAdd, ItemCount, Silent)
EndEvent