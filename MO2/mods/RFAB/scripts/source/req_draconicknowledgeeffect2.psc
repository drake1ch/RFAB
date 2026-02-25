scriptName Req_DraconicKNowledgeEffect2 extends activemagiceffect

spell property DraconicKnowledgeProperty auto
perk property DraconicKnowledgePerk auto
Float property SoulsCount auto

function OnEffectStart(Actor Caster, Actor Target)

	game.GetPlayer().ModActorValue("DragonSouls", SoulsCount as Float)
	utility.Wait(0.100000)
	game.GetPlayer().RemovePerk(DraconicKnowledgePerk)
	game.GetPlayer().RemoveSpell(DraconicKnowledgeProperty)
endFunction