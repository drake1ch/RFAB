Scriptname WB_BoneSpirit_Script extends ActiveMagicEffect  

; ------

Static Property WB_RestorationUndead_Static_BoneSpirit Auto

Activator Property FXEmptyActivator Auto
Float Property WB_StartHeight Auto
Float Property WB_AttackRate Auto

Spell Property WB_S_R000_BoneSpirit_Spell Auto

Float Property WB_Speed Auto

Float Property WB_SeekRange Auto

; ------

ObjectReference TheOrb
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	TheOrb = TheCaster.PlaceAtMe(WB_RestorationUndead_Static_BoneSpirit, abInitiallyDisabled = true)
	TheOrb.SetAngle(0,0,0)
	TheOrb.MoveTo(TheCaster,0,0,WB_StartHeight)
	TheOrb.Enable()
	Utility.Wait(0.1)

	RegisterForSingleUpdate(WB_AttackRate)
	TheOrb.TranslateToRef(akTarget,WB_Speed)

EndEvent

; ------

Event OnUpdate()

	If TheOrb.GetDistance(TheTarget) <= WB_SeekRange
		WB_S_R000_BoneSpirit_Spell.RemoteCast(TheOrb,TheCaster,TheTarget)
		Dispel()
	Else
		TheOrb.TranslateToRef(TheTarget,WB_Speed)
		RegisterForSingleUpdate(WB_AttackRate)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheOrb.StopTranslation()
	TheOrb.Delete()

EndEvent

; -----