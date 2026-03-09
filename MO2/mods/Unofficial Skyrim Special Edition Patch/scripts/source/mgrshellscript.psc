Scriptname MGRShellScript extends Quest Conditional

keyword Property MGRTolfdir auto
keyword Property MGRDrevis auto
keyword Property MGRSergius auto
keyword Property MGRUrag auto

bool Property MGR21FirstTime = false Auto Conditional ; USKP 1.3.2 Hijacking to add this so Urag doesn't repeat the Shalidor's Insights intro multiple times.

function StartTolfdirQuest()
; 	Debug.Trace("MGRShell Function Running")
	MGRTolfdir.SendStoryEvent()
EndFunction


function StartDrevisQuest()
	MGRDrevis.SendStoryEvent()
EndFunction


function StartSergiusQuest()
	MGRSergius.SendStoryEvent()
EndFunction

function StartUragQuest()
	MGRUrag.SendStoryEvent()
EndFunction


Bool Property pMGR01Done  Auto Conditional
Bool Property pMGR02Done  Auto Conditional
Bool Property pMGR10Done  Auto Conditional
Bool Property pMGR11Done  Auto Conditional
Bool Property pMGR12Done  Auto Conditional
Bool Property pMGR20Done  Auto Conditional

int Property MGRTolfdirDay  Auto Conditional
int Property MGRDrevisDay  Auto Conditional
int Property MGRSergiusDay  Auto Conditional
int Property MGRUragDay  Auto Conditional
