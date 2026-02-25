;/ Decompiled by Champollion V1.0.1
Source   : TIF__000871BA.psc
Modified : 2024-06-25 23:32:40
Compiled : 2024-06-25 23:32:41
User     : user
Computer : WIN-2V1G9CFBKBS
/;
scriptName TIF__000871BA extends TopicInfo hidden

;-- Properties --------------------------------------
quest property MS01 auto
faction property CrimeFactionReach auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	self.GetOwningQuest().SetStage(5)
	MS01.SetStage(95)
endFunction
