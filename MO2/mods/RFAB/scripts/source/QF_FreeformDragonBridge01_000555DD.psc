Scriptname QF_FreeformDragonBridge01_000555DD Extends Quest Hidden


referencealias Property Alias_Olda Auto

referencealias Property Alias_QuestItem Auto

referencealias Property Alias_Horgeir Auto

RFAB_XP_Handler Property Xp  Auto  

Function Fragment_0()
	;Freeform started
	SetObjectiveDisplayed(10, 1)
	;Enable Quest Item
	Alias_QuestItem.GetRef().Enable()
EndFunction

Function Fragment_1()
	;Player has the item
	SetObjectiveCompleted(10, 1)
	SetObjectiveDisplayed(20, 1)
EndFunction

Function Fragment_2()
	;Player gives the mead to Olda
	Alias_Olda.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
	Alias_Horgeir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
	SetObjectiveCompleted(20, 1)
	Stop()
EndFunction

Function Fragment_3()
	;Player gives the mead to Horgeir
	Alias_Horgeir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
	Alias_Olda.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
	SetObjectiveFailed(20, 1)
	XP.OnQuestComplete(self)
	Stop()
EndFunction

Function Fragment_4()
	UnRegisterForUpdate()
	FailAllObjectives()
	Stop()
EndFunction
