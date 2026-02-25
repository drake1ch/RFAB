Scriptname WB_CrackleNew_Script extends activemagiceffect  

; -----

;ImagespaceModifier Property MAGShockExpMassImod Auto
Activator Property FXEmptyActivator Auto
Spell Property WB_Crackle Auto
Float Property WB_Height Auto
Float Property WB_UpdateRate Auto
Float Property WB_Speed Auto
Activator Property WB_Destruction_Crackle_Activator Auto

; -----

ObjectReference TheBox
ObjectReference TheShooter
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

;	MAGShockExpMassImod.Apply()
	TheTarget = akTarget
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheShooter = TheBox.PlaceAtMe(WB_Destruction_Crackle_Activator)
	TheShooter.MoveTo(TheBox, 0, 0, WB_Height)
	WB_Crackle.RemoteCast(TheShooter, akCaster, TheBox)
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TheBox.MoveTo(TheTarget, 0, 0, WB_Height)
	TheShooter.TranslateToRef(TheBox, WB_Speed)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheShooter.InterruptCast()
	Utility.Wait(0.75)
	UnregisterForUpdate()
	TheShooter.InterruptCast()
	TheShooter.Disable(true)
	TheBox.Delete()
	TheShooter.Delete()

EndEvent

; -----