Scriptname WB_CyclonicRift_Teleport_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
ImagespaceModifier Property WB_DestructionShock_Imod_Explosion_ShockNova Auto
ObjectReference Property WB_CyclonicRift_Exit Auto

; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

	If WB_CyclonicRift_Exit.IsEnabled()
		akTarget.MoveTo(WB_CyclonicRift_Exit)
		WB_DestructionShock_Imod_Explosion_ShockNova.Apply()
		If akTarget == PlayerRef
			Game.ShakeCamera(akTarget, 0.5, 1)
		Else
			akTarget.StartCombat(PlayerRef)
		EndIf
	EndIf

EndEvent

; -----
