Scriptname WB_Bonded_Script extends ObjectReference  

; ------

ReferenceAlias Property WB_Bonded_Target Auto
ImagespaceModifier Property WB_ConjurationSummon_Imod_Explosion Auto
Float Property WB_Delay Auto
Actor Property PlayerRef Auto
Spell Property WB_S_C075_BondOfSummoning_Spell_PC Auto
Float Property WB_MinDist Auto
EffectShader Property WB_ConjurationSummon_FXS_BondOfSummoning Auto
Activator Property WB_ConjurationSummon_Activator_BondOfSummoning_Portal Auto

; ------

Event OnLoad()

	Utility.Wait(WB_Delay)

	Actor SummonTarget = WB_Bonded_Target.GetActorRef()
	If SummonTarget && SummonTarget.GetDistance(Self) >= WB_MinDist
		ObjectReference ThePortal = Self.PlaceAtMe(WB_ConjurationSummon_Activator_BondOfSummoning_Portal)
		Utility.Wait(0.35)
;		SummonTarget.Disable()
		SummonTarget.MoveTo(ThePortal)
;		SummonTarget.Enable()
		WB_ConjurationSummon_FXS_BondOfSummoning.Play(SummonTarget, 4.0)
		Utility.Wait(0.1)
		WB_ConjurationSummon_Imod_Explosion.Apply()
		PlayerRef.DoCombatSpellApply(WB_S_C075_BondOfSummoning_Spell_PC,SummonTarget)
		Utility.Wait(5.0)
		Self.Delete()
		If ThePortal
			ThePortal.Delete()
		EndIf
	Else
		Self.Delete()
	EndIf

EndEvent

; ------