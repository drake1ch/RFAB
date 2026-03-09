Scriptname USLP_DB10VeezaraRefScript extends Actor  

Armor Property DBArmor Auto
Armor Property DBArmorBoots Auto
Armor Property DBArmorGloves Auto

Event OnLoad()
	EquipItem(DBArmor)
	EquipItem(DBArmorBoots)
	EquipItem(DBArmorGloves)
EndEvent
