scriptName TIF__0009408C extends TopicInfo hidden

MiscObject property MammothTusk auto
Book property SKLxAlchemy3 auto
LeveledItem property FavorRewardArmor auto
Potion property BlackBriarMead auto
Book property SKLxOneHanded4 auto
GlobalVariable Property Xp auto
Float property AddXP auto
zzzSXPController Property XPC Auto

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().RemoveItem(SKLxAlchemy3 as form, 1, false, none)
	akSpeaker.AddItem(SKLxAlchemy3 as form, 1, false)
	;Int Xpn = AddXP as int / 1000
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification(""+akSpeaker.GetLeveledActorBase().GetName()+" обучила вас: "+Xpn+".000 опыта")
	string aName = akSpeaker.GetLeveledActorBase().GetName()+":"
	XPC.GainModXPMessage(AddXP as float, aName, true)
	self.GetOwningQuest().SetStage(20)
endFunction
