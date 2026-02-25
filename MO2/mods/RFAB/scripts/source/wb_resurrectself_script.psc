Scriptname WB_ResurrectSelf_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_R100_Deathless_Spell_PC Auto
Sound Property WB_Sound Auto
ReferenceAlias Property WB_TheDeathless Auto
Float Property WB_Heal Auto
ImagespaceModifier Property WB_RestorationHeal_Imod_DefyDeath Auto
Explosion Property WB_RestorationHeal_Explosion_DefyDeath Auto
Float Property WB_Register Auto

; -----

Actor TargetActor
Actor CasterActor
Spell LeftSpell
Spell RightSpell

; -----

Event OnEnterBleedout()

	UnregisterForUpdate()
	Float TargetHealth = TargetActor.GetActorValue("Health")
	If TargetHealth <= 0
		TargetActor.RestoreActorValue("Health", WB_Heal - TargetHealth)
	EndIf
	CasterActor.DoCombatSpellApply(WB_S_R100_Deathless_Spell_PC, TargetActor)
	TargetActor.PlaceAtMe(WB_RestorationHeal_Explosion_DefyDeath)
	WB_RestorationHeal_Imod_DefyDeath.Apply()
	If LeftSpell
		TargetActor.EquipSpell(LeftSpell, 0)
	EndIf
	If RightSpell
		TargetActor.EquipSpell(RightSpell, 1)
	EndIf
	Dispel()

EndEvent

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.2)
	TargetActor = akTarget
	Casteractor = akCaster
	LeftSpell = TargetActor.GetEquippedSpell(0)
	RightSpell = TargetActor.GetEquippedSpell(1)
	WB_TheDeathless.ForceRefTo(akTarget)
	RegisterForSingleUpdate(WB_Register)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_TheDeathless.Clear()

EndEvent

; -----

Event OnUpdate()

	RegisterForSingleUpdate(WB_Register)
	LeftSpell = TargetActor.GetEquippedSpell(0)
	RightSpell = TargetActor.GetEquippedSpell(1)

EndEvent

; -----