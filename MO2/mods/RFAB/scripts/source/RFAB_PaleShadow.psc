Scriptname RFAB_PaleShadow extends ActiveMagicEffect  

Spell Property ShadowAbility Auto

Faction Property MagicAllegiance Auto
Faction Property WB_IllusoryEntity_Faction Auto
Faction Property PlayerFaction Auto

float Property CopyHealthPercent = 0.5 Auto

Actor Shadow

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Shadow = RFAB_PapyrusFunctions.CopyActor(akTarget)
	utility.wait(0.1)
	
	Shadow.SetDisplayName("Ѕледна¤ тень")
	
 	Shadow.AddToFaction(MagicAllegiance)
	Shadow.AddToFaction(WB_IllusoryEntity_Faction)
	Shadow.AddToFaction(PlayerFaction)

 	Shadow.ForceActorValue("Health", akTarget.GetActorValueMax("Health") * CopyHealthPercent)
	Shadow.ForceActorValue("Infamy", -1)

 	Shadow.SetPlayerTeammate(true, false) 

	Shadow.EnableNoWait()
	Shadow.AddSpell(ShadowAbility)

	akTarget.StopCombatAlarm()
	akTarget.StartCombat(Shadow)
	Shadow.StopCombatAlarm()
	Shadow.StartCombat(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Shadow.RemoveSpell(ShadowAbility)
EndEvent