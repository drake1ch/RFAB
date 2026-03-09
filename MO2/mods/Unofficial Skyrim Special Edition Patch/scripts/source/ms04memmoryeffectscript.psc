Scriptname MS04MemmoryEffectScript extends Actor

import game
import debug
import utility

VisualEffect property MS04MemoryFXBody01VFX Auto
float property GhostAlpha Auto

Event OnLoad()
	Wait(1) ; USKP 2.0.1 - Delay too short. Raised to allow 3D to finish loading.
	Self.SetAlpha(GhostAlpha, False)
	 MS04MemoryFXBody01VFX.Play(Self)
EndEvent

Function FadeIn()
	Self.EnableNoWait()
	Wait(1) ; USKP 2.0.1 - Delay too short. Raised to allow 3D to finish loading.
	Self.SetAlpha(GhostAlpha, True)
	 MS04MemoryFXBody01VFX.Play(Self)
EndFunction

Function PopIn()
	Self.EnableNoWait()
	Wait(1) ; USKP 2.0.1 - Delay too short. Raised to allow 3D to finish loading.
	Self.SetAlpha(GhostAlpha, False)
	 MS04MemoryFXBody01VFX.Play(Self)
EndFunction

Function FadeOut()
	 MS04MemoryFXBody01VFX.Stop(Self)
	Self.SetAlpha(0, True)
	Wait(1) ; USKP 2.0.1 - Delay too short. Raised to allow 3D to finish loading.
	Self.DisableNoWait()
EndFunction
