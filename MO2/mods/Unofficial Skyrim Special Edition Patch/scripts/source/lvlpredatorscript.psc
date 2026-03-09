Scriptname LvlPredatorScript Extends Actor 
;Modifications by Sclerocephalus - Release version 1.0 (07/16/2013)


Faction Property SoloFaction1  Auto			;solo predator faction
Faction Property SoloFaction2  Auto			;solo predator faction
Faction Property SoloFaction3  Auto			;solo predator faction

Keyword Property SoloKeyword  Auto
;If linked with this keyword, the predator is NOT a "solo" predator

Keyword Property LinkCustom09 Auto ; Used for references whose parent is in the same enable state.
Keyword Property LinkCustom10 Auto ; Used for references whose parent is set to the opposite enable state.

;----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnCellLoad()

	Bool DisabledByParent = False

	ObjectReference EnableParent = GetLinkedRef (LinkCustom09)
	ObjectReference InverseEnableParent = GetLinkedRef (LinkCustom10)


	If EnableParent
		If EnableParent.IsDisabled()
			DisabledByParent = True
		EndIf
	ElseIf InverseEnableParent
		If InverseEnableParent.IsEnabled()
			DisabledByParent = True
		EndIf
	EndIf

	If DisabledByParent
		Disable()
	ElseIf CheckForDisable()
		Disable()
	Else
		Enable()
	EndIf

EndEvent

;----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Bool Function CheckForDisable()

	Bool DisableMe = False

	Actor LinkedPredator
	Actor Predator = Self As Actor


	If SoloKeyword && GetLinkedRef (SoloKeyword)
	;Predator is NOT a solo predator ...

		If (SoloFaction1 && Predator.IsInFaction (SoloFaction1)) || (SoloFaction2 && Predator.IsInFaction (SoloFaction2)) || (SoloFaction3 && Predator.IsInFaction (SoloFaction3))
		;... but is in one of the solo factions -> disable:

			DisableMe = True

		Else

			LinkedPredator = GetLinkedRef (SoloKeyword) As Actor

			If Self.GetRace() != LinkedPredator.GetRace()
			;... but its linked reference is of a different race -> disable:

				DisableMe = True

			EndIf

		Endif

	EndIf

	Return DisableMe

EndFunction 