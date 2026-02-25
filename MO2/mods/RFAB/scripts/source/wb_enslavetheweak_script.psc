Scriptname WB_EnslaveTheWeak_Script extends activemagiceffect  

; -----

Quest Property WB_EnslaveTheWeak_Quest Auto
Float Property RRR_Wait Auto
Float Property RRR_Wait2 Auto
Message Property WB_IllusionPuppeteer_Message_EnslaveTheWeakFail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_EnslaveTheWeak_Quest.IsRunning()
		WB_EnslaveTheWeak_Quest.Stop()
	EndIf

	While WB_EnslaveTheWeak_Quest.IsStopping()
		Utility.Wait(RRR_Wait)
	EndWhile

	WB_EnslaveTheWeak_Quest.Start()

	Utility.Wait(RRR_Wait2)

	If !WB_EnslaveTheWeak_Quest.IsRunning()
		WB_IllusionPuppeteer_Message_EnslaveTheWeakFail.Show()
	EndIf
	Dispel()

EndEvent

; -----