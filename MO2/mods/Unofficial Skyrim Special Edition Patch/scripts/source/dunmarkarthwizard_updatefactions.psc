ScriptName dunMarkarthWizard_UpdateFactions extends ObjectReference
{Adds actors to the Secure Area Faction as players move through the Wizards' Quarters, avoiding mass pile-ons early in the space.}

import game
import debug

ReferenceAlias property Actor1 Auto
ReferenceAlias property Actor2 Auto

Faction property SecureAreaFaction Auto
Faction property PlayerFaction Auto

Quest property TG06 Auto
int property StageMustBeAbove Auto
int property StageMustBeBelow Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto

bool activatedLinkedRef

auto State Waiting
	Event onTriggerEnter(ObjectReference obj)
		if (TG06.GetStage() >= StageMustBeAbove && TG06.GetStage() < StageMustBeBelow)
			;USKP 2.0.1 - Added checks to be sure these refs are valid.
			;USKP 2.0.2 - Added second checks to make sure the damn ALIAS is valid too, even though invalid ones SHOULD NOT BE POSSIBLE BETH WTF!
			if( Actor1 && Actor1.GetActorReference() )
				Actor1.GetActorReference().AddToFaction(SecureAreaFaction)
				Actor1.GetActorReference().SetAV("Aggression", 1)
				Actor1.GetActorReference().EvaluatePackage()
			EndIf
			
			if( Actor2 && Actor2.GetActorReference() )
				Actor2.GetActorReference().AddToFaction(SecureAreaFaction)
				Actor2.GetActorReference().SetAV("Aggression", 1)
				Actor2.GetActorReference().EvaluatePackage()
			EndIf
			
			;Make sure to bar the door as the first guard leaves Aicantar's room.
			if (Self.GetLinkedRef() as DoorBar != None && !activatedLinkedRef)
				activatedLinkedRef = True
				(Self.GetLinkedRef() as DoorBar).SetBarPosition(False)
				(obj as Actor).SetActorValue("Variable06", 1)
			EndIf

			if (Self.GetLinkedRef(LinkCustom02) != None)
				Self.GetLinkedRef(LinkCustom03).Enable()
				Self.GetLinkedRef(LinkCustom02).Disable()
			EndIf

			(obj as Actor).EvaluatePackage()
		EndIf
	EndEvent
EndState