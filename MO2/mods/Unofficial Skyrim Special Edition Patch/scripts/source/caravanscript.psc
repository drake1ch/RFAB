Scriptname CaravanScript extends Quest  Conditional
;v1.3 - 01/04/2013

;Major update provided by Sclerocephalus for USKP 1.2.5
;Version 1.3 updates for USKP 1.2.7 to correct faction problems if a caravan leader is killed

Bool ArraysAreInitialized = False

Faction[] CaravanLeaderFactions

Faction Property CaravanALeader Auto
Faction Property CaravanBLeader Auto
Faction Property CaravanCLeader Auto
Faction Property CaravanMerchant Auto
Faction Property JobMerchantFaction Auto

GlobalVariable[] CaravanLocations
GlobalVariable[] CaravanCampStates

GlobalVariable Property CaravanLocationA Auto
GlobalVariable Property CaravanLocationB Auto
GlobalVariable Property CaravanLocationC Auto
GlobalVariable Property CaravanIsCampedA Auto
GlobalVariable Property CaravanIsCampedB Auto
GlobalVariable Property CaravanIsCampedC Auto

Int CampTime = 24

ObjectReference[] CaravanCampMarkers

ObjectReference Property CampEnableMarkerA1 Auto
ObjectReference Property CampEnableMarkerA2 Auto
ObjectReference Property CampEnableMarkerB1 Auto
ObjectReference Property CampEnableMarkerB2 Auto
ObjectReference Property CampEnableMarkerC1 Auto
ObjectReference Property CampEnableMarkerC2 Auto

ReferenceAlias[] CaravanMembers

ReferenceAlias Property LeaderA Auto
ReferenceAlias Property LeaderB Auto
ReferenceAlias Property LeaderC Auto
ReferenceAlias Property FollowerA1 Auto
ReferenceAlias Property FollowerB1 Auto
ReferenceAlias Property FollowerC1 Auto
ReferenceAlias Property FollowerA2 Auto
ReferenceAlias Property FollowerB2 Auto
ReferenceAlias Property FollowerC2 Auto
ReferenceAlias Property FollowerA3 Auto
ReferenceAlias Property FollowerC3 Auto

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function InitArrays ()

	CaravanLeaderFactions = New Faction [3]

	CaravanLeaderFactions[0] = CaravanALeader
	CaravanLeaderFactions[1] = CaravanBLeader
	CaravanLeaderFactions[2] = CaravanCLeader

	CaravanLocations = New GlobalVariable[3]
	CaravanCampStates = New GlobalVariable[3]
	
	CaravanLocations[0] = CaravanLocationA
	CaravanLocations[1] = CaravanLocationB
	CaravanLocations[2] = CaravanLocationC
	CaravanCampStates[0] = CaravanIsCampedA
	CaravanCampStates[1] = CaravanIsCampedB
	CaravanCampStates[2] = CaravanIsCampedC
	
	CaravanCampMarkers = New ObjectReference[6]
	
	CaravanCampMarkers[0] = CampEnableMarkerA1
	CaravanCampMarkers[1] = CampEnableMarkerA2
	CaravanCampMarkers[2] = CampEnableMarkerB1
	CaravanCampMarkers[3] = CampEnableMarkerB2
	CaravanCampMarkers[4] = CampEnableMarkerC1
	CaravanCampMarkers[5] = CampEnableMarkerC2

	CaravanMembers = New ReferenceAlias[12]
	
	CaravanMembers[0] = LeaderA
	CaravanMembers[1] = LeaderB
	CaravanMembers[2] = LeaderC

	CaravanMembers[3] = FollowerA1
	CaravanMembers[4] = FollowerB1
	CaravanMembers[5] = FollowerC1
	CaravanMembers[6] = FollowerA2
	CaravanMembers[7] = FollowerB2
	CaravanMembers[8] = FollowerC2
	CaravanMembers[9] = FollowerA3
	CaravanMembers[10] = None
	CaravanMembers[11] = FollowerC3
	
	(LeaderA as CaravanLeaderScript).CaravanNumber = 0
	(LeaderB as CaravanLeaderScript).CaravanNumber = 1
	(LeaderC as CaravanLeaderScript).CaravanNumber = 2
	
	ArraysAreInitialized = True
	
EndFunction

Function CheckArrayInits()
	if( ArraysAreInitialized == false )
		InitArrays()
	EndIf
EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 
Function UpdateCaravan (Int WhichCaravan, Actor LeaderRef, Bool WeAreEnablingCamp = False, Bool WeAreDisablingCamp = False)
	
	If (ArraysAreInitialized == False)
		InitArrays()
	EndIf
	
	If (WeAreDisablingCamp == True)

		While (LeaderRef.Is3DLoaded() == True)
			Utility.Wait(1)
		EndWhile

		ToggleCamp (WhichCaravan, False)

	EndIf
	
	SetGlobals (CaravanCampStates [WhichCaravan], CaravanLocations [WhichCaravan])
	
	If (WeAreEnablingCamp == True)
	
		While (LeaderRef.Is3DLoaded() == True)
			Utility.Wait(1)
		EndWhile
			
		ToggleCamp (WhichCaravan, True)
		CaravanMembers [WhichCaravan].RegisterForSingleUpdateGameTime (CampTime)
		
	EndIf

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function UpdateAliases (Int WhichCaravan, Int WhichMember)

	Int MemberToReplaceWith = WhichMember + 1
	
	;USKP 2.1.0 - Bug #18748: Need to make sure the actual reference is valid, not just the alias.
	If( WhichMember < 3 && CaravanMembers[WhichCaravan + 3 * MemberToReplaceWith].GetReference() != None )
		CaravanMembers [WhichCaravan + 3 * WhichMember].ForceRefTo (CaravanMembers [WhichCaravan + 3 * MemberToReplaceWith].GetReference())
		If (WhichMember == 0)
			SetMerchantFactions (WhichCaravan, CaravanMembers [WhichCaravan + 3 * WhichMember].GetReference() As Actor)
		EndIf
		UpdateAliases (WhichCaravan, MemberToReplaceWith)	
	Else
		;USKP 2.0.4 - Add sanity check in case the member pool is exhausted.
		if( CaravanMembers [WhichCaravan + 3 * WhichMember] )
			CaravanMembers [WhichCaravan + 3 * WhichMember].Clear()
		EndIf
	EndIf

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function SetGlobals (GlobalVariable CampedGlobal, GlobalVariable LocationGlobal)

	If (CampedGlobal.GetValue() != 0)
		LocationGlobal.SetValue (1 - LocationGlobal.GetValue())
	EndIf
	
	CampedGlobal.SetValue (1 - CampedGlobal.GetValue())

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function ToggleCamp (Int WhichCaravan, Bool WeAreEnablingCamp)

	ObjectReference CampEnableMarker = GetCampEnableMarker (WhichCaravan)
	
	If (WeAreEnablingCamp == True)
		CampEnableMarker.Enable()
	Else
		CampEnableMarker.Disable()
	EndIf
		
EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

ObjectReference Function GetCampEnableMarker (Int WhichCaravan)
	
	Int WhichCamp = CaravanLocations [WhichCaravan].GetValue() As Int
	
	Return CaravanCampMarkers [2 * WhichCaravan + WhichCamp]
	
EndFunction 

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function SetMerchantFactions (Int WhichCaravan, Actor Member)

	Member.AddToFaction (CaravanMerchant)
	Member.AddToFaction (CaravanLeaderFactions [WhichCaravan])
	Member.AddToFaction (JobMerchantFaction)

EndFunction
