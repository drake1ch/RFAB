scriptName OghmaInfiniumScriptFix extends ObjectReference


quest property DA04 auto
Int property Advancement auto
message property ChoiceMessage auto
Bool property HasBeenRead auto
book property MySelf auto
float property stat_amount auto

int Property PerkCount = 3 Auto

RFAB_AttributeBonuses Property AttributeSystem Auto

function OnEquipped(Actor Reader)

	if Reader != game.GetPlayer()
		return 
	endIf
	self.ReadOghmaInfinium(false)
endFunction

function OnActivate(ObjectReference Reader)

	if Reader != game.GetPlayer() as ObjectReference || self.IsActivationBlocked()
		return 
	endIf
	self.ReadOghmaInfinium(true)
endFunction

function ReadOghmaInfinium(Bool fromWorld)

	self.GotoState("Reading")
	utility.WaitMenuMode(2.00000)
;/ 	if HasBeenRead as Bool || !DA04.GetStageDone(200) || (game.GetFormFromFile(16779742, "Update.esm") as globalvariable).GetValue() >= 1 as Float
		self.GotoState("")
		return 
	endIf /;
	Int choice = ChoiceMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	if choice == 0
		
	elseIf choice == 1
		game.GetPlayer().SetAV("Health", game.GetPlayer().GetBaseAV("Health") + stat_amount as Float)
	elseIf choice == 2
		game.GetPlayer().SetAV("Stamina", game.GetPlayer().GetBaseAV("Stamina") + stat_amount as Float)
	elseIf choice == 3
		game.GetPlayer().SetAV("Magicka", game.GetPlayer().GetBaseAV("Magicka") + stat_amount as Float)
	endIf
	if choice != 0
		game.AddPerkPoints(PerkCount)
		HasBeenRead = true
		(game.GetFormFromFile(16779742, "Update.esm") as globalvariable).SetValue(1 as Float)
		utility.Wait(0.100000)
		AttributeSystem.UpdateAttributeBonuses()
		Int OghmasInfinium = game.GetPlayer().GetItemCount(MySelf as form)
		game.GetPlayer().RemoveItem(MySelf as form, OghmasInfinium, false, none)
		if fromWorld && OghmasInfinium == 0
			self.Delete()
		endIf
		utility.WaitMenuMode(0 as Float)
	endIf
	self.GotoState("")
endFunction

state Reading

	function ReadOghmaInfinium(Bool fromWorld)

	endFunction
endState