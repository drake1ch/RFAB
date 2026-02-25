Scriptname BL01_Script_Blink extends ObjectReference  

ACTOR Property _ACT_Player       Auto
SPELL Property _SPL_VFX          Auto
PERK  Property _PRK_NoFallDamage Auto
PERK  Property _PRK_SilentCast   Auto

Event OnLoad()
    ObjectReference Target = self
    Float AngleZ = _ACT_Player.GetAngleZ()
    Float DistInFront = -48.0
    Float XLoc = Target.GetPositionX() + DistInFront * Math.Sin(AngleZ)
    Float YLoc = Target.GetPositionY() + DistInFront * Math.Cos(AngleZ)
    Float ZLoc = Target.GetPositionZ()

    ;Add the perk thats prevents fall damage to the actor
    _ACT_Player.AddPerk(_PRK_NoFallDamage)
    
    ;If player does not have quiet casting perk add it
    _ACT_Player.AddPerk(_PRK_SilentCast)

    ;Cast the spell to show the visual FX to the player
    ;_SPL_VFX.Cast(_ACT_Player, _ACT_Player)
    
    ;Move the actor to the target location
    ;_ACT_Player.TranslateToRef(Self, 20000.0)
    If _ACT_Player.GetDistance(Target) >= 96
        _ACT_Player.TranslateTo(XLoc, YLoc, ZLoc, 0 as Float, 0 as Float, AngleZ, 20000.0, 0.0)
    EndIf
    
    _SPL_VFX.Cast(_ACT_Player, _ACT_Player)
    ;End the FX spell
    _ACT_Player.DispelSpell(_SPL_VFX)
    
    ;Wait 2 seconds to ensure player has reached the target
    Utility.Wait(2.0)
    
    ;Remove the anti fall damage perk
    _ACT_Player.RemovePerk(_PRK_NoFallDamage)
    
    ;Delete the activator.
    self.Disable()
    self.Delete()
endEvent