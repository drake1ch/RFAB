Scriptname WB_DarkSymmetry_Script extends activemagiceffect  

; -----

FormList Property WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom Auto
FormList Property WB_IllusionEmpathy_FormList_DarkSymmetry_TransferTo Auto
Spell Property WB_I000_DarkSymmetry_Spell_PC Auto
Float Property WB_FractionDamage Auto
Float Property WB_UpdateRate Auto
Message Property WB_IllusionEmpathy_Message_DarkSymmetry_NoOldSource Auto
GlobalVariable Property WB_Illusion_DarkSymmetry_Global_ScriptLockout Auto
EffectShader Property WB_FXS_Red Auto

; -----

Actor TheSource
Actor TheDest

Float SourceHealthCur
Float SourceHealthOri

Float SourceHealthDelta

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_Illusion_DarkSymmetry_Global_ScriptLockout.SetValue(1)
	Actor OldDest = WB_IllusionEmpathy_FormList_DarkSymmetry_TransferTo.GetAt(0) as Actor
	Actor OldSource = WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom.GetAt(0) as Actor

	If OldSource
		If akTarget != OldSource
			; clear the old destination target
			WB_IllusionEmpathy_FormList_DarkSymmetry_TransferTo.Revert()

			; turn the old source target into a new destination target
			OldSource.DispelSpell(WB_I000_DarkSymmetry_Spell_PC)
			WB_IllusionEmpathy_FormList_DarkSymmetry_TransferTo.AddForm(OldSource)

			; add the spell target as a new source target
			WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom.Revert()
			WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom.AddForm(akTarget)

			; save variables
			WB_Illusion_DarkSymmetry_Global_ScriptLockout.SetValue(0)
			TheSource = akTarget
			TheDest = OldSource
			SourceHealthOri = TheSource.GetActorValue("Health")

		Else
			; save variables
			WB_Illusion_DarkSymmetry_Global_ScriptLockout.SetValue(0)
			TheSource = akTarget
			TheDest = OldDest
			SourceHealthOri = TheSource.GetActorValue("Health")

		EndIf

		RegisterForSingleUpdate(WB_UpdateRate)

	Else
;		WB_IllusionEmpathy_Message_DarkSymmetry_NoOldSource.Show()

		; add the spell target as a new source target
		WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom.Revert()
		WB_IllusionEmpathy_FormList_DarkSymmetry_TransferFrom.AddForm(akTarget)

		; do not save variables because the spell will do nothing
		WB_Illusion_DarkSymmetry_Global_ScriptLockout.SetValue(0)

	EndIf

EndEvent

; -----

Event OnUpdate()

	SourceHealthCur = TheSource.GetActorValue("Health")
	SourceHealthDelta = SourceHealthOri - SourceHealthCur

	If SourceHealthDelta > 0
		WB_FXS_Red.Play(TheDest,WB_UpdateRate)
		TheDest.DamageActorValue("Health",SourceHealthDelta * WB_FractionDamage)
	EndIf

	SourceHealthOri = SourceHealthCur
	RegisterForSingleUpdate(WB_UpdateRate)
	; end of speed sensitive part

EndEvent

; -----