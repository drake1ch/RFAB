Scriptname RFAB_BA_BizarreSewersScript extends Quest  

Potion Property Steak Auto

Event OnInit()
	RegisterForMenu("Crafting Menu")
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("Crafting Menu")
EndEvent

Event OnMenuClose(String MenuName)

	if MenuName == "Crafting Menu"

		if GetStage() == 40

			if Game.GetPlayer().GetItemCount(Steak) > 0
				SetStage(100)
			endif

		endif

	endif

EndEvent