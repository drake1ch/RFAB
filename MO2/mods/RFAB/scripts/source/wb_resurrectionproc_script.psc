Scriptname WB_ResurrectionProc_Script extends ActiveMagicEffect  

; -----

Float Property WB_HasLOSRateInit Auto
Float Property WB_HasLOSRate Auto
Int Property WB_NoLOSThreshold Auto
Message Property WB_RestorationHeal_Message_Resurrection Auto

; -----

Actor TheTarget
Int NoLOSCount
Bool DoRes = true

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	NoLOSCount = 0
	TheTarget = akTarget
	DoRes = true
	RegisterForSingleUpdate(WB_HasLOSRateInit)

EndEvent

; -----

Event OnUpdate()

	If Game.GetPlayer().HasLOS(TheTarget)
		NoLOSCount = 0
		RegisterForUpdate(WB_HasLOSRate)
	Else
		NoLOSCount += 1
		If NoLOSCount >= WB_NoLOSThreshold
			Dispel()
		Else
			RegisterForUpdate(WB_HasLOSRate)
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If DoRes
		WB_RestorationHeal_Message_Resurrection.Show()
		akTarget.Resurrect()
	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	DoRes = false
	Dispel()

EndEvent

; -----