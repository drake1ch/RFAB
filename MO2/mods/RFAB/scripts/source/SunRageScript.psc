Scriptname SunRageScript extends ActiveMagicEffect

Spell Property SpellToCast Auto
Activator property FXEmptyActivator auto
ObjectReference EndBox
ObjectReference StartBox

Float Property Height Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    If !akTarget.IsDead()

		If akCaster.IsInInterior()
			Height = 150 as Float
		EndIf
		StartBox = akTarget.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
		EndBox = akTarget.PlaceAtMe(FXEmptyActivator as form, 1, false, false)

        StartBox.MoveTo(akTarget as ObjectReference, 0, 0, Height, true)
        EndBox.MoveTo(akTarget as ObjectReference, 0, 0, 10 as Float, true)
        SpellToCast.RemoteCast(StartBox, akCaster, EndBox)
		StartBox.Delete()
		EndBox.Delete()
    EndIf
EndEvent