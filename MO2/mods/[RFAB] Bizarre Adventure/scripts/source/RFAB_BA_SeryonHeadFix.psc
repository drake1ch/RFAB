Scriptname RFAB_BA_SeryonHeadFix extends ReferenceAlias  

Event OnPlayerLoadGame()
	debug.messagebox("fix")
	Actor SelfRef = self.GetActorReference()

	HeadPart Beard = HeadPart.GetHeadPart("HairMaleDarkElf07")
	HeadPart Hairs = HeadPart.GetHeadPart("HumanBeard00NoBeard")  

	SelfRef.ChangeHeadPart(Beard)
	SelfRef.ChangeHeadPart(Hairs)
	SelfRef.QueueNiNodeUpdate()
EndEvent