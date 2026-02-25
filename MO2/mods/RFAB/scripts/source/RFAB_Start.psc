Scriptname RFAB_Start extends MiscObject  

LeveledItem Property Equipment Auto
LeveledItem Property Items Auto

Function Choose()
	Actor Player = Game.GetPlayer()
	Form[] Equip = PO3_SKSEFunctions.GetContentFromLeveledItem(Equipment, Player)

	Player.AddItem(Items)
	int i = 0
	while i < Equip.Length
		Player.EquipItem(Equip[i])
		i += 1
	endwhile
EndFunction