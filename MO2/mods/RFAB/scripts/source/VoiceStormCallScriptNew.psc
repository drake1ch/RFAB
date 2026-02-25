scriptName VoiceStormCallScriptNew extends ActiveMagicEffect

Spell Property CastingSpell Auto
Activator property FXEmptyActivator auto
ObjectReference EndBox
ObjectReference StartBox

Float Property Height Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    If !akTarget.IsDead()

		CastingSpell.SetNthEffectMagnitude(0, self.GetMagnitude())
		If akCaster.IsInInterior()
			Height = 150 as Float
		EndIf
		StartBox = akTarget.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
		EndBox = akTarget.PlaceAtMe(FXEmptyActivator as form, 1, false, false)

        StartBox.MoveTo(akTarget as ObjectReference, 0, 0, Height, true)
        EndBox.MoveTo(akTarget as ObjectReference, 0, 0, 10 as Float, true)
        CastingSpell.RemoteCast(StartBox, akCaster, EndBox)
		StartBox.Delete()
		EndBox.Delete()
    EndIf
EndEvent