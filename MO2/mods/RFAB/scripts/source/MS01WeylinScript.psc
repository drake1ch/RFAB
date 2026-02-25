ScriptName MS01WeylinScript extends ReferenceAlias

ReferenceAlias Property Eltrys Auto
Quest Property MS01IntroWorldScene Auto
Quest Property MS01IntroReworked Auto 

Event OnDeath(Actor akKiller)

	Game.GetPlayer().RemoveFromFaction(GuardFactionMarkarth)
	MS01IntroWorldScene.SetStage(200)
	MS01IntroReworked.SetStage(10) ; Edited by RFAB

EndEvent

Faction Property GuardFactionMarkarth  Auto  
