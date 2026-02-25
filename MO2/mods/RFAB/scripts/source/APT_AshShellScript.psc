ScriptName APT_AshShellScript Extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetDontMove()
	;Game.DisablePlayerControls(abMovement = true, abFighting = true, abSneaking = true, abActivate = true)	
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetDontMove(false)
	;Game.EnablePlayerControls(abMovement = true, abFighting = true, abSneaking = true, abActivate = true)
EndEvent
