Scriptname BosmerAbilityAnimalBuff extends ActiveMagicEffect

GlobalVariable Property AnimalCount Auto
Spell Property BuffSpell Auto
Spell Property BuffSpellSctipt Auto
Spell Property CloackSpell Auto
ReferenceAlias Property AnimalRef Auto

Float Property HpPercentBuff Auto
Float Property DamagePercentBuff Auto
Float Property ArmorPercentBuff Auto
Float Property SpeedPercentBuff Auto
Float Property MagResPerlevel Auto
Float Property StepMult Auto
Float LastLevel = 0.0

Actor Caster

Event OnEffectStart(actor akTarget, actor akCaster)

    Caster = akCaster
    LastLevel = game.GetPlayer().GetLevel()
    CalcBuffs()
    RegisterForMenu("StatsMenu")
EndEvent

Event OnDying(Actor akKiller)

    AnimalCount.Mod(-1)
    Caster.RemoveSpell(BuffSpellSctipt)
    Caster.RemoveSpell(CloackSpell)
    AnimalRef.Clear()
EndEvent

Event OnMenuClose(String MenuName)

    If MenuName == "StatsMenu" && game.GetPlayer().GetLevel() != LastLevel
        LastLevel = game.GetPlayer().GetLevel()
        CalcBuffs()
    EndIf
EndEvent

Function CalcBuffs()

    If Caster.HasSpell(BuffSpell)
        Caster.RemoveSpell(BuffSpell)
    EndIf

    Float HPBonus = Caster.GetBaseAV("Health") * math.pow(game.GetPlayer().GetLevel() * HpPercentBuff, StepMult) / 100
    Float DamageBonus = Caster.GetAV("UnarmedDamage") * math.pow(game.GetPlayer().GetLevel() * DamagePercentBuff, StepMult) / 100
    Float ResistBonus = Caster.GetAV("Damageresist") * math.pow(game.GetPlayer().GetLevel() * ArmorPercentBuff, StepMult) / 100
    Float SpeedBonus = Caster.GetAV("SpeedMult") * math.pow(game.GetPlayer().GetLevel() * SpeedPercentBuff, StepMult) / 100
    Float MagresBonus = game.GetPlayer().GetLevel() * MagResPerlevel

    BuffSpell.SetNthEffectMagnitude(0, HPBonus)
    BuffSpell.SetNthEffectMagnitude(1, DamageBonus)
    BuffSpell.SetNthEffectMagnitude(2, ResistBonus)
    BuffSpell.SetNthEffectMagnitude(3, SpeedBonus)
    BuffSpell.SetNthEffectMagnitude(4, MagresBonus)

    Caster.AddSpell(BuffSpell, false)

EndFunction

Event OnEffectFinish(actor akTarget, actor akCaster)

    Caster.RemoveSpell(BuffSpell)
EndEvent