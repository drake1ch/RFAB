Scriptname RFAB_Script_AlduinPriestSummon extends ActiveMagicEffect  


ObjectReference Property Box  Auto 
SPELL Property mySpell  Auto 
SPELL[] Property SpellToRemove  Auto 
Float Property Delay = 0.0 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i = 0
	while i<SpellToRemove.length
		akTarget.RemoveSpell(SpellToRemove[i])
		i += 1
	endwhile
	
	;Utility.wait(Delay)
	Float X = Utility.RandomFloat(-600.0, 600.0)
	Float Y = Utility.RandomFloat(-600.0, 600.0)
	Box.MoveTo(Game.GetPlayer() as ObjectReference, X as float, Y as float, 100 as float)
	Myspell.Cast(akTarget, Box)

endevent