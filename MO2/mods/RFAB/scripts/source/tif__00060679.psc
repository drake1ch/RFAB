scriptName TIF__00060679 extends TopicInfo hidden

Book property SKLxSmithing2 auto

GlobalVariable Property Xp auto
Float property AddXP auto
zzzSXPController Property XPC Auto

function Fragment_2(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().RemoveItem(SKLxSmithing2 as form, 1, false, none)
	akSpeaker.additem(SKLxSmithing2 as form, 1, false)
	;Int Xpn = AddXP as int / 1000
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification(""+akSpeaker.GetLeveledActorBase().GetName()+" обучила вас: "+Xpn+".000 опыта")
	string aName = akSpeaker.GetLeveledActorBase().GetName()+":"
	XPC.GainModXPMessage(AddXP as float, aName, true)
	self.GetOwningQuest().SetStage(20)
endFunction
