Scriptname OnEffectStartAddPerkArr extends ActiveMagicEffect

Perk[] Property PerkArr Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    int i = 0
    While i < PerkArr.Length
        akCaster.AddPerk(PerkArr[i])
        i += 1
    EndWhile
EndEvent