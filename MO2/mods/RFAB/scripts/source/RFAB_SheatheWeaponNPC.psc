Scriptname RFAB_SheatheWeaponNPC extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.SheatheWeapon()
EndEvent