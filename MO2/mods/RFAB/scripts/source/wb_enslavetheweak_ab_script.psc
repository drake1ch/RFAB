Scriptname WB_EnslaveTheWeak_Ab_Script extends activemagiceffect  

; -----

Quest Property WB_EnslaveTheWeak_Quest Auto

; -----

Event OnDying(Actor akKiller)

	Utility.Wait(1.0)
	WB_EnslaveTheWeak_Quest.Stop()

EndEvent

; -----