scriptName TIF__00034B3B extends TopicInfo hidden

Perk Property SellPerk Auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.SetRelationshipRank(game.GetPlayer(), 1)
	game.GetPlayer().AddPerk(SellPerk)
	debug.Notification("Анжелина сделала для вас небольшую скидку на свои товары")
	self.GetOwningQuest().Setstage(30)
endFunction