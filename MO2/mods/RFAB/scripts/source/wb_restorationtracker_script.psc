Scriptname WB_RestorationTracker_Script extends activemagiceffect  

; -----

WB_NewManager_Quest_Script Property WB_NewManager_Quest auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Debug.Trace("APOC 7.05 DEBUG: Starting Restoration fix!",1)
	WB_NewManager_Quest.FixRestoration()

EndEvent

; -----