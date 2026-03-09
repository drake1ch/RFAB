Scriptname USKPVisualEffectsRemovalScript extends ObjectReference
{Script intended to aid in removal of unwanted visual effects in the event our protections aren't enough to stop them}

Actor Property PlayerRef Auto
Spell Property USKPVisualsRemovalSpell Auto
Message Property USKPRemoveUnwantedVisualsMessage Auto

;Vanilla effects
VisualEffect Property DraugrMaleEyeGlowFX Auto
VisualEffect Property DraugrFemaleEyeGlowFX Auto
VisualEffect Property FXDwarvenCenturion Auto
VisualEffect Property FXDwarvenCenturionArm01 Auto
VisualEffect Property FXDwarvenCenturionArm02 Auto
VisualEffect Property IceWraithParticles01 Auto
VisualEffect Property FXIceWraith2ndFormEffect auto
VisualEffect Property FXMagicDraugrDarkeningEffect Auto
VisualEffect Property WitchlightFXAttachEffect Auto
VisualEffect Property WispFXAttachEffect Auto
VisualEffect Property AtronachFlameTrail Auto
VisualEffect Property AtronachStormCloak Auto
EffectShader Property AtronachStormShockFXS Auto
VisualEffect Property FXSovengardeGlowEffect Auto
EffectShader Property SovengardeFXS Auto
VisualEffect Property FXDwarvenSpiderEffect Auto
VisualEffect Property FXDwarvenSphereEffect Auto
VisualEffect Property FXNecroSkeletonMultiEffect auto
VisualEffect Property FXSkeletonNecroEyeGlowEffect auto
VisualEffect Property SprigganSwarmFXAttachEffect Auto
VisualEffect Property SprigganFXAttachEffect Auto
VisualEffect Property DragonPriestParticlesFX Auto
VisualEffect Property DragonPriestEyeGlowFX Auto
VisualEffect Property FXfallingSandDragonPriestEffect Auto
EffectShader Property AtronachFrostFXS Auto

;Dawnguard
VisualEffect Property FXDeathHoundEffect Auto
EffectShader Property DeathHoundDeathFXShader Auto
VisualEffect Property FXSCCreatureMultiEffect auto
VisualEffect Property FXSCCreatureEyeGlowEffect auto
EffectShader Property SCCreatureDeathFXS auto
EffectShader Property NightmareFXShader Auto
EffectShader Property DLC1SoulCairnGhostFXShader Auto
VisualEffect Property DLC01_ScrollAttunementEffect auto
VisualEffect Property DLC1MothAttachFX01Effect auto

;Dragonborn
VisualEffect Property DLC2BurntSprigganParticlesE Auto
EffectShader Property DLC2HMDaedraFXS Auto
EffectShader Property DLC2HMDaedraDeathFXS Auto
EffectShader Property DLC2ExpSpiderFireFXShader Auto
EffectShader Property DLC2ExpSpiderShockFXShader Auto
EffectShader Property DLC2ExpSpiderPoisonFXShader Auto
EffectShader Property DLC2ExpSpiderFrostFXShader Auto
EffectShader Property FrostFXShader Auto
VisualEffect Property DLC2dunFXInsturmentsMeshEffect Auto
VisualEffect Property DLC2AshSpawnFX Auto
EffectShader Property DLC2AshSpawnFXShader Auto
EffectShader Property GhostEtherealFXShader Auto

Event OnRead( )
	USKPVisualsRemovalSpell.Cast( PlayerRef, PlayerRef )
	PleaseRemoveAllThisShit()
	USKPRemoveUnwantedVisualsMessage.Show()
EndEvent

Function PleaseRemoveAllThisShit()
	if( PlayerRef.GetActorBase().GetSex() == 0 )
		DraugrMaleEyeGlowFX.Stop(PlayerRef)
	Else
		DraugrFemaleEyeGlowFX.Stop(PlayerRef)
	EndIf
	
	FXDwarvenCenturion.Stop(PlayerRef)
	FXDwarvenCenturionArm01.Stop(PlayerRef)
	FXDwarvenCenturionArm02.Stop(PlayerRef)
	IceWraithParticles01.Stop(PlayerRef)
	FXIceWraith2ndFormEffect.Stop(PlayerRef)
	FXMagicDraugrDarkeningEffect.Stop(PlayerRef)
	WitchlightFXAttachEffect.Stop(PlayerRef)
	WispFXAttachEffect.Stop(PlayerRef)
	AtronachFlameTrail.Stop(PlayerRef)
	AtronachStormCloak.Stop(PlayerRef)
	AtronachStormShockFXS.Stop(PlayerRef)
	FXSovengardeGlowEffect.Stop(PlayerRef)
	SovengardeFXS.Stop(PlayerRef)
	FXDwarvenSpiderEffect.Stop(PlayerRef)
	FXDwarvenSphereEffect.Stop(PlayerRef)
	FXNecroSkeletonMultiEffect.Stop(PlayerRef)
	FXSkeletonNecroEyeGlowEffect.Stop(PlayerRef)
	SprigganSwarmFXAttachEffect.Stop(PlayerRef)
	SprigganFXAttachEffect.Stop(PlayerRef)
	DragonPriestParticlesFX.Stop(PlayerRef)
	DragonPriestEyeGlowFX.Stop(PlayerRef)
	FXfallingSandDragonPriestEffect.Stop(PlayerRef)
	AtronachFrostFXS.Stop(PlayerRef)
	
	FXDeathHoundEffect.Stop(PlayerRef)
	DeathHoundDeathFXShader.Stop(PlayerRef)
	FXSCCreatureMultiEffect.Stop(PlayerRef)
	FXSCCreatureEyeGlowEffect.Stop(PlayerRef)
	SCCreatureDeathFXS.Stop(PlayerRef)
	NightmareFXShader.Stop(PlayerRef)
	DLC1SoulCairnGhostFXShader.Stop(PlayerRef)
	PlayerRef.SetAlpha(1.0)
	DLC01_ScrollAttunementEffect.Stop(PlayerRef)
	DLC1MothAttachFX01Effect.Stop(PlayerRef)
	
	DLC2BurntSprigganParticlesE.Stop(PlayerRef)
	DLC2HMDaedraFXS.Stop(PlayerRef)
	DLC2HMDaedraDeathFXS.Stop(PlayerRef)
	DLC2ExpSpiderFireFXShader.Stop(PlayerRef)
	DLC2ExpSpiderShockFXShader.Stop(PlayerRef)
	DLC2ExpSpiderPoisonFXShader.Stop(PlayerRef)
	DLC2ExpSpiderFrostFXShader.Stop(PlayerRef)
	FrostFXShader.Stop(PlayerRef)
	DLC2dunFXInsturmentsMeshEffect.Stop(PlayerRef)
	DLC2AshSpawnFX.Stop(PlayerRef)
	DLC2AshSpawnFXShader.Stop(PlayerRef)
	GhostEtherealFXShader.Stop(PlayerRef)
EndFunction
