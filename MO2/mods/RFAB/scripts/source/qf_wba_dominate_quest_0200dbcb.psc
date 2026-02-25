;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WBA_Dominate_Quest_0200DBCB Extends Quest Hidden

;BEGIN ALIAS PROPERTY WBA_Dominate_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WBA_Dominate_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WBA_Dominate_Target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WBA_Dominate_Target Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
If TargetActorRef
	Debug.Trace("APOCALYPSE DEBUG: Obedience cleared from target " + TargetActorRef)
	PlayerRef.RemoveSpell(WBA_S_I075_Obedience_Spell_PC)
	TargetActorRef.SetPlayerTeammate(false, false)
	TargetActorRef.RemoveFromFaction(MagicAllegianceFaction)
	TargetActorRef.Kill(PlayerRef)
	WBA_IllusionPuppeteer_Message_ObedienceRelease.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
TargetActorRef = Alias_WBA_Dominate_Target.GetActorRef()
If TargetActorRef
	Debug.Trace("APOCALYPSE DEBUG: Obedience called to target " + TargetActorRef, 0)
	TargetActorRef.AddSpell(WBA_Ab_I075_Obedience_Spell_PC,false)
	TargetActorRef.AddToFaction(MagicAllegianceFaction)
	PlayerRef.StopCombat()
	TargetActorRef.StopCombat()
	TargetActorRef.SetPlayerTeammate(true, true)
	TargetActorRef.RemoveFromAllFactions()
	PlayerRef.AddSpell(WBA_S_I075_Obedience_Spell_PC,false)
	WB_IllusionPuppeteer_Imod_PullTheirStringsEnd.Apply()
	WBA_IllusionPuppeteer_Message_Obedience.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor TargetActorRef
Actor Property PlayerRef  Auto  
Faction Property MagicAllegianceFaction  Auto  

Message Property WBA_IllusionPuppeteer_Message_Obedience  Auto  

SPELL Property WBA_S_I075_Obedience_Spell_PC  Auto  

SPELL Property WBA_Ab_I075_Obedience_Spell_PC  Auto  

Message Property WBA_IllusionPuppeteer_Message_ObedienceRelease  Auto  

ImageSpaceModifier Property WB_IllusionPuppeteer_Imod_PullTheirStringsEnd  Auto  
