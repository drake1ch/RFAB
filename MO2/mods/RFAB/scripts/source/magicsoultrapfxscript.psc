Scriptname magicsoultrapfxscript extends ActiveMagicEffect
{Scripted effect for the Soul Trap Visual FX}

sound property TrapSoundFX auto
{Sound played when we trap a soul}
visualeffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
imagespacemodifier property TrapImod auto
{IsMod applied when we trap a soul}
effectshader property TargetFXS auto
{Effect Shader on Target during Soul trap}
effectshader property CasterFXS auto
{Effect Shader on Caster during Soul trap}
visualeffect property CasterVFX auto
{Visual Effect on Caster aming at Target}

SoulGem Property SoulGemCommon Auto
SoulGem Property SoulGemCommonFilled Auto
SoulGem Property SoulGemAzurasStar Auto

SoulGem Property SoulGemBlack Auto
SoulGem Property SoulGemBlackFilled Auto
SoulGem Property SoulGemAzurasStarBlack Auto

Keyword Property BlackSoul Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.GetActorValue("Health") > 0.0
		return
	endif
	Utility.Wait(0.25)

	bool bIsHasBlaskSoul = akTarget.GetRace().HasKeyword(BlackSoul)
	bool bIsSouldCaptured = false

	if bIsHasBlaskSoul && akCaster.GetItemCount(SoulGemBlack) > 0
		akCaster.RemoveItem(SoulGemBlack, abSilent = true)
		akCaster.AddItem(SoulGemBlackFilled, abSilent = true)
		bIsSouldCaptured = true
	elseif !bIsHasBlaskSoul && akCaster.GetItemCount(SoulGemCommon) > 0
		akCaster.RemoveItem(SoulGemCommon, abSilent = true)
		akCaster.AddItem(SoulGemCommonFilled, abSilent = true)
		bIsSouldCaptured = true
	elseif akCaster.GetItemCount(SoulGemAzurasStar) > 0 || akCaster.GetItemCount(SoulGemAzurasStarBlack) > 0
		akCaster.TrapSoul(akTarget)
		bIsSouldCaptured = true
	endif

	if bIsSouldCaptured
		TrapSoundFX.Play(akCaster)
		TrapImod.Apply(1.0)
		TargetVFX.Play(akTarget, 4.7, akCaster)
		CasterVFX.Play(akCaster, 5.9, akTarget)
		TargetFXS.Play(akTarget, 2.0)
		CasterFXS.Play(akCaster, 3.0)
		Game.IncrementStat("Souls Trapped", 1)
	endif
EndEvent
