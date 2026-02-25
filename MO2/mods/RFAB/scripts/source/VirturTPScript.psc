Scriptname VirturTPScript extends ActiveMagicEffect

Spell Property BatSpell Auto
Float Property Interval = 8.0 Auto
Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Caster = akCaster
    OnUpdate()
EndEvent

Event OnUpdate()

    TpToPlayer()
EndEvent

Function TpToPlayer()

    Bool bTPReady = false
    While !bTPReady
        If Caster.GetDistance(game.GetPlayer()) <= 2000 && !game.GetPlayer().IsSneaking() && game.GetPlayer().IsDetectedBy(Caster) && Caster.GetEquippedItemType(1) != 9
            Caster.DoCombatSpellApply(BatSpell, Caster)
            Float OldSM = game.GetPlayer().GetAV("SpeedMult")
            game.GetPlayer().ModAV("SpeedMult", -OldSM + 30)
            Caster.TranslateTo(game.GetPlayer().GetPositionX()- 60 * Math.Sin(game.GetPlayer().GetAngleZ()), \
                               game.GetPlayer().GetPositionY()- 60 * Math.Cos(game.GetPlayer().GetAngleZ()), \
                               game.GetPlayer().GetPositionZ(), \
                               game.GetPlayer().GetAngleX(), \
                               game.GetPlayer().GetAngleY(), \
                               game.GetPlayer().GetAngleZ(), \
                               10000.0, \
                               0.0)
            Utility.WaitMenuMode(2.0)
            game.GetPlayer().ModAV("SpeedMult", OldSM - 30)
            bTPReady = true
            RegisterForSingleUpdate(Interval)
        EndIf
    EndWhile
EndFunction