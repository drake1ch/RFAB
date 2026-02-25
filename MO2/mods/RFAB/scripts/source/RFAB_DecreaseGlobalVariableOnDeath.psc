Scriptname RFAB_DecreaseGlobalVariableOnDeath extends ReferenceAlias  

GlobalVariable Property GV  Auto  

Quest Property q  Auto  

Event OnDeath(Actor	akKiller)
	GV.SetValueInt(Gv.GetValueInt() - 1)
If GV.GetValueInt() == 0
	q.setstage(15)
EndIf
EndEvent