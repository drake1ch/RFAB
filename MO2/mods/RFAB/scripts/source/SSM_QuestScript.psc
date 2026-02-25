Scriptname SSM_QuestScript extends Quest

;Perk
perk Property SSM_Perk_Spear Auto
perk Property SSM_Perk_Javelin Auto
perk Property SSM_Perk_Skeleton Auto

;Keywords
keyword Property WeapTypeSpear auto
keyword Property WeapTypeJavelin auto

;-- Skeleton ----------------------------------------------------------------------------------
Function Set_Skeleton(Actor akActor)
	akActor.AddPerk(SSM_Perk_Spear)
	akActor.AddPerk(SSM_Perk_Javelin)

	bool isFemale = akActor.GetLeveledActorBase().GetSex() == 1
	weapon WeaponR = akActor.GetEquippedWeapon(false)
	
	
	if WeaponR.HasKeyword(WeapTypeSpear)
		Set_WeaponBack(akActor, isFemale, 2)
	elseif WeaponR.HasKeyword(WeapTypeJavelin)
		Set_WeaponBack(akActor, isFemale, 1)
	else
		Set_WeaponBack(akActor, isFemale, 0)
	endif

EndFunction

Function Set_WeaponBack(Actor akActor, bool isFemale, int _Switch)
	if NetImmerse.HasNode(akActor, "WeaponSpear", false)
		if _Switch == 0
			NiOverride.SetNodeDestination(akActor, false, isFemale, "WeaponSword", "NPC Pelvis [Pelv]")
			akActor.RemovePerk(SSM_Perk_Skeleton)
			;debug.Notification(akActor.GetLeveledActorBase().GetName() + " Equip Vanilla")
		else
			NiOverride.SetNodeDestination(akActor, false, isFemale, "WeaponSword", "WeaponSpear")
			akActor.AddPerk(SSM_Perk_Skeleton)
			;debug.Notification(akActor.GetLeveledActorBase().GetName() + " Equip Back")
		endif
		NiOverride.UpdateNodeTransform(akActor, false, isFemale, "WeaponSword")

		if _Switch == 2
			NiOverride.SetNodeDestination(akActor, false, isFemale, "QUIVER", "QUIVERJavelin")
		else
			NiOverride.SetNodeDestination(akActor, false, isFemale, "QUIVER", "NPC Spine2 [Spn2]")
		endif
		NiOverride.UpdateNodeTransform(akActor, false, isFemale, "QUIVER")
	else
		akActor.RemovePerk(SSM_Perk_Skeleton)
		;debug.Notification(akActor.GetLeveledActorBase().GetName() + " No Skeleton")
	endif
EndFunction

