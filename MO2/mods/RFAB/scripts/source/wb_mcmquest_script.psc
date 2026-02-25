Scriptname WB_MCMQuest_Script extends SKI_ConfigBase

; -----

ReferenceAlias Property Kyrgar Auto

String Property WB_Header_Troubleshooting Auto
String Property WB_Header_Features Auto
String Property WB_Header_Alteration Auto
String Property WB_Header_Conjuration Auto
String Property WB_Header_Destruction Auto
String Property WB_Header_Illusion Auto
String Property WB_Header_Restoration Auto
String Property WB_Header_Experience Auto

String Property WB_General_Setting_XP Auto
String Property WB_General_Setting_Repopulate Auto
String Property WB_Illusion_Setting_AllowNNPC Auto
String Property WB_Vendor_Setting_EnableKyrgar Auto
String Property WB_Alteration_ThrummingStone_Setting_Delay Auto
String Property WB_Alteration_TranasasReversal_Setting_XP Auto
String Property WB_Alteration_Undermine_Setting_Mult Auto
String Property WB_Alteration_Undermine_Setting_XP Auto
String Property WB_Alteration_Wither_Setting_Race Auto
String Property WB_Conjuration_ConjureAvengingWraith_Setting_Mult Auto
String Property WB_Conjuration_ConjureDremoraAssassin_Setting_Health Auto
String Property WB_Conjuration_ConjureLich_Setting_Cost Auto
String Property WB_Conjuration_AtronachMark_Setting_XP Auto
String Property WB_Destruction_Shockbloom_Setting_Percentage Auto
String Property WB_Destruction_Shockbloom_Setting_XP Auto
String Property WB_Destruction_ShockScythe_Setting_Threshold Auto
String Property WB_Illusion_Counterspell_Setting_Percentage Auto
String Property WB_Illusion_PaleMoon_Setting_Drain Auto
String Property WB_Illusion_HarrowingDirge_Setting_Percentage Auto
String Property WB_Illusion_Lobotomize_Setting_Mult Auto
String Property WB_Illusion_Lobotomize_Setting_XP Auto
String Property WB_Illusion_MagickaVoid_Setting_XP Auto
String Property WB_Illusion_CloakOfMimicry_Setting_XP Auto
String Property WB_Illusion_EmpathicAgony_Setting_XP Auto
String Property WB_Illusion_HarrowingDirge_Setting_XP Auto
String Property WB_Illusion_ScreamOfPain_Setting_XP Auto
String Property WB_Restoration_Bleedout_Setting_Threshold Auto
String Property WB_Restoration_CullingRune_Setting_Threshold Auto
String Property WB_Restoration_FingerOfDeath_Setting_Percentage Auto
String Property WB_Restoration_Bloodseeker_Setting_Mult Auto
String Property WB_Restoration_Bloodseeker_Setting_XP Auto
String Property WB_Restoration_CullingRune_Setting_XP Auto
String Property WB_Restoration_KingsHeart_Setting_EnableCraftingSkills Auto

GlobalVariable Property WB_General_Global_XP Auto
GlobalVariable Property WB_Illusion_Global_AllowNNPC auto
GlobalVariable Property WB_Alteration_ThrummingStone_Global_Delay Auto
GlobalVariable Property WB_Alteration_TranasasReversal_Global_XP Auto
GlobalVariable Property WB_Alteration_Undermine_Global_Mult Auto
GlobalVariable Property WB_Alteration_Undermine_Global_XP Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Mult Auto
GlobalVariable Property WB_Conjuration_ConjureDremoraAssassin_Global_Health Auto
GlobalVariable Property WB_Conjuration_ConjureLich_Global_Cost Auto
GlobalVariable Property WB_Conjuration_ConjureLich_Global_Cost_DualCast Auto
GlobalVariable Property WB_Conjuration_AtronachMark_Global_XP Auto
GlobalVariable Property WB_Destruction_Shockbloom_Global_Percentage Auto
GlobalVariable Property WB_Destruction_Shockbloom_Global_XP Auto
GlobalVariable Property WB_Destruction_ShockScythe_Global_Threshold Auto
GlobalVariable Property WB_Illusion_Counterspell_Global_Percentage Auto
GlobalVariable Property WB_Illusion_PaleMoon_Global_Drain Auto
GlobalVariable Property WB_Illusion_HarrowingDirge_Global_Percentage Auto
GlobalVariable Property WB_Illusion_Lobotomize_Global_Mult Auto
GlobalVariable Property WB_Illusion_Lobotomize_Global_XP Auto
GlobalVariable Property WB_Illusion_MagickaVoid_Global_XP Auto
GlobalVariable Property WB_Illusion_CloakOfMimicry_Global_XP Auto
GlobalVariable Property WB_Illusion_EmpathicAgony_Global_XP Auto
GlobalVariable Property WB_Illusion_HarrowingDirge_Global_XP Auto
GlobalVariable Property WB_Illusion_ScreamOfPain_Global_XP Auto
GlobalVariable Property WB_Restoration_Bleedout_Global_Threshold Auto
GlobalVariable Property WB_Restoration_CullingRune_Global_Threshold Auto
GlobalVariable Property WB_Restoration_FingerOfDeath_Global_Percentage Auto
GlobalVariable Property WB_Restoration_Bloodseeker_Global_Mult Auto
GlobalVariable Property WB_Restoration_Bloodseeker_Global_XP Auto
GlobalVariable Property WB_Restoration_CullingRune_Global_XP Auto
GlobalVariable Property WB_Restoration_KingsHeart_Global_EnableCraftingSkills Auto

String Property WB_General_Highlight_XP Auto
String Property WB_General_Highlight_Repopulate Auto
String Property WB_Illusion_Highlight_AllowNNPC auto
String Property WB_Vendor_Highlight_EnableKyrgar auto
String Property WB_Alteration_ThrummingStone_Highlight_Delay Auto
String Property WB_Alteration_TranasasReversal_Highlight_XP Auto
String Property WB_Alteration_Undermine_Highlight_Mult Auto
String Property WB_Alteration_Undermine_Highlight_XP Auto
String Property WB_Conjuration_ConjureAvengingWraith_Highlight_Mult Auto
String Property WB_Conjuration_ConjureLich_Highlight_Cost Auto
String Property WB_Conjuration_ConjureDremoraAssassin_Highlight_Health Auto
String Property WB_Conjuration_AtronachMark_Highlight_XP Auto
String Property WB_Destruction_Shockbloom_Highlight_Percentage Auto
String Property WB_Destruction_Shockbloom_Highlight_XP Auto
String Property WB_Destruction_ShockScythe_Highlight_Threshold Auto
String Property WB_Illusion_Counterspell_Highlight_Percentage Auto
String Property WB_Illusion_PaleMoon_Highlight_Drain Auto
String Property WB_Illusion_HarrowingDirge_Highlight_Percentage Auto
String Property WB_Illusion_Lobotomize_Highlight_Mult Auto
String Property WB_Illusion_Lobotomize_Highlight_XP Auto
String Property WB_Illusion_MagickaVoid_Highlight_XP Auto
String Property WB_Illusion_CloakOfMimicry_Highlight_XP Auto
String Property WB_Illusion_EmpathicAgony_Highlight_XP Auto
String Property WB_Illusion_HarrowingDirge_Highlight_XP Auto
String Property WB_Illusion_ScreamOfPain_Highlight_XP Auto
String Property WB_Restoration_Bleedout_Highlight_Threshold Auto
String Property WB_Restoration_CullingRune_Highlight_Threshold Auto
String Property WB_Restoration_FingerOfDeath_Highlight_Percentage Auto
String Property WB_Restoration_Bloodseeker_Highlight_Mult Auto
String Property WB_Restoration_Bloodseeker_Highlight_XP Auto
String Property WB_Restoration_CullingRune_Highlight_XP Auto
String Property WB_Restoration_KingsHeart_Highlight_EnableCraftingSkills Auto

String Property WB_General_Format_XP Auto
String Property WB_Alteration_ThrummingStone_Format_Delay Auto
String Property WB_Alteration_Undermine_Format_Mult Auto
String Property WB_Conjuration_ConjureAvengingWraith_Format_Mult Auto
String Property WB_Conjuration_ConjureLich_Format_Cost Auto
String Property WB_Conjuration_ConjureDremoraAssassin_Format_Health Auto
String Property WB_Destruction_Shockbloom_Format_Percentage Auto
String Property WB_Destruction_ShockScythe_Format_Threshold Auto
String Property WB_Illusion_Counterspell_Format_Percentage Auto
String Property WB_Illusion_PaleMoon_Format_Drain Auto
String Property WB_Illusion_HarrowingDirge_Format_Percentage Auto
String Property WB_Illusion_Lobotomize_Format_Mult Auto
String Property WB_Illusion_CloakOfMimicry_Format_XP Auto
String Property WB_Restoration_Bleedout_Format_Threshold Auto
String Property WB_Restoration_Bloodseeker_Format_Mult Auto
String Property WB_Restoration_CullingRune_Format_Threshold Auto
String Property WB_Restoration_FingerOfDeath_Format_Percentage Auto

; -----

Int IDXP
Int IDRepopulate
Int IDAllowNNPC
Int IDEnableKyrgar

Int IDAThrummingStoneDelay
Int IDATranasasReversalXP
Int IDAUndermineMult
Int IDAUndermineXP

Int IDCConjureAvengingWraithMult
Int IDCConjureLichCost
Int IDCConjureDremoraAssassinHealth
Int IDCAtronachMarkXP

Int IDDShockbloomPercentage
Int IDDShockbloomXP
Int IDDShockScytheThreshold

Int IDICounterspellPercentage
Int IDIPaleMoonDrain
Int IDIHarrowingDirgePercentage
Int IDILobotomizeMult
Int IDILobotomizeXP
Int IDIMagickaVoidXP
Int IDICloakOfMimicryXP
Int IDIEmpathicAgonyXP
Int IDIHarrowingDirgeXP
Int IDIScreamOfPainXP

Int IDRBleedoutThreshold
Int IDRCullingRuneThreshold
Int IDRFingerOfDeathPercentage
Int IDRBreathOfArkayBonusHealXP
Int IDRBloodseekerMult
Int IDRBloodseekerXP
Int IDRCullingRuneXP
Int IDRKingsHeartEnableCraftingSkills

Float a
Float b
Float c
Float d
Float e

; -----

Event OnPageReset(string page)

		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption(WB_Header_Alteration)
		IDAThrummingStoneDelay = AddSliderOption(WB_Alteration_ThrummingStone_Setting_Delay, WB_Alteration_ThrummingStone_Global_Delay.GetValueInt(), WB_Alteration_ThrummingStone_Format_Delay)
;		IDAUndermineMult = AddSliderOption(WB_Alteration_Undermine_Setting_Mult, WB_Alteration_Undermine_Global_Mult.GetValueInt(), WB_Alteration_Undermine_Format_Mult)

		AddEmptyOption()
		AddHeaderOption(WB_Header_Conjuration)
		IDCConjureAvengingWraithMult = AddSliderOption(WB_Conjuration_ConjureAvengingWraith_Setting_Mult, WB_Conjuration_ConjureAvengingWraith_Global_Mult.GetValueInt(), WB_Conjuration_ConjureAvengingWraith_Format_Mult)
		IDCConjureDremoraAssassinHealth = AddSliderOption(WB_Conjuration_ConjureDremoraAssassin_Setting_Health, WB_Conjuration_ConjureDremoraAssassin_Global_Health.GetValueInt(), WB_Conjuration_ConjureDremoraAssassin_Format_Health)
		IDCConjureLichCost = AddSliderOption(WB_Conjuration_ConjureLich_Setting_Cost, WB_Conjuration_ConjureLich_Global_Cost.GetValue(), WB_Conjuration_ConjureLich_Format_Cost)

;		AddEmptyOption()
;		AddHeaderOption(WB_Header_Destruction)
;		IDDShockbloomPercentage = AddSliderOption(WB_Destruction_Shockbloom_Setting_Percentage, WB_Destruction_Shockbloom_Global_Percentage.GetValueInt(), WB_Destruction_Shockbloom_Format_Percentage)
;		IDDShockScytheThreshold = AddSliderOption(WB_Destruction_ShockScythe_Setting_Threshold, WB_Destruction_ShockScythe_Global_Threshold.GetValueInt(), WB_Destruction_ShockScythe_Format_Threshold)

		AddEmptyOption()
		AddHeaderOption(WB_Header_Illusion)
;		IDICounterspellPercentage = AddSliderOption(WB_Illusion_Counterspell_Setting_Percentage, WB_Illusion_Counterspell_Global_Percentage.GetValueInt(), WB_Illusion_Counterspell_Format_Percentage)
;		IDIPaleMoonDrain = AddSliderOption(WB_Illusion_PaleMoon_Setting_Drain, WB_Illusion_PaleMoon_Global_Drain.GetValueInt(), WB_Illusion_PaleMoon_Format_Drain)
		IDIHarrowingDirgePercentage = AddSliderOption(WB_Illusion_HarrowingDirge_Setting_Percentage, WB_Illusion_HarrowingDirge_Global_Percentage.GetValueInt(), WB_Illusion_HarrowingDirge_Format_Percentage)
;		IDILobotomizeMult = AddSliderOption(WB_Illusion_Lobotomize_Setting_Mult, WB_Illusion_Lobotomize_Global_Mult.GetValueInt(), WB_Illusion_Lobotomize_Format_Mult)

		AddEmptyOption()
		AddHeaderOption(WB_Header_Restoration)
		IDRBloodseekerMult = AddSliderOption(WB_Restoration_Bloodseeker_Setting_Mult, WB_Restoration_Bloodseeker_Global_Mult.GetValueInt(), WB_Restoration_Bloodseeker_Format_Mult)
;		IDRCullingRuneThreshold = AddSliderOption(WB_Restoration_CullingRune_Setting_Threshold, WB_Restoration_CullingRune_Global_Threshold.GetValueInt(), WB_Restoration_CullingRune_Format_Threshold)
		IDRFingerOfDeathPercentage = AddSliderOption(WB_Restoration_FingerOfDeath_Setting_Percentage, WB_Restoration_FingerOfDeath_Global_Percentage.GetValue(), WB_Restoration_FingerOfDeath_Format_Percentage)
		IDRBleedoutThreshold = AddSliderOption(WB_Restoration_Bleedout_Setting_Threshold, WB_Restoration_Bleedout_Global_Threshold.GetValueInt(), WB_Restoration_Bleedout_Format_Threshold)
		IDRKingsHeartEnableCraftingSkills = AddToggleOption(WB_Restoration_KingsHeart_Setting_EnableCraftingSkills, WB_Restoration_KingsHeart_Global_EnableCraftingSkills.GetValue() as Bool)

		SetCursorPosition(1)
		AddHeaderOption(WB_Header_Features)
		If WB_Illusion_Global_AllowNNPC.GetValueInt() == 1
			IDAllowNNPC = AddToggleOption(WB_Illusion_Setting_AllowNNPC, true)
		Else
			IDAllowNNPC = AddToggleOption(WB_Illusion_Setting_AllowNNPC, false)
		EndIf

		AddEmptyOption()
		AddHeaderOption(WB_Header_Experience)
		IDXP = AddSliderOption(WB_General_Setting_XP, WB_General_Global_XP.GetValue(),WB_General_Format_XP)
		IDCAtronachMarkXP = AddSliderOption(WB_Conjuration_AtronachMark_Setting_XP, WB_Conjuration_AtronachMark_Global_XP.GetValue(), WB_General_Format_XP)
		IDRBloodseekerXP = AddSliderOption(WB_Restoration_Bloodseeker_Setting_XP, WB_Restoration_Bloodseeker_Global_XP.GetValue(), WB_General_Format_XP)
;		IDRCullingRuneXP = AddSliderOption(WB_Restoration_CullingRune_Setting_XP, WB_Restoration_CullingRune_Global_XP.GetValue(), WB_General_Format_XP)
		IDIEmpathicAgonyXP = AddSliderOption(WB_Illusion_EmpathicAgony_Setting_XP, WB_Illusion_EmpathicAgony_Global_XP.GetValue(), WB_General_Format_XP)
		IDIHarrowingDirgeXP = AddSliderOption(WB_Illusion_HarrowingDirge_Setting_XP, WB_Illusion_HarrowingDirge_Global_XP.GetValue(), WB_General_Format_XP)
;		IDILobotomizeXP = AddSliderOption(WB_Illusion_Lobotomize_Setting_XP, WB_Illusion_Lobotomize_Global_XP.GetValue(), WB_General_Format_XP)
		IDIMagickaVoidXP = AddSliderOption(WB_Illusion_MagickaVoid_Setting_XP, WB_Illusion_MagickaVoid_Global_XP.GetValue(), WB_General_Format_XP)
		IDICloakOfMimicryXP = AddSliderOption(WB_Illusion_CloakOfMimicry_Setting_XP, WB_Illusion_CloakOfMimicry_Global_XP.GetValue(), WB_Illusion_CloakOfMimicry_Format_XP)
		IDIScreamOfPainXP = AddSliderOption(WB_Illusion_ScreamOfPain_Setting_XP, WB_Illusion_ScreamOfPain_Global_XP.GetValue(), WB_General_Format_XP)
;		IDATranasasReversalXP = AddSliderOption(WB_Alteration_TranasasReversal_Setting_XP, WB_Alteration_TranasasReversal_Global_XP.GetValue(), WB_General_Format_XP)
;		IDDShockbloomXP = AddSliderOption(WB_Destruction_Shockbloom_Setting_XP, WB_Destruction_Shockbloom_Global_XP.GetValue(), WB_General_Format_XP)
;		IDAUndermineXP = AddSliderOption(WB_Alteration_Undermine_Setting_XP, WB_Alteration_Undermine_Global_XP.GetValue(), WB_Illusion_CloakOfMimicry_Format_XP)

		AddEmptyOption()
		AddHeaderOption(WB_Header_Troubleshooting)
		IDRepopulate = AddToggleOption(WB_General_Setting_Repopulate, false)
		If Kyrgar.GetActorRef().IsEnabled()
			IDEnableKyrgar = AddToggleOption(WB_Vendor_Setting_EnableKyrgar, true)
		Else
			IDEnableKyrgar = AddToggleOption(WB_Vendor_Setting_EnableKyrgar, false)
		EndIf

EndEvent

; -----

Event OnOptionSelect(int OP)

	If OP == IDRepopulate
;		If WB_SkyUI_Message_Repopulate.Show() == 1
			SetToggleOptionValue(IDRepopulate, true)
			SetOptionFlags(IDRepopulate, OPTION_FLAG_DISABLED)
			RepopulateLists()
;		EndIf
	ElseIf OP == IDRKingsHeartEnableCraftingSkills
		If WB_Restoration_KingsHeart_Global_EnableCraftingSkills.GetValue() as Bool == false
			WB_Restoration_KingsHeart_Global_EnableCraftingSkills.SetValue(1)
		Else
			WB_Restoration_KingsHeart_Global_EnableCraftingSkills.SetValue(0)
		EndIf
	ElseIf OP == IDAllowNNPC
		If WB_Illusion_Global_AllowNNPC.GetValueInt() == 1
			WB_Illusion_Global_AllowNNPC.SetValueInt(0)
			SetToggleOptionValue(IDAllowNNPC, false)
		Else
			WB_Illusion_Global_AllowNNPC.SetValueInt(1)
			SetToggleOptionValue(IDAllowNNPC, true)
		EndIf
	ElseIf OP == IDEnableKyrgar
		If Kyrgar.GetActorRef().IsEnabled()
			Kyrgar.GetActorRef().Disable()
			SetToggleOptionValue(IDEnableKyrgar, false)
		Else
			Kyrgar.GetActorRef().Enable()
			SetToggleOptionValue(IDEnableKyrgar, true)
		EndIf
	EndIf

EndEvent

; -----

Event OnOptionDefault(int OP)

	If OP == IDRKingsHeartEnableCraftingSkills
		WB_Restoration_KingsHeart_Global_EnableCraftingSkills.SetValue(0)
		SetToggleOptionValue(IDRKingsHeartEnableCraftingSkills, false)
	ElseIf OP == IDAllowNNPC
		WB_Illusion_Global_AllowNNPC.SetValueInt(0)
		SetToggleOptionValue(IDAllowNNPC, false)
	ElseIf OP == IDEnableKyrgar
		Kyrgar.GetActorRef().Disable()
		SetToggleOptionValue(IDEnableKyrgar, false)
	EndIf

EndEvent

; -----

Event OnOptionHighlight(int OP)

	If OP == IDXP
		SetInfoText(WB_General_Highlight_XP)
	ElseIf OP == IDRepopulate
		SetInfoText(WB_General_Highlight_Repopulate)
	ElseIf OP == IDAllowNNPC
		SetInfoText(WB_Illusion_Highlight_AllowNNPC)
	ElseIf OP == IDEnableKyrgar
		SetInfoText(WB_Vendor_Highlight_EnableKyrgar)
	ElseIf OP == IDAThrummingStoneDelay
		SetInfoText(WB_Alteration_ThrummingStone_Highlight_Delay)
	ElseIf OP == IDATranasasReversalXP
		SetInfoText(WB_Alteration_TranasasReversal_Highlight_XP)
	ElseIf OP == IDAUndermineMult
		SetInfoText(WB_Alteration_Undermine_Highlight_Mult)
	ElseIf OP == IDAUndermineXP
		SetInfoText(WB_Alteration_Undermine_Highlight_XP)
	ElseIf OP == IDCConjureAvengingWraithMult
		SetInfoText(WB_Conjuration_ConjureAvengingWraith_Highlight_Mult)
	ElseIf OP == IDCConjureLichCost
		SetInfoText(WB_Conjuration_ConjureLich_Highlight_Cost)
	ElseIf OP == IDCConjureDremoraAssassinHealth
		SetInfoText(WB_Conjuration_ConjureDremoraAssassin_Highlight_Health)
	ElseIf OP == IDCAtronachMarkXP
		SetInfoText(WB_Conjuration_AtronachMark_Highlight_XP)
	ElseIf OP == IDDShockbloomPercentage
		SetInfoText(WB_Destruction_Shockbloom_Highlight_Percentage)
	ElseIf OP == IDDShockbloomXP
		SetInfoText(WB_Destruction_Shockbloom_Highlight_XP)
	ElseIf OP == IDDShockScytheThreshold
		SetInfoText(WB_Destruction_ShockScythe_Highlight_Threshold)
	ElseIf OP == IDICounterspellPercentage
		SetInfoText(WB_Illusion_Counterspell_Highlight_Percentage)
	ElseIf OP == IDIPaleMoonDrain
		SetInfoText(WB_Illusion_PaleMoon_Highlight_Drain)
	ElseIf OP == IDIHarrowingDirgePercentage
		SetInfoText(WB_Illusion_HarrowingDirge_Highlight_Percentage)
	ElseIf OP == IDILobotomizeMult
		SetInfoText(WB_Illusion_Lobotomize_Highlight_Mult)
	ElseIf OP == IDILobotomizeXP
		SetInfoText(WB_Illusion_Lobotomize_Highlight_XP)
	ElseIf OP == IDIMagickaVoidXP
		SetInfoText(WB_Illusion_MagickaVoid_Highlight_XP)
	ElseIf OP == IDICloakOfMimicryXP
		SetInfoText(WB_Illusion_CloakOfMimicry_Highlight_XP)
	ElseIf OP == IDIEmpathicAgonyXP
		SetInfoText(WB_Illusion_EmpathicAgony_Highlight_XP)
	ElseIf OP == IDIHarrowingDirgeXP
		SetInfoText(WB_Illusion_HarrowingDirge_Highlight_XP)
	ElseIf OP == IDIScreamOfPainXP
		SetInfoText(WB_Illusion_ScreamOfPain_Highlight_XP)
	ElseIf OP == IDRBleedoutThreshold
		SetInfoText(WB_Restoration_Bleedout_Highlight_Threshold)
	ElseIf OP == IDRCullingRuneThreshold
		SetInfoText(WB_Restoration_CullingRune_Highlight_Threshold)
	ElseIf OP == IDRFingerOfDeathPercentage
		SetInfoText(WB_Restoration_FingerOfDeath_Highlight_Percentage)
	ElseIf OP == IDRBloodseekerMult
		SetInfoText(WB_Restoration_Bloodseeker_Highlight_Mult)
	ElseIf OP == IDRBloodseekerXP
		SetInfoText(WB_Restoration_Bloodseeker_Highlight_XP)
	ElseIf OP == IDRCullingRuneXP
		SetInfoText(WB_Restoration_CullingRune_Highlight_XP)
	ElseIf OP == IDRKingsHeartEnableCraftingSkills
		SetInfoText(WB_Restoration_KingsHeart_Highlight_EnableCraftingSkills)
	EndIf

EndEvent

; -----

Event OnOptionSliderOpen(int OP)

	If OP == IDXP
		a = WB_General_Global_XP.GetValue()
		b = 1.0
		c = 0.2
		d = 0.2
		e = 5.0
	ElseIf OP == IDAThrummingStoneDelay
		a = WB_Alteration_ThrummingStone_Global_Delay.GetValueInt()
		b = 8
		c = 5
		d = 1
		e = 20
	ElseIf OP == IDATranasasReversalXP
		a = WB_Alteration_TranasasReversal_Global_XP.GetValue()
		b = 0.1
		c = 0.1
		d = 0.1
		e = 0.5
	ElseIf OP == IDAUndermineMult
		a = WB_Alteration_Undermine_Global_Mult.GetValueInt()
		b = 15
		c = 5
		d = 5
		e = 50
	ElseIf OP == IDAUndermineXP
		a = WB_Alteration_Undermine_Global_XP.GetValue()
		b = 5.0
		c = 1.0
		d = 1.0
		e = 30.0
	ElseIf OP == IDCConjureAvengingWraithMult
		a = WB_Conjuration_ConjureAvengingWraith_Global_Mult.GetValueInt()
		b = 150
		c = 25
		d = 25
		e = 250
	ElseIf OP == IDCConjureLichCost
		a = WB_Conjuration_ConjureLich_Global_Cost.GetValue()
		b = 500.0
		c = 250.0
		d = 250.0
		e = 2500.0
	ElseIf OP == IDCConjureDremoraAssassinHealth
		a = WB_Conjuration_ConjureDremoraAssassin_Global_Health.GetValueInt()
		b = 250
		c = 50
		d = 50
		e = 500
	ElseIf OP == IDCAtronachMarkXP
		a = WB_Conjuration_AtronachMark_Global_XP.GetValue()
		b = 1.0
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDDShockbloomPercentage
		a = WB_Destruction_Shockbloom_Global_Percentage.GetValueInt()
		b = 10
		c = 5
		d = 1
		e = 20
	ElseIf OP == IDDShockScytheThreshold
		a = WB_Destruction_ShockScythe_Global_Threshold.GetValueInt()
		b = 5
		c = 1
		d = 1
		e = 8
	ElseIf OP == IDDShockbloomXP
		a = WB_Destruction_Shockbloom_Global_XP.GetValue()
		b = 0.5
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDICounterspellPercentage
		a = WB_Illusion_Counterspell_Global_Percentage.GetValueInt()
		b = 15
		c = 5
		d = 5
		e = 25
	ElseIf OP == IDIPaleMoonDrain
		a = WB_Illusion_PaleMoon_Global_Drain.GetValueInt()
		b = 50
		c = 25
		d = 25
		e = 250
	ElseIf OP == IDIHarrowingDirgePercentage
		a = WB_Illusion_HarrowingDirge_Global_Percentage.GetValueInt()
		b = 20
		c = 5
		d = 5
		e = 30
	ElseIf OP == IDILobotomizeMult
		a = WB_Illusion_Lobotomize_Global_Mult.GetValueInt()
		b = 50
		c = 10
		d = 10
		e = 250
	ElseIf OP == IDILobotomizeXP
		a = WB_Illusion_Lobotomize_Global_XP.GetValue()
		b = 0.5
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDIMagickaVoidXP
		a = WB_Illusion_MagickaVoid_Global_XP.GetValue()
		b = 1.0
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDICloakOfMimicryXP
		a = WB_Illusion_CloakOfMimicry_Global_XP.GetValue()
		b = 20.0
		c = 5.0
		d = 2.5
		e = 50.0
	ElseIf OP == IDIEmpathicAgonyXP
		a = WB_Illusion_EmpathicAgony_Global_XP.GetValue()
		b = 0.5
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDIHarrowingDirgeXP
		a = WB_Illusion_HarrowingDirge_Global_XP.GetValue()
		b = 0.5
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDIScreamOfPainXP
		a = WB_Illusion_ScreamOfPain_Global_XP.GetValue()
		b = 0.8
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDRBleedoutThreshold
		a = WB_Restoration_Bleedout_Global_Threshold.GetValueInt()
		b = 60
		c = 40
		d = 5
		e = 80
	ElseIf OP == IDRCullingRuneThreshold
		a = WB_Restoration_CullingRune_Global_Threshold.GetValueInt()
		b = 8
		c = 1
		d = 1
		e = 20
	ElseIf OP == IDRFingerOfDeathPercentage
		a = WB_Restoration_FingerOfDeath_Global_Percentage.GetValue()
		b = 125
		c = 50
		d = 25
		e = 200
	ElseIf OP == IDRBloodseekerMult
		a = WB_Restoration_Bloodseeker_Global_Mult.GetValue()
		b = 175
		c = 25
		d = 25
		e = 300
	ElseIf OP == IDRBloodseekerXP
		a = WB_Restoration_Bloodseeker_Global_XP.GetValue()
		b = 0.8
		c = 0.1
		d = 0.1
		e = 1.5
	ElseIf OP == IDRCullingRuneXP
		a = WB_Restoration_CullingRune_Global_XP.GetValue()
		b = 1.0
		c = 0.1
		d = 0.1
		e = 1.5
	EndIf
	SetSliderDialogStartValue(a)
	SetSliderDialogDefaultValue(b)
	SetSliderDialogRange(c,e)
	SetSliderDialogInterval(d)

EndEvent

; -----

Event OnOptionSliderAccept(int OP, float afValue)

	If OP == IDXP
		WB_General_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDAThrummingStoneDelay
		WB_Alteration_ThrummingStone_Global_Delay.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDAThrummingStoneDelay, afValue, WB_Alteration_ThrummingStone_Format_Delay)
	ElseIf OP == IDATranasasReversalXP
		WB_Alteration_TranasasReversal_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDATranasasReversalXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDAUndermineMult
		WB_Alteration_Undermine_Global_Mult.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDAUndermineMult, afValue, WB_Alteration_Undermine_Format_Mult)
	ElseIf OP == IDAUndermineXP
		WB_Alteration_Undermine_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDAUndermineXP, afValue, WB_Illusion_CloakOfMimicry_Format_XP)
	ElseIf OP == IDCConjureAvengingWraithMult
		WB_Conjuration_ConjureAvengingWraith_Global_Mult.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDCConjureAvengingWraithMult, afValue, WB_Conjuration_ConjureAvengingWraith_Format_Mult)
	ElseIf OP == IDCConjureLichCost
		WB_Conjuration_ConjureLich_Global_Cost.SetValue(afValue)
		SetSliderOptionValue(IDCConjureLichCost, afValue, WB_Conjuration_ConjureLich_Format_Cost)
	ElseIf OP == IDCConjureDremoraAssassinHealth
		WB_Conjuration_ConjureDremoraAssassin_Global_Health.SetValue(afValue)
		SetSliderOptionValue(IDCConjureDremoraAssassinHealth, afValue, WB_Conjuration_ConjureDremoraAssassin_Format_Health)
	ElseIf OP == IDCAtronachMarkXP
		WB_Conjuration_AtronachMark_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDCAtronachMarkXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDDShockbloomPercentage
		WB_Destruction_Shockbloom_Global_Percentage.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDDShockbloomPercentage, afValue, WB_Destruction_Shockbloom_Format_Percentage)
	ElseIf OP == IDDShockbloomXP
		WB_Destruction_Shockbloom_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDDShockbloomXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDDShockScytheThreshold
		WB_Destruction_ShockScythe_Global_Threshold.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDDShockScytheThreshold, afValue, WB_Destruction_ShockScythe_Format_Threshold)
	ElseIf OP == IDICounterspellPercentage
		WB_Illusion_Counterspell_Global_Percentage.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDICounterspellPercentage,afValue, WB_Illusion_Counterspell_Format_Percentage)
	ElseIf OP == IDIPaleMoonDrain
		WB_Illusion_PaleMoon_Global_Drain.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDIPaleMoonDrain, afValue, WB_Illusion_PaleMoon_Format_Drain)
	ElseIf OP == IDIHarrowingDirgePercentage
		WB_Illusion_HarrowingDirge_Global_Percentage.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDIHarrowingDirgePercentage, afValue, WB_Illusion_HarrowingDirge_Format_Percentage)
	ElseIf OP == IDILobotomizeMult
		WB_Illusion_Lobotomize_Global_Mult.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDILobotomizeMult, afValue, WB_Illusion_Lobotomize_Format_Mult)
	ElseIf OP == IDILobotomizeXP
		WB_Illusion_Lobotomize_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDILobotomizeXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDIMagickaVoidXP
		WB_Illusion_MagickaVoid_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDIMagickaVoidXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDICloakOfMimicryXP
		WB_Illusion_CloakOfMimicry_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDICloakOfMimicryXP, afValue, WB_Illusion_CloakOfMimicry_Format_XP)
	ElseIf OP == IDIEmpathicAgonyXP
		WB_Illusion_EmpathicAgony_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDIEmpathicAgonyXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDIHarrowingDirgeXP
		WB_Illusion_HarrowingDirge_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDIHarrowingDirgeXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDIScreamOfPainXP
		WB_Illusion_ScreamOfPain_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDIScreamOfPainXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDRBleedoutThreshold
		WB_Restoration_Bleedout_Global_Threshold.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDRBleedoutThreshold, afValue, WB_Restoration_Bleedout_Format_Threshold)
	ElseIf OP == IDRCullingRuneThreshold
		WB_Restoration_CullingRune_Global_Threshold.SetValueInt(afValue as Int)
		SetSliderOptionValue(IDRCullingRuneThreshold, afValue, WB_Restoration_CullingRune_Format_Threshold)
	ElseIf OP == IDRBloodseekerMult
		WB_Restoration_Bloodseeker_Global_Mult.SetValue(afValue)
		SetSliderOptionValue(IDRBloodseekerMult, afValue, WB_Restoration_Bloodseeker_Format_Mult)
	ElseIf OP == IDRBloodseekerXP
		WB_Restoration_Bloodseeker_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDRBloodseekerXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDRCullingRuneXP
		WB_Restoration_CullingRune_Global_XP.SetValue(afValue)
		SetSliderOptionValue(IDRCullingRuneXP, afValue, WB_General_Format_XP)
	ElseIf OP == IDRFingerOfDeathPercentage
		WB_Restoration_FingerOfDeath_Global_Percentage.SetValue(afValue)
		SetSliderOptionValue(IDRFingerOfDeathPercentage, afValue, WB_Restoration_FingerOfDeath_Format_Percentage)
	EndIf

EndEvent

; -----

Formlist Property WB_Quest_Populate_OriginFormlist_List_Books Auto
{An ordered formlist containing formlists of all Books to add}
Formlist Property WB_Quest_Populate_OriginFormlist_List_Scrolls Auto
{An ordered formlist containing formlists of all Scrolls to add}
Formlist Property WB_Quest_Populate_OriginFormlist_List_Staves Auto
{An ordered formlist containing formlists of all Staves to add}

Float Property WB_InitialDelay Auto

Formlist Property WB_Quest_Populate_DestinationLitem_List_Books Auto
{An ordered formlist containing all Book destination lists}
Formlist Property WB_Quest_Populate_DestinationLitem_List_Scrolls Auto
{An ordered formlist containing all Scroll destination lists}
Formlist Property WB_Quest_Populate_DestinationLitem_List_Staves Auto
{An ordered formlist containing all Staff destination lists}

Message Property WB_PopulateLists_Done Auto
Message Property WB_PopulateLists_Wait Auto

Message Property WB_SkyUI_Message_Repopulate Auto

; -----

LeveledItem CurrentDestinationLitem
Formlist CurrentOriginFormlist
Book CurrentOriginBookInCurrentOriginFormlist
Scroll CurrentOriginScrollInCurrentOriginFormlist
Weapon CurrentOriginStaffInCurrentOriginFormlist

; -----

Function RepopulateLists()

	Debug.Trace("APOC 10 DEBUG: Initialising Re-Populate Lists script...")
	Utility.Wait(WB_InitialDelay)

	WB_PopulateLists_Wait.Show()

	Int i
	Int j

	Debug.Trace("APOC 10 DEBUG: Re-Populating leveled lists... Books...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Books.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Books.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Books.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		CurrentDestinationLitem.Revert()	; special
		While j > 0
			j -= 1
			CurrentOriginBookInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Book
			CurrentDestinationLitem.AddForm(CurrentOriginBookInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOC 10 DEBUG: Re-Populating leveled lists... Scrolls...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Scrolls.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Scrolls.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Scrolls.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		CurrentDestinationLitem.Revert()	; special
		While j > 0
			j -= 1
			CurrentOriginScrollInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Scroll
			CurrentDestinationLitem.AddForm(CurrentOriginScrollInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOC 10 DEBUG: Re-Populating leveled lists... Staves...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Staves.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Staves.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Staves.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		CurrentDestinationLitem.Revert()	; special
		While j > 0
			j -= 1
			CurrentOriginStaffInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Weapon
			CurrentDestinationLitem.AddForm(CurrentOriginStaffInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOC 10 DEBUG: Re-Populating leveled lists...Done",1)
	WB_PopulateLists_Done.Show()

EndFunction

; -----