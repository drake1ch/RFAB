Scriptname BQR_Butcher_On_Death extends Actor  

Quest Property FreeformRiften01  Auto  

Event OnDeath(Actor akKiller)
	If akKiller == Game.GetPlayer()
		FreeformRiften12.SetStage(200)
		FreeformRiften20.SetStage(250)
		FreeformRiften01.SetStage(40)
	Endif
EndEvent
Quest Property FreeformRiften20  Auto  

Quest Property FreeformRiften12  Auto  
