scriptName TIF__00094079 extends TopicInfo hidden

GlobalVariable Property Xp auto
Float property AddXP auto
zzzSXPController Property XPC Auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	;Int Xpn = AddXP as int / 1000
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification(""+akSpeaker.GetLeveledActorBase().GetName()+" обучил вас: "+Xpn+".000 опыта")
	string aName = akSpeaker.GetLeveledActorBase().GetName()+":"
	XPC.GainModXPMessage(AddXP as float, aName, true)
	self.GetOwningQuest().SetStage(20)
endFunction
