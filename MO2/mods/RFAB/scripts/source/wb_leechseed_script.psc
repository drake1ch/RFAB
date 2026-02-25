Scriptname WB_LeechSeed_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Restoration_LeechSeed_Global_HealKill Auto
ImagespaceModifier Property WB_RestorationPeace_Imod_LeechSeed Auto
String Property WB_Stat Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnDying(Actor akKiller)

	Float HealthRestored = TheTarget.GetLevel() * WB_Restoration_LeechSeed_Global_HealKill.GetValueInt() * ((100-TheTarget.GetAV("PoisonResist"))/100)
	If HealthRestored > 0
		akKiller.RestoreAV(WB_Stat,HealthRestored)
		If akKiller == Game.GetPlayer() && WB_Stat == "Health"
			WB_RestorationPeace_Imod_LeechSeed.Apply()
		EndIf
	EndIf
	Dispel()

EndEvent

; -----