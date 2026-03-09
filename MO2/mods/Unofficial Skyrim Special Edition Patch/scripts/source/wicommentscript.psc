Scriptname WICommentScript extends Quest  

;Primarily used to handle functionality of setting globals that are used by individual WIComment quests to control how often comments about the player are heard

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property WICommentNextAllowed auto

float DaysUntilNextAllowed = 0.16  ;about 1 "game hour" expressed in GameDaysPassed (USKP 1.3.1 - change to 4 hours to be in line with guard dialogues about the same things)

Function Commented()
	float NextAllowed = GameDaysPassed.GetValue() + DaysUntilNextAllowed
	
; 	debug.trace("WICommentScript Commented() setting WICommentNextAllowed to " + NextAllowed)
	
	WICommentNextAllowed.SetValue(NextAllowed)

EndFunction
