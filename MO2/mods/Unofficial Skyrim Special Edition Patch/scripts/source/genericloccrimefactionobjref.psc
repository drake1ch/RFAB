Scriptname GenericLocCrimeFactionObjRef extends actor
{OnCellAttach this script puts the actor it is on into the crime faction for the hold the actor is currently in}

LocationAlias Property myHoldLocation Auto

Location property HaafingarHoldLocation auto
Location property ReachHoldLocation auto
Location property HjaalmarchHoldLocation auto
Location property WhiterunHoldLocation auto
Location property FalkreathHoldLocation auto
Location property PaleHoldLocation auto
Location property WinterholdHoldLocation auto
Location property EastmarchHoldLocation auto
Location property RiftHoldLocation auto

faction Property CrimeFactionHaafingar Auto					
faction Property CrimeFactionReach Auto					
faction Property CrimeFactionHjaalmarch Auto					
faction Property CrimeFactionWhiterun Auto					
faction Property CrimeFactionFalkreath Auto					
faction Property CrimeFactionPale Auto					
faction Property CrimeFactionWinterhold Auto					
faction Property CrimeFactionEastmarch Auto					
faction Property CrimeFactionRift Auto

Event OnCellAttach()
	Actor selfActor = self
	
	Faction myCrimeFaction = GetCrimeFactionForHold(selfActor)
	
; 	debug.trace(self + "OnLoad() myHoldLocation: " + myHold + " means I should get the crime faction: " + myCrimeFaction)
	selfActor.SetCrimeFaction(myCrimeFaction)
	
EndEvent

Faction Function GetCrimeFactionForHold(Actor ActorRef)
	{Returns the normal crime faction for the hold}

	Faction ReturnFaction
	
	If ActorRef.IsInLocation(HaafingarHoldLocation)
		returnFaction = CrimeFactionHaafingar
	ElseIf ActorRef.IsInLocation(ReachHoldLocation)
		returnFaction = CrimeFactionReach
	ElseIf ActorRef.IsInLocation(HjaalmarchHoldLocation)
		returnFaction = CrimeFactionHjaalmarch
	ElseIf ActorRef.IsInLocation(WhiterunHoldLocation)
		returnFaction = CrimeFactionWhiterun
	ElseIf ActorRef.IsInLocation(FalkreathHoldLocation)
		returnFaction = CrimeFactionFalkreath
	ElseIf ActorRef.IsInLocation(PaleHoldLocation)
		returnFaction = CrimeFactionPale
	ElseIf ActorRef.IsInLocation(WinterholdHoldLocation)
		returnFaction = CrimeFactionWinterhold
	ElseIf ActorRef.IsInLocation(EastmarchHoldLocation)
		returnFaction = CrimeFactionEastmarch
	ElseIf ActorRef.IsInLocation(RiftHoldLocation)
		returnFaction = CrimeFactionRift
	Else
	
	EndIf
	
	return ReturnFaction

EndFunction
