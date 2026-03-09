Scriptname DLC1_BF_FalmerStatueSCRIPT extends Actor Hidden
{
	Child Script under the DLC1_BF_WaveControllerSCRIPT

	These actors are told, on activate, to break out of the ice and attack the player.
	OnDeath() they communicate with the Master script so it knows how many actors are left in this wave.
}

import debug
import utility

Keyword Property LinkCustom01 Auto
{Link to the Navcut Collision}
Keyword Property LinkCustom02 Auto
{Link to the Ice Spike that gets broken at spawn}

EffectShader Property IceFormBreak01FXS Auto
EffectShader Property IceFormBreak02FXS Auto
EffectShader Property FrostIceFormFXShader Auto
EffectShader Property FrostIceFormFXShader02 Auto
Explosion Property crIceWraithExplosion Auto

Bool Property AlreadyDied = FALSE Auto Hidden
{Lets us now that the actor has already died and not to send the ping to the wave master again (in case he gets resurrected or something)}

Bool Property OnlyDeathEvent = FALSE Auto
{If this is a placed actor that is part of the wave and not a frozen one then set this to TRUE so it will still increment the wave counter}

DLC1_BF_WaveControllerSCRIPT Property WaveController Auto Hidden
{The wave controller so we can ping it on death}

EffectShader Property DLC1BFIceFormFXS Auto

Bool Property DoOnce = FALSE Auto
Bool Property DoOnce2 = FALSE Auto


Event OnCellAttach()

	;UDGP 2.0.2 - Ok. How about we just don't then since you seem to want 3D state. This has no guarantee you will.
	Return
	
	; Put frozen wave members into the frozen state unless OnlyDeathEvent is true, and only do this once
	if (DoOnce == FALSE)
		if (OnlyDeathEvent == FALSE)
			self.MoveTo(HiddenMarker)
			;DLC1BFIceFormFXS.Play(self)
			;Wait(1)
			;FrostIceFormFXShader.Play(Self)
			;Wait(1)
			;self.MoveTo(GetLinkedRef())
			;Order changed by UDGP 2.0 - Cannot do SetAlpha before disabling AI
			Self.SetAlpha(0)
			Self.SetGhost(TRUE)
			Self.EnableAI(FALSE)
			;While Is3DLoaded() == FALSE
				;Wait for 3d to be loaded
			;EndWhile
			self.MoveTo(HiddenMarker)
		elseif (OnlyDeathEvent == TRUE)
			;WaveController = (GetLinkedRef(LinkCustom02) as DLC1_BF_WaveControllerSCRIPT)
		endif
		DoOnce = TRUE
	endif

EndEvent


Event OnLoad()

	; Put frozen wave members into the frozen state unless OnlyDeathEvent is true, and only do this once
	if (DoOnce == FALSE)
		if (OnlyDeathEvent == FALSE)
			self.MoveTo(HiddenMarker)
			;Wait(1)
			;FrostIceFormFXShader.Play(Self)
			;Wait(1)
			;self.MoveTo(GetLinkedRef())
			;Order changed by UDGP 2.0 - Cannot do SetAlpha before disabling AI
			Self.SetAlpha(0)
			Self.SetGhost(TRUE)
			Self.EnableAI(FALSE)
			;While Is3DLoaded() == FALSE
				;Wait for 3d to be loaded
			;EndWhile
			self.MoveTo(HiddenMarker)
		elseif (OnlyDeathEvent == TRUE)
			;WaveController = (GetLinkedRef(LinkCustom02) as DLC1_BF_WaveControllerSCRIPT)
		endif
		DoOnce = TRUE
	endif	

EndEvent


Event OnActivate(ObjectReference akActionRef)

	if (DoOnce2 == FALSE)
		; If OnlyDeathEvent isn't true then OnActivate() unfreeze and send after the player
		if (OnlyDeathEvent == FALSE)
			self.Enable(FALSE)
			GetLinkedRef(LinkCustom01).Disable()
			GetLinkedRef(LinkCustom02).DamageObject(100)
			;ObjectReference TempExplosion = Self.PlaceAtMe(crIceWraithExplosion)
			self.MoveTo(GetLinkedRef())
			Wait(0.25)
			;Order changed by UDGP 2.0 - Cannot do SetAlpha before enabling AI
			Self.EnableAI(TRUE)
			SetActorValue("Aggression", 2)
			Self.SetGhost(FALSE)
			Self.SetAlpha(1)
			Self.StartCombat(Game.GetPlayer())
			;DLC1BFIceFormFXS.Play(self)
		endif
		DoOnce2 = TRUE
	endif

EndEvent


Event OnDeath(Actor akKiller)

	; If I haven't already died then stop shaders and ping WaveController
	if AlreadyDied == FALSE
		IceFormBreak01FXS.Stop(self)
		FrostIceFormFXShader.Stop(self)
		WaveController.CountDead()
		AlreadyDied == TRUE
	endif

EndEvent


Function AssignWaveController(DLC1_BF_WaveControllerSCRIPT akWaveController)
	; Assign the Wave Controller so we don't have to LinkedRef all the mobs to it

	WaveController = (akWaveController as DLC1_BF_WaveControllerSCRIPT)

EndFunction


ObjectReference Property HiddenMarker  Auto  
