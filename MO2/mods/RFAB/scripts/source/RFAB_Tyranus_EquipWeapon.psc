Scriptname RFAB_Tyranus_EquipWeapon extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
akCaster.equipitem(akItem)
akCaster.EvaluatePackage()
endevent



Event OnEffectFinish(Actor akTarget, Actor akCaster)
akTarget.equipspell(akSpell, 1)
akTarget.EvaluatePackage()
endevent


WEAPON Property akItem  Auto  

SPELL Property akSpell  Auto  
