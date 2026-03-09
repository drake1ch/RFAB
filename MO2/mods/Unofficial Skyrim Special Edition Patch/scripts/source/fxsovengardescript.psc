Scriptname FXSovengardeSCRIPT extends ActiveMagicEffect  
{Puts the fx on the heavenly people of sovengarde}

VisualEffect Property FXSovengardeGlowEffect Auto
EffectShader Property SovengardeFXS Auto
Actor selfRef
ObjectReference myGlow

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		
		;USKP 2.0.1 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf
		
		;float myScale = selfRef.getScale()
; 		;debug.trace("my scale is" + myScale)
		;USKP 2.0.2 - Delay the effect to let 3D catch up.
		Utility.Wait(1.0)
		myGlow = FXSovengardeGlowEffect.play(selfRef, -1)
		;myGlow.setScale(myScale)
		SovengardeFXS.Play(selfRef)
	EndEvent
	