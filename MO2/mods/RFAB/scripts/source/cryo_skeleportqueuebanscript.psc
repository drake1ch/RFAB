Scriptname cryo_SkeleportQueueBanScript extends ActiveMagicEffect

ReferenceAlias[] Property SkeleportQueue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int i = 0
	While i < SkeleportQueue.Length
		If SkeleportQueue[i].GetRef() as Actor == akTarget
			SkeleportQueue[i].Clear()
		EndIf
		i += 1
	EndWhile
EndEvent