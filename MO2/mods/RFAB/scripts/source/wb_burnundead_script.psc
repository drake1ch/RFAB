Scriptname WB_BurnUndead_Script extends ActiveMagicEffect  


; -----

Keyword Property MagicRestoreHealth Auto
Activator Property FXEmptyActivator Auto
Spell Property WB_S_R000_BurnUndead_Spell Auto

; -----

Actor TheTarget
Actor TheCaster
Float LastHealth
Float CurrentHealth
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool  abHitBlocked)

	If akSource.HasKeyword(MagicRestoreHealth)
		WB_S_R000_BurnUndead_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
		WB_S_R000_BurnUndead_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
	EndIf

EndEvent

; -----