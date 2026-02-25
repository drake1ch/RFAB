Scriptname WB_Char_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_D025_Char_Spell Auto
Activator Property FXEmptyActivator Auto

; -----

Actor TheCaster
Actor TheTarget
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	If akCaster
		TheCaster = akCaster
		TheBox = akCaster.PlaceAtMe(FXEmptyActivator)
	Else
		TheCaster = Game.GetPlayer()
		TheBox = Game.GetPlayer().PlaceAtMe(FXEmptyActivator)		
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----

Event OnDying(Actor akKiller)

	WB_S_D025_Char_Spell.RemoteCast(TheBox,TheCaster,TheTarget)

EndEvent

; -----