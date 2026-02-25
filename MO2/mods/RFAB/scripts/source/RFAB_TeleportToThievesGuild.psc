Scriptname RFAB_TeleportToThievesGuild extends ObjectReference  

Quest Property TG01 Auto 
Perk Property NeededPerk Auto

Message Property MessageNoTG Auto
Message Property MessageWithPerk Auto
Message Property MessageWithoutPerk Auto

ObjectReference Property TGMarker Auto

Event OnActivate(ObjectReference akRef)
    if akRef != Game.GetPlayer()
    	return
    endif

	if !TG01.GetStageDone(20)
    	MessageNoTG.Show()
    	return
    endif

	if !(akRef as Actor).HasPerk(NeededPerk)
		MessageWithoutPerk.Show()
	else
		int iChooseID = MessageWithPerk.Show()
		if iChooseID == 0
			akRef.MoveTo(TGMarker)
		endif
	endif
EndEvent