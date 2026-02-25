Scriptname zTeleport extends ActiveMagicEffect  

ObjectReference property teleDest auto

VisualEffect Property VFX  Auto
VisualEffect Property VFX2  Auto
VisualEffect Property VFX3  Auto
VisualEffect Property VFX4  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (RFAB_PapyrusFunctions.GetCombatState(akTarget) > 1)
		return
	endif

	VFX.Play(akTarget)
	Utility.Wait(1.0)
	VFX2.Play(akTarget)
	Utility.Wait(1.0)
	VFX3.Play(akTarget)
	Utility.Wait(1.0)
	Game.FadeOutGame(false, true, 2.0, 1.0)
	akTarget.MoveTo(teleDest)
	Game.EnableFastTravel()
	Game.FastTravel(teleDest)
	VFX.Stop(akTarget)
	VFX2.Stop(akTarget)
	VFX3.Stop(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	VFX3.Play(akTarget)
	VFX2.Play(akTarget)
	VFX4.Play(akTarget)
	Utility.Wait(2.0)
	VFX3.Stop(akTarget)
	VFX2.Stop(akTarget)
	VFX4.Stop(akTarget)
EndEvent