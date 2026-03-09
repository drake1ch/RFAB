ScriptName dunMossMotherValdrInjured extends Actor
{Script for the wounded behavior on Valdr outside Moss Mother Cavern.}
;USKP 2.0.2 - This code has now been entirely replaced by an alias script on the quest itself to avoid all the problems associated with injuring him outside of the quest.
;All of the code has been commented out to prevent its execution.

;Stage in which the player finds out Valdr is wounded.
int property WoundingStage Auto

;Stage to set when Valdr is healed.
int property HealedStage Auto

;Moss Mother Cavern quest.
Quest Property dunMossMotherQST Auto

;Internal variables.
int damagedHealth
bool doOnce
bool checkingInjury
bool breakLoop

;When the cell loads, damage Valdr's health so we'll know if it improves (eg. if the player just walks up and casts a heal spell on him).
Event OnCellLoad()
	;if( dunMossMotherQST.IsRunning() )
	;	if (!doOnce)
	;		Self.DamageAV("Health", Self.GetAV("Health") - 1)
	;		damagedHealth = Self.GetAV("Health") As Int
	;		doOnce = True
	;	EndIf
	;	UpdateLoop()
	;EndIf
EndEvent

Event OnUnload()
	breakLoop = True
EndEvent

;Periodically check to see if the player has healed Valdr.
Function UpdateLoop()
	;While(dunMossMotherQST.GetStage() < 20 && !Self.IsDead() && !breakLoop)
	;	If (dunMossMotherQST.GetStage() >= HealedStage)
	;		Self.RestoreAV("Health", 75)
	;		breakLoop = True
	;	ElseIf (Self.GetAV("Health") > damagedHealth)
	;		dunMossMotherQST.Setstage(HealedStage)
	;	EndIf
	;	Utility.Wait(1)
	;EndWhile
	;breakLoop = False
EndFunction 