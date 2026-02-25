scriptName TIF__000946F6 extends TopicInfo hidden

Weapon property PJarlSword auto
MiscObject property pGold auto
Quest property WhiterunSwordQuest auto
GlobalVariable property pFavorReward auto
ReferenceAlias property pProventusAlias auto
ReferenceAlias property pAdrianneAlias auto
LeveledItem property qReward auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().AddItem(qReward as form, 1, false)
	pProventusAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt())
	pAdrianneAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt())
	WhiterunSwordQuest.SetStage(200)
endFunction