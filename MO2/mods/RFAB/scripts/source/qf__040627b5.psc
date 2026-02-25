;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF__040627B5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY tos_Combatant01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_Combatant01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_ArenaLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_tos_ArenaLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_EnemySpawn02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_EnemySpawn02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_ExitTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_ExitTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_PitMasterAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_PitMasterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_PlayerPrepSpawnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_PlayerPrepSpawnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_TrainingHallLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_tos_TrainingHallLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_PlayerSpawnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_PlayerSpawnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_ClutterRewardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_ClutterRewardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_CombatantChampionAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_CombatantChampionAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_Combatant02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_Combatant02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_EnemySpawn01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_EnemySpawn01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tos_PlayerBaseSpawnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tos_PlayerBaseSpawnAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE tos_DLC_ArenaQuestScript
Quest __temp = self as Quest
tos_DLC_ArenaQuestScript kmyQuest = __temp as tos_DLC_ArenaQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndArena()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE tos_DLC_ArenaQuestScript
Quest __temp = self as Quest
tos_DLC_ArenaQuestScript kmyQuest = __temp as tos_DLC_ArenaQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TravelToArena()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
