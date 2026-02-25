scriptName TIF__00092CD7 extends TopicInfo hidden

LeveledItem property qReward auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().AddItem(qReward as form, 1, false)
	self.getOwningQuest().setStage(89)
endFunction
