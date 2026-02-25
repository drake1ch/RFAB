Scriptname RFAB_LunarForge extends ObjectReference  

Keyword Property LunarForge Auto
Keyword Property DefaultForge Auto

Event OnInit()
	BlockActivation(true)
EndEvent

Event OnActivate(ObjectReference akRef)
	if (akRef == Game.GetPlayer())
		int iHour = GetGameHour()
		if (iHour >= 0 && iHour <= 3)
			PO3_SKSEFunctions.ReplaceKeywordOnRef(self, DefaultForge, LunarForge)
		else
			PO3_SKSEFunctions.ReplaceKeywordOnRef(self, LunarForge, DefaultForge)
		endif
	endif
	Activate(akRef, true)
EndEvent

int Function GetGameHour()
	float fCurrentTime = Utility.GetCurrentGameTime()
	return ((fCurrentTime - fCurrentTime as int) * 24) as int
EndFunction