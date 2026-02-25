scriptName TIF__00079AE2 extends TopicInfo hidden

MiscObject property MammothTusk auto
GlobalVariable Property Xp auto
Float property AddXP auto
zzzSXPController Property XPC Auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().RemoveItem(MammothTusk as form, 1, false, none)
	akSpeaker.AddItem(MammothTusk as form, 1, false)
	;Int Xpn = AddXP as int / 1000
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification(""+akSpeaker.GetLeveledActorBase().GetName()+" обучила вас: "+Xpn+".000 опыта")
	string aName = akSpeaker.GetLeveledActorBase().GetName()+":"
	XPC.GainModXPMessage(AddXP as float, aName, true)
	self.GetOwningQuest().SetStage(20)
endFunction
