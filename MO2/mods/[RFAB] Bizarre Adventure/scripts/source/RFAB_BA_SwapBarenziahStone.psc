Scriptname RFAB_BA_SwapBarenziahStone extends ObjectReference  

Potion Property WeightPotion Auto

Event OnLoad()
    self.Disable()
    ObjectReference NewPotion = self.PlaceAtMe(WeightPotion)
    NewPotion.SetScale(1.5)
	NewPotion.SetMotionType(Motion_Keyframed, TRUE)
EndEvent