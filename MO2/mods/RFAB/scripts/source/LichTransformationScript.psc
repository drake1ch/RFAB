Scriptname LichTransformationScript extends ActiveMagicEffect

Spell[] property AddSpells auto
Perk[] property AddPerks auto
ReferenceAlias property LichRef auto
Actor Property Player Auto
Spell property TransformFXSpell auto

VisualEffect Property POT_EyeGlowMale  Auto
VisualEffect Property POT_EyeGlowFemale Auto
VisualEffect Property POT_EyeGlowKhajiitMale Auto
VisualEffect Property POT_EyeGlowKhajiitFemale Auto
VisualEffect Property POT_EyeGlowArgonian Auto
VisualEffect Property POT_EyeGlowElfMale  Auto
VisualEffect Property POT_EyeGlowElfFemale  Auto
VisualEffect Property POT_EyeGlowOrcMale  Auto  
VisualEffect Property POT_EyeGlowOrcFemale  Auto

Race Property ArgonianRace  Auto
Race Property KhajiitRace  Auto
FormList Property RacesElf  Auto  
Race Property OrcRace  Auto

VisualEffect Property FXDragonPriestParticlesEffect  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)

    LichRef.ForceRefTo(akTarget)
    TransformFXSpell.Cast(akTarget)
    AddTrait(akTarget)
    AddEyeFX(akTarget)
    FXDragonPriestParticlesEffect.Play(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    LichRef.Clear()
    RemoveTrait(akTarget)
    RemoveEyeFX(akTarget)
    FXDragonPriestParticlesEffect.Stop(akTarget)
EndEvent

Function AddEyeFX(Actor FXTarget)

	ActorBase TargetBase = FXTarget.GetLeveledActorBase()
	if (FXTarget.GetRace() == ArgonianRace)
		POT_EyeGlowArgonian.Play(FXTarget)
	elseif(FXTarget.GetRace() == KhajiitRace)
		if (TargetBase.GetSex() == 0)
			POT_EyeGlowKhajiitMale.Play(FXTarget)
		else
			POT_EyeGlowKhajiitFemale.Play(FXTarget)
		endif
	elseif(FXTarget.GetRace() == OrcRace)
		if (TargetBase.GetSex() == 0)
			POT_EyeGlowOrcMale.Play(FXTarget)
		else
			POT_EyeGlowOrcFemale.Play(FXTarget)
		endif
	elseif(RacesElf.HasForm(FXTarget.GetRace()))
		if (TargetBase.GetSex() == 0)
			POT_EyeGlowElfMale.Play(FXTarget)
		elseif(TargetBase.GetSex() == 1)
			POT_EyeGlowElfFemale.Play(FXTarget)
		endif
	else
		if (TargetBase.GetSex() == 0)
			POT_EyeGlowMale.Play(FXTarget)
		else
			POT_EyeGlowFemale.Play(FXTarget)
		endif
	endif
EndFunction

Function RemoveEyeFX(Actor FXTarget)

	POT_EyeGlowMale.Stop(FXTarget)
	POT_EyeGlowFemale.Stop(FXTarget)
	POT_EyeGlowKhajiitMale.Stop(FXTarget)
	POT_EyeGlowKhajiitFemale.Stop(FXTarget)
	POT_EyeGlowArgonian.Stop(FXTarget)
	POT_EyeGlowElfMale.Stop(FXTarget)
	POT_EyeGlowElfFemale.Stop(FXTarget)
	POT_EyeGlowOrcMale.Stop(FXTarget)
	POT_EyeGlowOrcFemale.Stop(FXTarget)
EndFunction

Function AddTrait(Actor Target)

    int i = 0
    While i < AddSpells.Length
        Target.AddSpell(AddSpells[i])
        i += 1
    EndWhile
    i = 0
    While i < AddPerks.Length
        Target.AddPerk(AddPerks[i])
        i += 1
    EndWhile
EndFunction

Function RemoveTrait(Actor Target)

    int i = 0
    While i < AddSpells.Length
        Target.RemoveSpell(AddSpells[i])
        i += 1
    EndWhile
    i = 0
    While i < AddPerks.Length
        Target.RemovePerk(AddPerks[i])
        i += 1
    EndWhile
EndFunction