Scriptname RFAB_ElementalWeapon extends ActiveMagicEffect  

import PO3_Events_AME 

Perk[] Property ModificatorPerks Auto

float[] Property ModificatorDamage Auto
float[] Property ModificatorCost Auto
float[] Property ModificatorDamageWave Auto
float[] Property ModificatorCostWave Auto

float Property ModificatorDamageDefault Auto
float Property ModificatorDamageWaveDefault Auto
float Property ModificatorCostDefault Auto
float Property ModificatorCostWaveDefault Auto

float Property MagickaLooseModifier Auto

Spell Property ElementalSpell Auto
KeyWord Property WeaponKeyword Auto

Spell Property Wave Auto

;==========================================

Actor Caster

float DamageModificator
float CostModificator
float DamageWaveModificator
float CostWaveModificator

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Caster = akTarget
    int Index = GetModifierIndex()
    if (Index != -1)
        DamageModificator = ModificatorDamage[Index]
        CostModificator = ModificatorCost[Index]
        CostWaveModificator = ModificatorCostWave[Index]
        DamageWaveModificator = ModificatorDamageWave[Index]
    else
        DamageModificator = ModificatorDamageDefault
        CostModificator = ModificatorCostDefault 
        CostWaveModificator = ModificatorCostWaveDefault
        DamageWaveModificator = ModificatorDamageWaveDefault
    endif
    RegisterAnimations()
    RegisterForWeaponHit(self)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForWeaponHit(self)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    bool PowerAttack = Caster.GetAnimationVariableBool("bAllowRotation")
    if asEventName == "AttackPowerStanding_FXStart" || asEventName == "AttackPowerForward_FXStart" && Caster.IsSprinting() || asEventName == "AttackPowerRight_FXStart" || asEventName == "AttackPowerLeft_FXStart" || asEventName == "AttackPowerBackward_FXStart"
        UpdateWaveDamage()
        CastWave()
    elseIf asEventName == "WeaponSwing" && Caster.GetEquippedWeapon(false).HasKeyword(WeaponKeyword) && PowerAttack
        UpdateWaveDamage()
        CastWave()
    elseIf asEventName == "WeaponLeftSwing" && Caster.GetEquippedWeapon(true).HasKeyword(WeaponKeyword) && PowerAttack
        UpdateWaveDamage()
        CastWave()
    endif
EndEvent

Event OnWeaponHit(ObjectReference akTarget, Form akSource, Projectile akProjectile, Int aiHitFlagMask)
    if (akTarget as Actor && akSource.HasKeyword(WeaponKeyword))
        UpdateDamage()
        Caster.DamageActorValue("Magicka", Caster.GetBaseActorValue("Magicka") * CostModificator)
        ElementalSpell.Cast(Caster, akTarget)
    endif
EndEvent

Function CastWave()
    Wave.Cast(Caster)
    Caster.DamageActorValue("Magicka", Caster.GetBaseActorValue("Magicka") * CostWaveModificator)
EndFunction

Function UpdateWaveDamage()
    float Penalty = Math.Floor((1.0 - Caster.GetActorValuePercentage("Magicka")) / 0.2)
    float Damage = (Caster.GetBaseActorValue("Magicka") * DamageWaveModificator) * (1.0 - (Penalty * MagickaLooseModifier))
    Wave.SetNthEffectMagnitude(0, Damage)  
EndFunction

Function UpdateDamage()
    float Penalty = Math.Floor((1.0 - Caster.GetActorValuePercentage("Magicka")) / 0.2)
    float Damage = (Caster.GetBaseActorValue("Magicka") * DamageModificator) * (1.0 - (Penalty * MagickaLooseModifier))
    ElementalSpell.SetNthEffectMagnitude(0, Damage)
EndFunction

int Function GetModifierIndex()
    int i = ModificatorPerks.Length
    while (i > 0)
        i -= 1
        if Caster.HasPerk(ModificatorPerks[i])
            return i
        endif
    endwhile
    return -1
EndFunction

Function RegisterAnimations()
    RegisterForAnimationEvent(Caster, "AttackPowerStanding_FXStart")
    RegisterForAnimationEvent(Caster, "AttackPowerRight_FXStart")
    RegisterForAnimationEvent(Caster, "AttackPowerLeft_FXStart")
    RegisterForAnimationEvent(Caster, "AttackPowerBackward_FXStart")
    RegisterForAnimationEvent(Caster, "AttackPowerForward_FXStart")
    RegisterForAnimationEvent(Caster, "WeaponSwing")
    RegisterForAnimationEvent(Caster, "WeaponLeftSwing")
EndFunction