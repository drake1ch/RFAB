Scriptname RFAB_GlobalsSetter extends Quest  

RFAB_PerkGlobal[] Property Perks Auto

Actor Property PlayerRef Auto

Event OnInit()
	RegisterForMenu("StatsMenu")
	RegisterForMenu("Journal Menu")
	RegisterForModEvent("RFAB_PlayerStartGame", "OnPlayerStartGame")
EndEvent

Event OnPlayerStartGame()
	Evaluate()
	UnregisterForAllModEvents()
EndEvent

Event OnMenuClose(string asMenuName)
	Evaluate()
EndEvent

Function Evaluate()
	bool bUpdateVendors = false
	int i = 0
	while (i < Perks.Length)
		RFAB_PerkGlobal kPerk = Perks[i]
		if (PlayerRef.HasPerk(kPerk) && !kPerk.IsValueEqual())
			kPerk.ApplyValue()
			if (kPerk.UpdateVendors)
				bUpdateVendors = true
			endif
		endif
		i += 1
	endwhile

	if (bUpdateVendors)
		RFAB_PapyrusFunctions.UpdateVendors()
	endif
EndFunction