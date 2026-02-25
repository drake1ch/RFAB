Scriptname RFAB_Script_AddToFaction extends Actor

Event OnInit()
	Self.AddToFaction(TheFaction)
EndEvent

Faction Property TheFaction  Auto  
