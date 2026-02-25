Scriptname AddItemMenuSEInitAlias extends ReferenceAlias  

bool once = true

Spell Property additemspell1 Auto
Spell Property additemspell2 Auto

Event OnInit()
	utility.wait(3)
	Actor player = Game.GetPlayer()
	player.Addspell(additemspell1)
	player.Addspell(additemspell2)
	once = false
endEvent

Event OnPlayerLoadGame()
	if (once)
		OnInit()
	endif
endEvent
