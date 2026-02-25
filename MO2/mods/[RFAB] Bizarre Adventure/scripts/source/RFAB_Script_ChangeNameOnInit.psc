Scriptname RFAB_Script_ChangeNameOnInit extends ObjectReference  

String[] Property Name Auto 
GlobalVariable Property RFAB_BA_Stage Auto 

Event OnInit()
	float stage = RFAB_BA_Stage.GetValue()
	if (stage > 2.00 && stage < 5.00)
		(self as ObjectReference).SetDisplayName(Name[0])
	endif
		if (stage > 4.00)
		(self as ObjectReference).SetDisplayName(Name[1])
	endif
endevent
