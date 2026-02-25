Scriptname PerfectPotions extends activemagiceffect
Keyword Property PerfectHealth auto
Keyword Property PerfectMagicka auto
Keyword Property PerfectStamina auto
Keyword Property PerfectCarryWeight auto
MagicEffect Property PotionEffect auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if PotionEffect.HasKeyword(PerfectHealth)
        akTarget.ModAV("Health", 10)
    elseif PotionEffect.HasKeyword(PerfectMagicka)
        akTarget.ModAV("Magicka", 10)
    elseif PotionEffect.HasKeyword(PerfectStamina)
        akTarget.ModAV("Stamina", 10)
    elseif PotionEffect.HasKeyword(PerfectCarryWeight)
        akTarget.ModAV("CarryWeight", 25)
    endif
EndEvent