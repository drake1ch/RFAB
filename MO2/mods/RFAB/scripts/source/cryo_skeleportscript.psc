Scriptname cryo_SkeleportScript extends ActiveMagicEffect

ReferenceAlias[] Property SkeleportQueue Auto
Spell Property ZombieBonus01 Auto
Spell Property ZombieBonus02 Auto
Perk Property ArchersPerk Auto
Race Property WerewolfRace Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor TempActor
	Int i = 0
	While i < SkeleportQueue.Length
		TempActor = SkeleportQueue[i].GetRef() as Actor
		If TempActor
			TempActor.StopCombat()
			TempActor.MoveTo(akCaster)
			If !TempActor.HasSpell(ZombieBonus01) && !TempActor.HasSpell(ZombieBonus02) && (TempActor.HasPerk(ArchersPerk) || TempActor.GetRace() == WerewolfRace)
				TempActor.Disable()
				TempActor.Enable()
			EndIf
		EndIf
		i += 1
	EndWhile
EndEvent