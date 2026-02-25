Scriptname SSM_WeaponScript extends ObjectReference  

SSM_QuestScript Property SSM_Quest Auto

Event OnEquipped(Actor akActor)
	;debug.Notification("SSM_Weapon Equip")
	SSM_Quest.Set_Skeleton(akActor)
EndEvent

Event OnUnEquipped(Actor akActor)
	;debug.Notification("SSM_Weapon UnEquip")
	SSM_Quest.Set_Skeleton(akActor)
EndEvent

