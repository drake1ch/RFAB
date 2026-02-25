Scriptname BoundArmorRemoveScript extends ObjectReference

Sound Property sndDeactivate Auto
Armor Property boundArmorPiece Auto
EffectShader Property boundEffect Auto
EffectShader Property boundEffect2 Auto

Event OnUnequipped(Actor akActor)
	
	sndDeactivate.Play(Game.GetPlayer())
	Game.GetPlayer().RemoveItem(boundArmorPiece, 1, true)
	Self.Delete()
	boundEffect.Stop(akActor)
	boundEffect2.Stop(akActor)

EndEvent
