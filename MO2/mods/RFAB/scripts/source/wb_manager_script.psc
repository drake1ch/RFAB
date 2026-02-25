Scriptname WB_Manager_Script extends Quest  

; -----

Spell Property WB_Unified_Spell_Ab Auto
Spell Property WB_Books_Spell_Ab Auto

; -----

Event OnInit()

	RegisterForSingleUpdateGameTime(96.0)

EndEvent

; -----

Event OnUpdateGameTime()

	RegisterForSingleUpdateGameTime(96.0)
	Actor ThePlayer = Game.GetPlayer()
	Debug.Trace("APOCALYPSE DEBUG: Resetting Unified Ab to work around the ability condition bug", 0)
	ThePlayer.RemoveSpell(WB_Unified_Spell_Ab)
	ThePlayer.RemoveSpell(WB_Books_Spell_Ab)
	Utility.Wait(1.0)
	ThePlayer.AddSpell(WB_Unified_Spell_Ab,false)
	ThePlayer.AddSpell(WB_Books_Spell_Ab,false)

EndEvent

; -----