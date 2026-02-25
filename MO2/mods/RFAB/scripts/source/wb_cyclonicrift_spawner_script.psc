Scriptname WB_CyclonicRift_Spawner_Script extends ObjectReference  

; -----

GlobalVariable Property WB_Destruction_CyclonicRift_Global_RiftID Auto
ObjectReference Property WB_CyclonicRift_0 Auto
ObjectReference Property WB_CyclonicRift_1 Auto
Spell Property WB_S_D100_CyclonicRift_Spell_SelfDuration_PC Auto
Actor Property PlayerRef Auto

; -----

Event OnLoad()

	If WB_Destruction_CyclonicRift_Global_RiftID.GetValue() == 0
		WB_Destruction_CyclonicRift_Global_RiftID.SetValue(1)
		WB_S_D100_CyclonicRift_Spell_SelfDuration_PC.Cast(PlayerRef)
		WB_CyclonicRift_0.MoveTo(Self)
		WB_CyclonicRift_0.Enable()
	Else
		WB_Destruction_CyclonicRift_Global_RiftID.SetValue(0)
		WB_S_D100_CyclonicRift_Spell_SelfDuration_PC.Cast(PlayerRef)
		WB_CyclonicRift_1.MoveTo(Self)
		WB_CyclonicRift_1.Enable()
	EndIf
	Delete()

EndEvent

; -----