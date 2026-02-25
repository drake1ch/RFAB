Scriptname RFAB_DragonScroll extends ObjectReference  

; absorb effects (from MQ105TombScript):
Sound property NPCDragonDeathSequenceWind Auto
Sound property NPCDragonDeathSequenceExplosion Auto
EffectShader Property DragonPowerAbsorbFXS Auto

Book Property SelfRef Auto

Event OnEquipped(Actor akActor)
    Learn(akActor)
EndEvent

Function Learn(Actor akActor)
	akActor.RemoveItem(SelfRef, 1)
	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.Play(akActor) 
	NPCDragonDeathSequenceExplosion.Play(akActor) 
	Utility.Wait(0.1)
	; On man power absorb effect shader.
	DragonPowerAbsorbFXS.Play(akActor)
	Utility.Wait(4)
	;Stop fx shader on player showing power absorb.
	DragonPowerAbsorbFXS.Stop(akActor)
	akActor.ModActorValue("DragonSouls", 1)
EndFunction