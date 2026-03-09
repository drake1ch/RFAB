Scriptname TGTQ04QuestScript extends Quest  Conditional

Cell Property pTGTQ04NiranyesHouse Auto Conditional
ObjectReference Property pTGTQ04CampMarker  Auto  Conditional
ObjectReference Property pTGTQ04Banner  Auto  Conditional
Armor Property pTGTQ04Locket Auto Conditional
Quest Property pTGRShellQuest Auto Conditional

Event OnUpdate()

	if GetStage() >= 40 && GetStage() < 50
		if Game.GetPlayer().GetDistance(pTGTQ04CampMarker) < 1000
			SetStage(50)
		endif
	endif


	if GetStageDone(55) == 0
		if Game.GetPlayer().GetDistance(pTGTQ04Banner) < 500
			SetStage(55)
		endif
	endif

	;USKP 2.0.9 Bug #18551 - Set to check 65 since that's when the banner will be destroyed.
	if GetStage() < 65
		RegisterforSingleUpdate(1)
	endif

EndEvent

