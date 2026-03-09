scriptName dunForelhostEquipMaskScript extends referenceAlias
{this script should get the dragon priest to equip his mask}

armor property DragonPriestMaskGreenstone01 auto

;USKP 1.3.3 - Rewrote this as it did not work. Created duplicates.
event onLoad()
	Actor Raghot = self.GetActorReference()
	
	if( Raghot.IsEquipped(DragonPriestMaskGreenstone01) == 0 )
		Raghot.EquipItem(DragonPriestMaskGreenstone01)
	EndIf
endEvent
