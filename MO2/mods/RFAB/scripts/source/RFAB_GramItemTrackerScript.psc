Scriptname RFAB_GramItemTrackerScript extends ReferenceAlias

import po3_events_alias

Actor Property PlayerRef Auto
MiscObject property WeightDummy Auto

Form CurrentObject

Event OnInit()
	RegisterForObjectGrab(self as Alias)
EndEvent

Event OnObjectGrab(ObjectReference akObjectRef)
	CurrentObject = akObjectRef.GetBaseObject()
	if !(CurrentObject as Furniture) && !(CurrentObject as Door)
		SendSteal(akObjectRef)
		AddWeight(akObjectRef)
	endif
EndEvent

Event OnObjectRelease(ObjectReference akObjectRef)
	if CurrentObject.GetWeight() > 0 || (akObjectRef as Actor) || (CurrentObject as Container)
		PlayerRef.RemoveItem(WeightDummy, PlayerRef.GetItemCount(WeightDummy), true, none)
		WeightDummy.SetWeight(0)
	endIf
EndEvent

Function AddWeight(ObjectReference akObjectRef)
	if (akObjectRef as Actor) || (CurrentObject as Container)
		float Weight = akObjectRef.GetTotalItemWeight()
		if (Weight > 0)
			WeightDummy.SetWeight(Weight)
			PlayerRef.AddItem(WeightDummy, 1, true)
		endIf
	else
		float Weight = CurrentObject.GetWeight()
		if (Weight > 0)
			WeightDummy.SetWeight(Weight * po3_sksefunctions.GetRefCount(akObjectRef))
			PlayerRef.AddItem(WeightDummy, 1, true)
		endIf
	endIf
EndFunction

Function SendSteal(ObjectReference akObjectRef)
	if akObjectRef.IsOffLimits()
		;/
		Actor Bystander = PO3_SKSEFunctions.GetRandomActorFromRef(akObjectRef, 2000.0, abIgnorePlayer = true)
		Bystander.SendTrespassAlarm(PlayerRef)
		/;
		if akObjectRef.GetGoldValue() <= 0
			PlayerRef.GetParentCell().GetFactionOwner().SendAssaultAlarm()
			akObjectRef.GetFactionOwner().SendAssaultAlarm()
		else
			akObjectRef.SendStealAlarm(PlayerRef)
		endif
	endIf
EndFunction
