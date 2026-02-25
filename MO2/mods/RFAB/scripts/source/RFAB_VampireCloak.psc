Scriptname RFAB_VampireCloak extends ActiveMagicEffect  

Potion Property Blood Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.RemoveItem(Blood, akTarget.GetItemCount(Blood), true, akCaster)
EndEvent