Scriptname cryo_SkeleportQueueRefreshScript extends ActiveMagicEffect

ReferenceAlias[] Property SkeleportQueue Auto
Spell Property ZombieBonus01 Auto
Spell Property ZombieBonus02 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int i = 0
	While i < SkeleportQueue.Length
		If SkeleportQueue[i].GetRef() as Actor == akTarget
			Return
		EndIf
		i += 1
	EndWhile
	i = 0
	While i < SkeleportQueue.Length
		If SkeleportQueue[i].ForceRefIfEmpty(akTarget)
			Return
		EndIf
		i += 1
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Int i = 0
	Actor TempActor
	While i < SkeleportQueue.Length
		If SkeleportQueue[i]
			TempActor = SkeleportQueue[i].GetRef() as Actor
			If TempActor
				If TempActor.IsDeleted() || TempActor.IsDead()
					TempActor.RemoveSpell(ZombieBonus01)
					TempActor.RemoveSpell(ZombieBonus02)
					SkeleportQueue[i].Clear()
				EndIf
			Else
				SkeleportQueue[i].Clear()
			EndIf
		EndIf
		i += 1
	EndWhile
EndEvent