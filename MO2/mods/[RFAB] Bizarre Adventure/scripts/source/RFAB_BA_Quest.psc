Scriptname RFAB_BA_Quest extends Quest  

int Property ExperienceForQuest = 5000 Auto

int Property QuestTravelStage = 20 Auto 
bool Property SetStageAfterTravel = True Auto

bool AllowToEscape = False

Function RegisterQuest()
	SendQuestEvent("RFAB_BA_Event_QuestStart")
EndFunction

Function UnRegisterQuest()
    SendQuestEvent("RFAB_BA_Event_QuestStop")
EndFunction

Function TeleportToLocation()
	ObjectReference kMarker = (GetAliasByName("LocationMarker") as ReferenceAlias).GetReference()
	Game.GetPlayer().MoveTo(kMarker)
	SendQuestEvent("RFAB_BA_Event_LocationEntry")
	Game.RequestSave()
EndFunction

bool Function IsInQuestLocation()
	ObjectReference kMarker = (GetAliasByName("LocationMarker") as ReferenceAlias).GetReference()
	return kMarker.GetCurrentLocation() == Game.GetPlayer().GetCurrentLocation()	
EndFunction

Function SetAllowToEspace(bool abAllow = true)
	AllowToEscape = abAllow
EndFunction

bool Function IsAllowedToEspace()
	return AllowToEscape
EndFunction

Function GiveExperienceForQuest()
	BizarreAdventure.GetXPScript().RewardForQuest(ExperienceForQuest)
EndFunction

Function GiveExperienceForSituation(string asText, int aiExperienceCount)
	BizarreAdventure.GetXPScript().CustomReward(asText, aiExperienceCount)
EndFunction

Function SendQuestEvent(string asEventName)
	int handle = ModEvent.Create(asEventName)
    if (handle)
        ModEvent.PushForm(handle, self as Form)
        ModEvent.Send(handle)
    endIf
EndFunction

Function SetTravelStageIfNeed()
	if SetStageAfterTravel
		self.SetStage(QuestTravelStage)
	endif
EndFunction