Scriptname WB_ReconfigureCraftlord_Script extends activemagiceffect  

; -----

Message Property WB_ConjurationDwemer_Message_ReconfigureCraftlord Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_UnspentPoints Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_HealthMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_MagickaMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_StaminaMult Auto

Message Property WB_ConjurationDwemer_Message_ReconfigureCraftlord_Attributes Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_AttackMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult Auto

Message Property WB_ConjurationDwemer_Message_ReconfigureCraftlord_Weapon Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_SpellMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult Auto

Message Property WB_ConjurationDwemer_Message_ReconfigureCraftlord_Magic Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_Armor Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_MagicResist Auto

Message Property WB_ConjurationDwemer_Message_ReconfigureCraftlord_Defense Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_ToggleDuration Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_ToggleHalfCost Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_ToggleOnlyOne Auto

Message[] Property WB_ConjurationDwemer_Message_ReconfigureCraftlord_Special Auto

Spell Property WB_C100_ConjureCraftlord_Spell_PC Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Game.GetPlayer().DispelSpell(WB_C100_ConjureCraftlord_Spell_PC)

	Int MainMenuOption = -1
	Int SubMenuOption = -1
	Int SubMenuBitmask = -1

	While MainMenuOption != 5
		SubMenuOption = -1
		MainMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord.Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue())

		If MainMenuOption == 0
			; attributes
			While SubMenuOption != 6
				SubMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord_Attributes.Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue(), (WB_Conjuration_ConjureCraftlord_Global_HealthMult.GetValue() - 1) * 100, (WB_Conjuration_ConjureCraftlord_Global_MagickaMult.GetValue() - 1) * 100, (WB_Conjuration_ConjureCraftlord_Global_StaminaMult.GetValue() - 1) * 100)
				If SubMenuOption == 0
					; raise health
					WB_Conjuration_ConjureCraftlord_Global_HealthMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-2)
				ElseIf SubMenuOption == 1
					; raise magicka
					WB_Conjuration_ConjureCraftlord_Global_MagickaMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-1)
				ElseIf SubMenuOption == 2
					; raise stamina
					WB_Conjuration_ConjureCraftlord_Global_StaminaMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-1)
				ElseIf SubMenuOption == 3
					; lower health
					WB_Conjuration_ConjureCraftlord_Global_HealthMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(2)
				ElseIf SubMenuOption == 4
					; lower magicka
					WB_Conjuration_ConjureCraftlord_Global_MagickaMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(1)
				ElseIf SubMenuOption == 5
					; lower stamina
					WB_Conjuration_ConjureCraftlord_Global_StaminaMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(1)
				EndIf
			EndWhile

		ElseIf MainMenuOption == 1
			; weapon
			While SubMenuOption != 4
				SubMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord_Weapon.Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue(), (WB_Conjuration_ConjureCraftlord_Global_AttackMult.GetValue() - 1) * 100, (WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult.GetValue() - 1) * 100)
				If SubMenuOption == 0
					; raise attack damage
					WB_Conjuration_ConjureCraftlord_Global_AttackMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-2)
				ElseIf SubMenuOption == 1
					; raise power attack damage
					WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-1)
				ElseIf SubMenuOption == 2
					; lower attack damage
					WB_Conjuration_ConjureCraftlord_Global_AttackMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(2)
				ElseIf SubMenuOption == 3
					; lower power attack damage
					WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(1)
				EndIf
			EndWhile

		ElseIf MainMenuOption == 2
			; magic
			While SubMenuOption != 4
				SubMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord_Magic.Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue(), (WB_Conjuration_ConjureCraftlord_Global_SpellMult.GetValue() - 1) * 100, (WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult.GetValue() - 1) * 100)
				If SubMenuOption == 0
					; raise attack damage
					WB_Conjuration_ConjureCraftlord_Global_SpellMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-2)
				ElseIf SubMenuOption == 1
					; raise power attack damage
					WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult.Mod(0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-1)
				ElseIf SubMenuOption == 2
					; lower attack damage
					WB_Conjuration_ConjureCraftlord_Global_SpellMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(2)
				ElseIf SubMenuOption == 3
					; lower power attack damage
					WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult.Mod(-0.25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(1)
				EndIf
			EndWhile

		ElseIf MainMenuOption == 3
			; defense
			While SubMenuOption != 4
				SubMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord_Defense.Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue(), WB_Conjuration_ConjureCraftlord_Global_Armor.GetValue(), WB_Conjuration_ConjureCraftlord_Global_MagicResist.GetValue())
				If SubMenuOption == 0
					; raise armor
					WB_Conjuration_ConjureCraftlord_Global_Armor.Mod(50)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-1)
				ElseIf SubMenuOption == 1
					; raise magic resist
					WB_Conjuration_ConjureCraftlord_Global_MagicResist.Mod(25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-2)
				ElseIf SubMenuOption == 2
					; lower armor
					WB_Conjuration_ConjureCraftlord_Global_Armor.Mod(-50)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(1)
				ElseIf SubMenuOption == 3
					; lower magic resist
					WB_Conjuration_ConjureCraftlord_Global_MagicResist.Mod(-25)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(2)
				EndIf
			EndWhile

		ElseIf MainMenuOption == 4
			; special
			While SubMenuOption != 6
				SubMenuBitmask = (WB_Conjuration_ConjureCraftlord_Global_ToggleDuration.GetValue() + (WB_Conjuration_ConjureCraftlord_Global_ToggleHalfCost.GetValue() * 2) + (WB_Conjuration_ConjureCraftlord_Global_ToggleOnlyOne.GetValue() * 4)) as Int
				SubMenuOption = WB_ConjurationDwemer_Message_ReconfigureCraftlord_Special[SubMenuBitmask].Show(WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.GetValue())
				If SubMenuOption == 0
					; turn on infinite duration
					WB_Conjuration_ConjureCraftlord_Global_ToggleDuration.SetValue(1)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-10)
				ElseIf SubMenuOption == 1
					; turn on half cost
					WB_Conjuration_ConjureCraftlord_Global_ToggleHalfCost.SetValue(1)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-5)
				ElseIf SubMenuOption == 2
					; turn on summon limit
					WB_Conjuration_ConjureCraftlord_Global_ToggleOnlyOne.SetValue(1)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(5)
				ElseIf SubMenuOption == 3
					; turn off infinite duration
					WB_Conjuration_ConjureCraftlord_Global_ToggleDuration.SetValue(0)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(10)
				ElseIf SubMenuOption == 4
					; turn off half cost
					WB_Conjuration_ConjureCraftlord_Global_ToggleHalfCost.SetValue(0)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(5)
				ElseIf SubMenuOption == 5
					; turn off summon limit
					WB_Conjuration_ConjureCraftlord_Global_ToggleOnlyOne.SetValue(0)
					WB_Conjuration_ConjureCraftlord_Global_UnspentPoints.Mod(-5)
				EndIf
			EndWhile

		Else
			; ok
		EndIf
	EndWhile

EndEvent

; -----