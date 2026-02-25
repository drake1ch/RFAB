Scriptname RFAB_BA_ModDragonSoul extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.ModActorValue("DragonSouls", self.GetMagnitude() as Int)
EndEvent