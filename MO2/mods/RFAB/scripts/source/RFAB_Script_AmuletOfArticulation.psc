Scriptname RFAB_Script_AmuletOfArticulation extends ObjectReference

Perk[] Property SpeechPerk Auto
GlobalVariable[] Property SpeechGlobal Auto

Event OnEquipped(Actor akActor)
	if (akActor != Game.GetPlayer())
		return
	endif
	int i = 0
	while i < SpeechGlobal.length
		SpeechGlobal[i].SetValueInt(0)
		i += 1
	endwhile
	RFAB_PapyrusFunctions.UpdateVendors()
endEvent

Event OnUnequipped(Actor akActor)
	if akActor != Game.GetPlayer()
		return
	endif
	int i = 0
	while i < SpeechGlobal.length
		if !akActor.HasPerk(SpeechPerk[i])
			SpeechGlobal[i].SetValueInt(100)
		endif
		i += 1
	endwhile
	RFAB_PapyrusFunctions.UpdateVendors()
endEvent
