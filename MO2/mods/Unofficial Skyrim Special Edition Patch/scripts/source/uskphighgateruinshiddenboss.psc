Scriptname USKPHighGateRuinsHiddenBoss extends ObjectReference  
{;for USKP; this script enables 2 Draugr hidden behind walls}

OBJECTREFERENCE PROPERTY HiddenBoss AUTO

EVENT onActivate (objectReference triggerRef)
	IF HiddenBoss.isDisabled()
		HiddenBoss.enable()
	Endif	
endEVENT

