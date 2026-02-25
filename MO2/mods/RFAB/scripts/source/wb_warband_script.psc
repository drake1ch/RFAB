Scriptname WB_Warband_Script extends activemagiceffect  

; -----

Int Property WB_LevelMod = 0 Auto
Float Property WB_DistanceInFront Auto
Faction Property MagicAllegianceFaction Auto
Float Property WB_UpdateRate Auto
Spell Property WB_S_I100_EphemeralWarband_Spell_Ab_PC Auto
Faction Property WB_IllusoryEntity_Faction Auto

; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster
Float EndLocX
Float EndLocY

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetAngle = akTarget.GetAngleZ()
	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, WB_LevelMod)
	TheGhost.Disable()

	EndLocX = (WB_DistanceInFront*Math.Sin(TargetAngle))
	EndLocY = (WB_DistanceInFront*Math.Cos(TargetAngle))
	TheGhost.MoveTo(akTarget,EndLocX,EndLocY,0)
	TheGhost.SetAngle(akTarget.GetAngleX(), akTarget.GetAngleY(), TargetAngle)

	TheGhost.AddToFaction(WB_IllusoryEntity_Faction)
	TheGhost.AddToFaction(MagicAllegianceFaction)
	TheGhost.SetPlayerTeammate(true, false)
	TheGhost.Enable()
	TheGhost.AddSpell(WB_S_I100_EphemeralWarband_Spell_Ab_PC)

	Actor TargetCombatTarget = akTarget.GetCombatTarget()
	If TargetCombatTarget
		TheGhost.StartCombat(TargetCombatTarget)
	EndIf

	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Dispel()
	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead()
		Dispel()
	EndIf

EndEvent

; -----