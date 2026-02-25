Scriptname WB_CraftlordStats_Script extends activemagiceffect  

; -----

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_Armor Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_AttackMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_HealthMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_MagickaMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_MagicResist Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_StaminaMult Auto

GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_SpellMult Auto
GlobalVariable Property WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int BaseStats = akTarget.GetLevel() * 5

	akTarget.SetActorValue("Health", BaseStats * WB_Conjuration_ConjureCraftlord_Global_HealthMult.GetValue())
	akTarget.SetActorValue("Magicka", BaseStats * WB_Conjuration_ConjureCraftlord_Global_MagickaMult.GetValue())
	akTarget.SetActorValue("Stamina", BaseStats * WB_Conjuration_ConjureCraftlord_Global_StaminaMult.GetValue())

	akTarget.SetActorValue("DamageResist", 200 + WB_Conjuration_ConjureCraftlord_Global_Armor.GetValue())
	akTarget.SetActorValue("MagicResist", WB_Conjuration_ConjureCraftlord_Global_MagicResist.GetValue())

	akTarget.SetActorValue("AttackDamageMult", WB_Conjuration_ConjureCraftlord_Global_AttackMult.GetValue())

	akTarget.SetActorValue("Variable01", WB_Conjuration_ConjureCraftlord_Global_PowerAttackMult.GetValue())
	akTarget.SetActorValue("Variable02", WB_Conjuration_ConjureCraftlord_Global_SpellMult.GetValue())
	akTarget.SetActorValue("Variable03", WB_Conjuration_ConjureCraftlord_Global_LifeDrainMult.GetValue())

EndEvent

; -----