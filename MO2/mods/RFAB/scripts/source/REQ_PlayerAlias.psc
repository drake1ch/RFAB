Scriptname REQ_PlayerAlias extends ReferenceAlias
{template for reference alias scripts performing player-specific tasks}

Actor Property Player Auto Hidden
{will be filled automatically on start-up}

Event OnInit()
	Player = Game.GetPlayer()
	OnAliasInit()
EndEvent

Event OnAliasInit()
EndEvent