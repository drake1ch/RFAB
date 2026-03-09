Scriptname USKP_C04KodlakRefScript extends Actor  

Armor Property ArmorCompanionsCuirass Auto
Armor Property ArmorCompanionsBoots Auto
Armor Property ArmorCompanionsGauntlets Auto

Event OnLoad()
	EquipItem(ArmorCompanionsCuirass)
	EquipItem(ArmorCompanionsBoots)
	EquipItem(ArmorCompanionsGauntlets)
EndEvent
