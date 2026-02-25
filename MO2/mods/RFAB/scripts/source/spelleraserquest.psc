Scriptname SpellEraserQuest extends Quest
{Adds the Remove Spell spell.}

Spell property eraserSpell auto
{The spell that removes equipped spells.}

Actor theProtagonist

event OnInit()
	
	theProtagonist = Game.GetPlayer()
	
	if !theProtagonist.HasSpell(eraserSpell as Form)
		theProtagonist.AddSpell(eraserSpell)
	endIf
	
	self.RegisterForUpdate(3)
	
endEvent

event OnUpdate()

	bool continue = false

	if !theProtagonist.HasSpell(eraserSpell as Form)
		theProtagonist.AddSpell(eraserSpell)
		continue = true
	endIf
	
	if !continue
		self.UnregisterForUpdate()
	endIf
endEvent
