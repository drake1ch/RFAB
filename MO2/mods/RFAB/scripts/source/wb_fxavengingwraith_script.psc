Scriptname WB_FXAvengingWraith_Script extends activemagiceffect  

; -----

GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Health Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Magicka Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Stamina Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Level Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Mult Auto

Float Property WB_DefaultHealth Auto
Float Property WB_DefaultMagicka Auto
Float Property WB_DefaultStamina Auto
Int Property WB_DefaultLevel Auto

VisualEffect Property WB_ConjurationUndead_VFX_EyesFemale Auto

; -----

Float StatMult

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_ConjurationUndead_VFX_EyesFemale.Play(akTarget, -1)

	StatMult = (WB_Conjuration_ConjureAvengingWraith_Global_Mult.GetValue() as Int) / 100

	akTarget.SetActorValue("Health",WB_Conjuration_ConjureAvengingWraith_Global_Health.GetValue())
	akTarget.SetActorValue("Magicka",WB_Conjuration_ConjureAvengingWraith_Global_Magicka.GetValue())
	akTarget.SetActorValue("Stamina",WB_Conjuration_ConjureAvengingWraith_Global_Stamina.GetValue())

	akTarget.RestoreActorValue("Health",9999)
	akTarget.RestoreActorValue("Magicka",9999)
	akTarget.RestoreActorValue("Stamina",9999)

EndEvent

; -----

Event OnDying(Actor akKiller)

	If akKiller
		Float ActorValue
		ActorValue = akKiller.GetActorValue("Health")
		If ActorValue > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue((ActorValue / akKiller.GetActorValuePercentage("Health")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		EndIf

		akKiller.RestoreActorValue("Magicka", 2.5)	; fudge in case the target is out of magicka
		ActorValue = akKiller.GetActorValue("Magicka")
		If ActorValue > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue((ActorValue / akKiller.GetActorValuePercentage("Magicka")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		EndIf

		akKiller.RestoreActorValue("Stamina", 2.5)	; fudge in case the target is out of stamina
		ActorValue = akKiller.GetActorValue("Stamina")
		If ActorValue > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue((ActorValue / akKiller.GetActorValuePercentage("Stamina")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		EndIf

		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValue(akKiller.GetLevel())
	Else
		WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValueInt(WB_DefaultLevel)
	EndIf

	WB_ConjurationUndead_VFX_EyesFemale.Stop(GetTargetActor())

EndEvent

; -----