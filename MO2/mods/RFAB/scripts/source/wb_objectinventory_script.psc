Scriptname WB_ObjectInventory_Script extends ReferenceAlias  

; -----

Spell Property WB_A050_LocateObject_Spell_PC Auto
Actor Property PlayerRef Auto

; -----

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akNewContainer
		PlayerRef.DispelSpell(WB_A050_LocateObject_Spell_PC)
	EndIf

EndEvent

; -----