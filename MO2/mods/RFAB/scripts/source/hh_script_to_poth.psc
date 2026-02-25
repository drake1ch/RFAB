Scriptname HH_script_to_poth extends ActiveMagicEffect  

Quest Property MS06  Auto  
MiscObject Property Misc_to_removeOne  Auto  
MiscObject Property Misc_to_removeTwo  Auto  
MiscObject Property Misc_to_add  Auto
Spell Property PotemaSpell auto
ObjectReference Property Altar  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
Target.RemoveItem(Misc_to_removeOne, (Target.GetItemCount(Misc_to_removeOne)))
Target.RemoveItem(Misc_to_removeTwo, (Target.GetItemCount(Misc_to_removeTwo)))
Target.AddItem(Misc_to_add, 1, true)
Target.AddSpell(PotemaSpell, false)
MS06.SetCurrentStageID(170)
MS06.SetObjectiveCompleted(155)
if Caster.GetDistance(Altar) >= 240.0
Caster.DamageActorValue("Health", 9999999999.0)
endif
endEvent