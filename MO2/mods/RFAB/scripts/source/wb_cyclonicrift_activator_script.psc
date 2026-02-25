Scriptname WB_CyclonicRift_Activator_Script extends ObjectReference  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_S_D100_CyclonicRift_Proc_Spell_PC Auto
Actor Property PlayerRef Auto
MagicEffect Property WB_D100_CyclonicRift_Effect_SelfDuration Auto
ObjectReference Property WB_CyclonicRift_Other Auto

; -----

Event OnLoad()

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUnload()

	UnregisterForUpdate()

EndEvent

; -----

Event OnUpdate()

	If PlayerRef.HasMagicEffect(WB_D100_CyclonicRift_Effect_SelfDuration)
		RegisterForSingleUpdate(WB_UpdateRate)
		If WB_CyclonicRift_Other.IsEnabled()
			WB_S_D100_CyclonicRift_Proc_Spell_PC.RemoteCast(Self,PlayerRef)
		EndIf
	Else
		Disable()
		MoveToMyEditorLocation()
	EndIf

EndEvent

; -----