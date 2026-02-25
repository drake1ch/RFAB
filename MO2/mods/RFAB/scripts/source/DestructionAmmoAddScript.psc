Scriptname DestructionAmmoAddScript extends ActiveMagicEffect

DestructionAmmoQuestScript Property DAQS Auto
Ammo Property defaultAmmoArrow auto
Ammo Property defaultAmmoBolt auto
Ammo[] Property NeedAmmo Auto
Ammo[] Property CreateAmmoArrow Auto
Ammo[] Property CreateAmmoBolt Auto
Message Property msg Auto

perk[] Property perkArray Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Ammo[] newAmmo = new Ammo[2]
	int i = perkArray.length - 1
	while i >= 0
		if akTarget.HasPerk(perkArray[i])

			newAmmo[0] = CreateAmmoArrow[i]
			newAmmo[1] = CreateAmmoBolt[i]
			
			DAQS.AddDestructionAmmo(akCaster, NeedAmmo, newAmmo, msg)
			return
		endif
		
		i = i - 1
	endwhile
	newAmmo[0] = defaultAmmoArrow
	newAmmo[1] = defaultAmmoBolt
	DAQS.AddDestructionAmmo(akCaster, NeedAmmo, newAmmo, msg)
EndEvent