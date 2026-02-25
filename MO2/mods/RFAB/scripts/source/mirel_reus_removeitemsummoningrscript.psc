ScriptName Mirel_REUS_RemoveItemSummonIngrScript Extends ActiveMagicEffect
 
Ingredient Property ItemToAdd Auto
Ingredient Property ItemToRemove Auto
Int Property ItemCount = 1 Auto
Bool Property Silent = False Auto
 
Event OnEffectStart(Actor Target, Actor Caster)
    Caster.RemoveItem(ItemToRemove, ItemCount, Silent)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
    Caster.AddItem(ItemToAdd, ItemCount, Silent)
EndEvent