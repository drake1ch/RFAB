ScriptName PlayerSleepQuestScript extends Quest

Actor Property Player Auto

Spell Property Rested Auto
Spell Property WellRested Auto
Spell Property MarriageSleepAbility Auto
Spell Property BYOHAdoptionSleepAbilityMale Auto
Spell Property BYOHAdoptionSleepAbilityFemale Auto

ReferenceAlias Property LoveInterest Auto
LocationAlias Property CurrentHomeLocation Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypePlayerHouse Auto

Quest Property RelationshipMarriageFIN Auto
Quest Property BYOHRelationshipAdoption Auto

CompanionsHousekeepingScript Property CHScript Auto

Message Property RestedMessage  Auto  
Message Property WellRestedMessage  Auto  
Message Property MarriageRestedMessage  Auto  
Message Property BYOHAdoptionRestedMessageMale  Auto  
Message Property BYOHAdoptionRestedMessageFemale  Auto  

Message Property BeastBloodMessage  Auto
Message Property UndeadMessage Auto

Keyword Property ActorTypeUndead Auto
Spell Property WerewolfChange Auto
Spell Property HircineCurse Auto

Perk Property CheerfulnessPerk Auto

Event OnSleepStop(bool abInterrupted)
	if (Player.HasPerk(CheerfulnessPerk))
		if (abInterrupted)
			return
		elseif (Player.HasKeyword(ActorTypeUndead))
			UndeadMessage.Show()
			return
		elseif (Player.HasSpell(WerewolfChange) || Player.HasSpell(HircineCurse))
			BeastBloodMessage.Show()
			return
		endif
		WellRested.Cast(Player)
		WellRestedMessage.Show()
	endif
EndEvent