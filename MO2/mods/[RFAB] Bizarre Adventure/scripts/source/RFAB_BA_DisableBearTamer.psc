Scriptname RFAB_BA_DisableBearTamer extends ObjectReference  

ObjectReference Property BearTamerChest auto
ObjectReference[] Property BearTamerActi auto
Bool activated

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		BearTamerChest.Activate(Game.GetPlayer())
		BearTamerChest.Activate(BearTamerChest)
	endif

	activated = true
	int i = 0
	while i < BearTamerActi.length
		if BearTamerActi[i] != self 
			BearTamerActi[i].Disable()
		endif
		i+=1
	endwhile
endevent