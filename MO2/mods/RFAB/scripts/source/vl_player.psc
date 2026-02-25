Scriptname VL_Player extends ReferenceAlias  

Actor Property PlayerRef  Auto  

GlobalVariable Property VL_RangedLastEnemyRestriction  Auto

GlobalVariable Property VL_RangedKillmove  Auto

GlobalVariable Property VL_CameraSetting  Auto 

GlobalVariable Property VL_CDOInstalled  Auto

GlobalVariable Property VL_JConInstalled  Auto

GlobalVariable Property VL_IsJCValid  Auto

import debug
import utility

Event OnInit()
	VLLoadGame()
EndEvent

Event OnPlayerLoadGame()
	VLLoadGame()
EndEvent

Function VLLoadGame()
	If(VL_CameraSetting.GetValueInt() == 2)
		SetIniBool("bVATSDisable:VATS", true)
	else
		SetIniBool("bVATSDisable:VATS", false)
	endif
	
	trace("=======================================[ VioLens - A Killmove Mod: Start ]========================================")
	trace("                                                                                                                  ")
	trace("                VioLens is now performing a compatibility check. Papyrus warnings about missing or                ")
	trace("                       unloaded files may follow. This is normal and should be ignored.   		                 ")
	trace("                                                                                                                  ")
	trace("=======================================[ VioLens - A Killmove Mod: Start ]========================================")
	if (JContainers.isInstalled())
		VL_JConInstalled.SetValueInt(1)
		bool IsJCValid = (JContainers.APIVersion() == 3) && (JContainers.FeatureVersion() >= 1)
		VL_IsJCValid.SetValueInt(IsJCValid as int)
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
		trace("                                                                                                                  ")
		trace("                                              JContainers Installed.                                              ")
		trace("                                                                                                                  ")
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
	Else
		VL_JConInstalled.SetValueInt(0)
		VL_IsJCValid.SetValueInt(0)
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
		trace("                                                                                                                  ")
		trace("                                            JContainers Not Installed.                                            ")
		trace("                                                                                                                  ")
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
	Endif
	If(Game.GetFormFromFile(0x0045A4, "CombatDramaOverhaul.esp"))
		VL_CDOInstalled.SetValueInt(1)
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
		trace("                                                                                                                  ")
		trace("                                         Combat Drama Overhaul Installed.                                         ")
		trace("                                                                                                                  ")
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
	Else
		VL_CDOInstalled.SetValueInt(0)
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
		trace("                                                                                                                  ")
		trace("                                       Combat Drama Overhaul Not Installed.                                       ")
		trace("                                                                                                                  ")
		trace("===========================================[ VioLens - A Killmove Mod ]===========================================")
		If(VL_RangedLastEnemyRestriction.GetValueInt() == 0)
			SetINIBool("bVATSMultipleCombatants:VATS", true)
		else
			SetINIBool("bVATSMultipleCombatants:VATS", false)
		endif

		If(VL_RangedKillmove.GetValueInt() == 1)
			SetINIBool("bVATSIgnoreProjectileTest:VATS", false)
		elseif(VL_RangedKillmove.GetValueInt() == 2)
			SetINIBool("bVATSIgnoreProjectileTest:VATS", true)
		endif

		SetIniBool("bVATSAllowNoKill:VATS", false)
		SetIniBool("bVATSForceRanged:VATS", false)
		SetIniBool("bVATSRangedSelective:VATS", false)
		SetIniFloat("fVATSRangedLowHealthPercent:VATS", 100.0000)
		SetIniFloat("fVATSRangedPercentTargetNoThreat:VATS", 100.0000)
		SetIniFloat("fVATSRangedPercentMin:VATS", 100.0000)
		SetIniFloat("fVATSRangedPercentSneakKill:VATS", 100.0000)
	endif
	trace("========================================[ VioLens - A Killmove Mod: End ]=========================================")
	trace("                                                                                                                  ")
	trace("                                      VioLens compatibility check complete.                                       ")
	trace("                                                                                                                  ")
	trace("========================================[ VioLens - A Killmove Mod: End ]=========================================")
endFunction 
