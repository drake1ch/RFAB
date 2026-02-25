Scriptname VL_CustomKillmoveScript extends activemagiceffect

Actor Property PlayerRef  Auto

GlobalVariable Property VL_Decapitation  Auto

GlobalVariable Property VL_Debug  Auto  

Keyword[] Property WeaponTypeKeywordArray  Auto

;=========================================Unarmed Properties=========================================== 

FormList Property VL_zFormListUnarmed  Auto

GlobalVariable Property VL_zRandomizerUnarmed  Auto

;=========================================Shield Properties=============================================

FormList Property VL_zFormListShield  Auto

GlobalVariable Property VL_zRandomizerShield  Auto    

;=========================================Dagger Properties=============================================

FormList[] Property VL_zFormListDaggerArray  Auto 

GlobalVariable[] Property VL_zRandomizerDaggerArray  Auto 

;=========================================Sword Properties=============================================

FormList[] Property VL_zFormListSwordArray  Auto 

GlobalVariable[] Property VL_zRandomizerSwordArray  Auto

;=========================================Mace Properties=============================================

FormList[] Property VL_zFormListMaceArray  Auto 

GlobalVariable[] Property VL_zRandomizerMaceArray  Auto

;=========================================Axe Properties=============================================

FormList[] Property VL_zFormListAxeArray  Auto 

GlobalVariable[] Property VL_zRandomizerAxeArray  Auto

;=========================================Greatsword Properties=============================================

FormList[] Property VL_zFormListGreatswordArray  Auto 

GlobalVariable[] Property VL_zRandomizerGreatswordArray  Auto

;=========================================Warhammer Properties=============================================

FormList[] Property VL_zFormListWarhammerArray  Auto 

GlobalVariable[] Property VL_zRandomizerWarhammerArray  Auto

;=========================================Battleaxe Properties=============================================

FormList[] Property VL_zFormListBattleaxeArray  Auto 

GlobalVariable[] Property VL_zRandomizerBattleaxeArray  Auto 

import utility
import debug

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	weapon PlayerWeaponKey = PlayerRef.GetEquippedWeapon(false)
	int PlayerWeaponR = PlayerRef.GetEquippedItemType(1)
	int PlayerWeaponL = PlayerRef.GetEquippedItemType(0)

	wait(0.2)

	;=====================================================Shield========================================

	If(PlayerWeaponL == 10)
		If(VL_zFormListShield.GetSize() != 0 && VL_zFormListShield.GetSize() != 1)
			int ShieldIndex = RandomInt(0, VL_zFormListShield.GetSize() - 1)
			Form ShieldForm = VL_zFormListShield.GetAt(ShieldIndex)
			VL_zRandomizerShield.SetValueInt((ShieldForm as globalvariable).getvalueint())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Shields GV:" + " " + (ShieldForm as GlobalVariable).GetValueInt())
			endif
		Endif
	endif

	;====================================================Unarmed======================================

	If(PlayerWeaponR == 0)
		If(VL_zFormListUnarmed.GetSize() != 0 && VL_zFormListUnarmed.GetSize() != 1)
			int UnarmedIndex = RandomInt(0, VL_zFormListUnarmed.GetSize() - 1)
			Form UnarmedForm = VL_zFormListUnarmed.GetAt(UnarmedIndex)
			VL_zRandomizerUnarmed.SetValueInt((UnarmedForm as globalvariable).Getvalueint())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Unarmed GV:" + " " + (UnarmedForm as GlobalVariable).GetValueInt())
			endif
		Endif

	;==============================================Single Dagger==================================================

	ElseIf(PlayerWeaponR == 2 && PlayerWeaponL != 1 && PlayerWeaponL != 2 && PlayerWeaponL != 3 && PlayerWeaponL != 4)
		If(VL_zFormListDaggerArray[0].GetSize() != 0 && VL_zFormListDaggerArray[0].GetSize() != 1)
			int SGDaggerIndex = RandomInt(0, VL_zFormListDaggerArray[0].GetSize() - 1)
			Form SGDaggerForm = VL_zFormListDaggerArray[0].GetAt(SGDaggerIndex)
			VL_zRandomizerDaggerArray[0].SetValueInt((SGDaggerForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Daggers GV:" + " " + (SGDaggerForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;============================================Dual Wield Dagger======================================================

	ElseIf((PlayerWeaponR == 2) && (PlayerWeaponL == 1 || PlayerWeaponL == 2 || PlayerWeaponL == 3 || PlayerWeaponL == 4))
		If(VL_zFormListDaggerArray[1].GetSize() != 0 && VL_zFormListDaggerArray[1].GetSize() != 1)
			int DWDaggerIndex = RandomInt(0, VL_zFormListDaggerArray[1].GetSize() - 1)
			Form DWDaggerForm = VL_zFormListDaggerArray[1].GetAt(DWDaggerIndex)
			VL_zRandomizerDaggerArray[1].SetValueInt((DWDaggerForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Daggers DW GV:" + " " + (DWDaggerForm as GlobalVariable).GetValueInt())
			endif
		Endif

		;--DW Dagger Decapitation--------------------------------------------------------------------------------------------------------

		If(VL_Decapitation.GetValueInt() != 0 && VL_zFormListDaggerArray[2].GetSize() != 0 && VL_zFormListDaggerArray[2].GetSize() != 1)
			int DWDaggerDecapIndex = RandomInt(0, VL_zFormListDaggerArray[2].GetSize() - 1)
			Form DWDaggerDecapForm = VL_zFormListDaggerArray[2].GetAt(DWDaggerDecapIndex)
			VL_zRandomizerDaggerArray[2].SetValueInt((DWDaggerDecapForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Daggers DW Decap GV:" + " " + (DWDaggerDecapForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;==============================================Single Sword=========================================================

	ElseIf(PlayerWeaponR == 1 && PlayerWeaponL != 1 && PlayerWeaponL != 2 && PlayerWeaponL != 3 && PlayerWeaponL != 4)
		If(VL_zFormListSwordArray[0].GetSize() != 0 && VL_zFormListSwordArray[0].GetSize() != 1)
			int SGSwordUnRepeater = VL_zRandomizerSwordArray[0].Getvalueint()
			VL_zRandomizerSwordArray[0].Getvalueint() == SGSwordUnRepeater
			int SGSwordIndex = RandomInt(0, VL_zFormListSwordArray[0].GetSize() - 1)
			Form SGSwordForm = VL_zFormListSwordArray[0].GetAt(SGSwordIndex)
			VL_zRandomizerSwordArray[0].SetValueInt((SGSwordForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Swords GV:" + " " + (SGSwordForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;============================================Dual Wield Sword===========================================================

	ElseIf((PlayerWeaponR == 1) && (PlayerWeaponL == 1 || PlayerWeaponL == 2 || PlayerWeaponL == 3 || PlayerWeaponL == 4))
		If(VL_zFormListSwordArray[1].GetSize() != 0 && VL_zFormListSwordArray[1].GetSize() != 1)
			int DWSwordIndex = RandomInt(0, VL_zFormListSwordArray[1].GetSize() - 1)
			Form DWSwordForm = VL_zFormListSwordArray[1].GetAt(DWSwordIndex)
			VL_zRandomizerSwordArray[1].SetValueInt((DWSwordForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Swords DW GV:" + " " + (DWSwordForm as GlobalVariable).GetValueInt())
			endif
		Endif

		;-- DW Sword Decapitation-----------------------------------------------------------------------------------------------------------

		If(VL_Decapitation.GetValueInt() != 0 && VL_zFormListSwordArray[2].GetSize() != 0 && VL_zFormListSwordArray[2].GetSize() != 1)
			int DWSwordDecapIndex = RandomInt(0, VL_zFormListSwordArray[2].GetSize() - 1)
			Form DWSwordDecapForm = VL_zFormListSwordArray[2].GetAt(DWSwordDecapIndex)
			VL_zRandomizerSwordArray[2].SetValueInt((DWSwordDecapForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Swords DW Decap GV:" + " " + (DWSwordDecapForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;==============================================Single Mace===========================================================

	ElseIf(PlayerWeaponR == 4 && PlayerWeaponL != 1 && PlayerWeaponL != 2 && PlayerWeaponL != 3 && PlayerWeaponL != 4)
		If(VL_zFormListMaceArray[0].GetSize() != 0 && VL_zFormListMaceArray[0].GetSize() != 1)
			int SGMaceIndex = RandomInt(0, VL_zFormListMaceArray[0].GetSize() - 1)
			Form SGMaceForm = VL_zFormListMaceArray[0].GetAt(SGMaceIndex)
			VL_zRandomizerMaceArray[0].SetValueInt((SGMaceForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Maces GV:" + " " + (SGMaceForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;============================================Dual Wield Mace============================================================

	ElseIf((PlayerWeaponR == 4) && (PlayerWeaponL == 1 || PlayerWeaponL == 2 || PlayerWeaponL == 3 || PlayerWeaponL == 4))
		If(VL_zFormListMaceArray[1].GetSize() != 0 && VL_zFormListMaceArray[1].GetSize() != 1)
			int DWMaceIndex = RandomInt(0, VL_zFormListMaceArray[1].GetSize() - 1)
			Form DWMaceForm = VL_zFormListMaceArray[1].GetAt(DWMaceIndex)
			VL_zRandomizerMaceArray[1].SetValueInt((DWMaceForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Maces DW GV:" + " " + (DWMaceForm as GlobalVariable).GetValueInt())
			endif
		Endif

		;--DW Mace Decapitation----------------------------------------------------------------------------------------------------------

		If(VL_Decapitation.GetValueInt() != 0 && VL_zFormListMaceArray[2].GetSize() != 0 && VL_zFormListMaceArray[2].GetSize() != 1)
			int DWMaceDecapIndex = RandomInt(0, VL_zFormListMaceArray[2].GetSize() - 1)
			Form DWMaceDecapForm = VL_zFormListMaceArray[2].GetAt(DWMaceDecapIndex)
			VL_zRandomizerMaceArray[2].SetValueInt((DWMaceDecapForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Maces DW Decap GV:" + " " + (DWMaceDecapForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;==============================================Single Axe==========================================================

	ElseIf(PlayerWeaponR == 3 && PlayerWeaponL != 1 && PlayerWeaponL != 2 && PlayerWeaponL != 3 && PlayerWeaponL != 4)
		If(VL_zFormListAxeArray[0].GetSize() != 0 && VL_zFormListAxeArray[0].GetSize() != 1)
			int SGAxeIndex = RandomInt(0, VL_zFormListAxeArray[0].GetSize() - 1)
			Form SGAxeForm = VL_zFormListAxeArray[0].GetAt(SGAxeIndex)
			VL_zRandomizerAxeArray[0].SetValueInt((SGAxeForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Axes GV:" + " " + (SGAxeForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;============================================Dual Wield Axe============================================================

	ElseIf((PlayerWeaponR == 3) && (PlayerWeaponL == 1 || PlayerWeaponL == 2 || PlayerWeaponL == 3 || PlayerWeaponL == 4))
		If(VL_zFormListAxeArray[1].GetSize() != 0 && VL_zFormListAxeArray[1].GetSize() != 1)
			int DWAxeIndex = RandomInt(0, VL_zFormListAxeArray[1].GetSize() - 1)
			Form DWAxeForm = VL_zFormListAxeArray[1].GetAt(DWAxeIndex)
			VL_zRandomizerAxeArray[1].SetValueInt((DWAxeForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Axes DW GV:" + " " + (DWAxeForm as GlobalVariable).GetValueInt())
			endif
		Endif

		;--DW Axe Decapitation-------------------------------------------------------------------------------------------------------

		If(VL_Decapitation.GetValueInt() != 0 && VL_zFormListAxeArray[2].GetSize() != 0 && VL_zFormListAxeArray[2].GetSize() != 1)
			int DWAxeDecapIndex = RandomInt(0, VL_zFormListAxeArray[2].GetSize() - 1)
			Form DWAxeDecapForm = VL_zFormListAxeArray[2].GetAt(DWAxeDecapIndex)
			VL_zRandomizerAxeArray[2].SetValueInt((DWAxeDecapForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Axes DW Decap GV:" + " " + (DWAxeDecapForm as GlobalVariable).GetValueInt())
			endif
		EndIf

	;==============================================Greatsword=====================================================================

	ElseIf(PlayerWeaponR == 5)
		If(VL_zFormListGreatswordArray[0].GetSize() != 0 && VL_zFormListGreatswordArray[0].GetSize() != 1)
			int GreatswordIndex = RandomInt(0, VL_zFormListGreatswordArray[0].GetSize() - 1)
			Form GreatswordForm = VL_zFormListGreatswordArray[0].GetAt(GreatswordIndex)
			VL_zRandomizerGreatswordArray[0].SetValueInt((GreatswordForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Greatswords GV:" + " " + (GreatswordForm as GlobalVariable).GetValueInt())
			endif
		EndIf
		
		;--Greatsword Decapitation--------------------------------------------------------------------------------------
	
		If(VL_Decapitation.GetValueInt() != 0)
			If(VL_zFormListGreatswordArray[1].GetSize() != 0 && VL_zFormListGreatswordArray[1].GetSize() != 1)
				int GreatswordDecapIndex = RandomInt(0, VL_zFormListGreatswordArray[1].GetSize() - 1)
				Form GreatswordDecapForm = VL_zFormListGreatswordArray[1].GetAt(GreatswordDecapIndex)
				VL_zRandomizerGreatswordArray[1].SetValueInt((GreatswordDecapForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Greatswords Decap GV:" + " " + (GreatswordDecapForm as GlobalVariable).GetValueInt())
				endif
			Endif
		
		;--Greatsword Bleedout Decapitation--------------------------------------------------------------------------------------
			
			If(VL_zFormListGreatswordArray[2].GetSize() != 0 && VL_zFormListGreatswordArray[2].GetSize() != 1)
				int GreatswordDecapBOIndex = RandomInt(0, VL_zFormListGreatswordArray[2].GetSize() - 1)
				Form GreatswordDecapBOForm = VL_zFormListGreatswordArray[2].GetAt(GreatswordDecapBOIndex)
				VL_zRandomizerGreatswordArray[2].SetValueInt((GreatswordDecapBOForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Greatswords Decap BlO GV:" + " " + (GreatswordDecapBOForm as GlobalVariable).GetValueInt())
				endif
			Endif
		EndIf

	;==============================================Warhammer==================================================

	ElseIf(PlayerWeaponKey.HasKeyword(WeaponTypeKeywordArray[5]))
		If(VL_zFormListWarhammerArray[0].GetSize() != 0 && VL_zFormListWarhammerArray[0].GetSize() != 1)
			int WarhammerIndex = RandomInt(0, VL_zFormListWarhammerArray[0].GetSize() - 1)
			Form WarhammerForm = VL_zFormListWarhammerArray[0].GetAt(WarhammerIndex)
			VL_zRandomizerWarhammerArray[0].SetValueInt((WarhammerForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Warhammers GV:" + " " + (WarhammerForm as GlobalVariable).GetValueInt())
			endif
		EndIf
		
		;--Warhammer Decapitation-------------------------------------------------------------------------------------
	
		If(VL_Decapitation.GetValueInt() != 0)
			If(VL_zFormListWarhammerArray[1].GetSize() != 0 && VL_zFormListWarhammerArray[1].GetSize() != 1)
				int WarhammerDecapIndex = RandomInt(0, VL_zFormListWarhammerArray[1].GetSize() - 1)
				Form WarhammerDecapForm = VL_zFormListWarhammerArray[1].GetAt(WarhammerDecapIndex)
				VL_zRandomizerWarhammerArray[1].SetValueInt((WarhammerDecapForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Warhammers Decap GV:" + " " + (WarhammerDecapForm as GlobalVariable).GetValueInt())
				endif
			Endif
		
		;--Warhammer Bleedout Decapitation-----------------------------------------------------------------------------------
			
			If(VL_zFormListWarhammerArray[2].GetSize() != 0 && VL_zFormListWarhammerArray[2].GetSize() != 1)
				int WarhammerDecapBOIndex = RandomInt(0, VL_zFormListWarhammerArray[2].GetSize() - 1)
				Form WarhammerDecapBOForm = VL_zFormListWarhammerArray[2].GetAt(WarhammerDecapBOIndex)
				VL_zRandomizerWarhammerArray[2].SetValueInt((WarhammerDecapBOForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Warhammers Decap BlO GV:" + " " + (WarhammerDecapBoForm as GlobalVariable).GetValueInt())
				endif
			Endif
		EndIf

	;==============================================Battleaxe================================================

	ElseIf(PlayerWeaponKey.HasKeyword(WeaponTypeKeywordArray[6]))
		If(VL_zFormListBattleaxeArray[0].GetSize() != 0 && VL_zFormListBattleaxeArray[0].GetSize() != 1)
			int BattleaxeIndex = RandomInt(0, VL_zFormListBattleaxeArray[0].GetSize() - 1)
			Form BattleaxeForm = VL_zFormListBattleaxeArray[0].GetAt(BattleaxeIndex)
			VL_zRandomizerBattleaxeArray[0].SetValueInt((BattleaxeForm As GlobalVariable).GetValueInt())
			if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
				notification("Battleaxes GV:" + " " + (BattleaxeForm as GlobalVariable).GetValueInt())
			endif
		EndIf
		
		;--Battleaxe Decapitation----------------------------------------------------------------------------------------
	
		If(VL_Decapitation.GetValueInt() != 0)
			If(VL_zFormListBattleaxeArray[1].GetSize() != 0 && VL_zFormListBattleaxeArray[1].GetSize() != 1)
				int BattleaxeDecapIndex = RandomInt(0, VL_zFormListBattleaxeArray[1].GetSize() - 1)
				Form BattleaxeDecapForm = VL_zFormListBattleaxeArray[1].GetAt(BattleaxeDecapIndex)
				VL_zRandomizerBattleaxeArray[1].SetValueInt((BattleaxeDecapForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Battleaxes Decap GV:" + " " + (BattleaxeDecapForm as GlobalVariable).GetValueInt())
				endif
			Endif
		
		;--Battleaxe Bleedout Decapitation-------------------------------------------------------------------------------
			
			If(VL_zFormListBattleaxeArray[2].GetSize() != 0 && VL_zFormListBattleaxeArray[2].GetSize() != 1)
				int BattleaxeDecapBOIndex = RandomInt(0, VL_zFormListBattleaxeArray[2].GetSize() - 1)
				Form BattleaxeDecapBOForm = VL_zFormListBattleaxeArray[2].GetAt(BattleaxeDecapBOIndex)
				VL_zRandomizerBattleaxeArray[2].SetValueInt((BattleaxeDecapBOForm As GlobalVariable).GetValueInt())
				if(VL_Debug.GetValueInt() == 2 || VL_Debug.GetValueInt() == 3)
					notification("Battleaxe Decap BlO GV:" + " " + (BattleaxeDecapBOForm as GlobalVariable).GetValueInt())
				endif
			Endif
		EndIf
	Endif
EndEvent     
