Scriptname WB_ObjectDestructionChanged_Scrip extends ReferenceAlias  

; -----

Spell Property WB_A050_LocateObject_Spell_PC Auto
Actor Property PlayerRef Auto

; -----

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

	If aiCurrentStage == -1
		PlayerRef.DispelSpell(WB_A050_LocateObject_Spell_PC)
	EndIf

EndEvent

; -----