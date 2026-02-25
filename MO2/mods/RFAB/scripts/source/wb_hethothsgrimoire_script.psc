Scriptname WB_HethothsGrimoire_Script extends activemagiceffect  

; -----

Activator Property WB_AlterationAlt_Activator_HethothsGrimoire Auto
Activator Property FXEmptyActivator Auto
Float Property WB_UpdateRate Auto
Float Property WB_DistanceInFront Auto
Float Property WB_DistanceInFrontSpawn Auto
Float Property WB_Height Auto
Message Property WB_AlterationAlt_Message_HethothsGrimoire_Fail Auto
Explosion Property WB_AlterationAlt_Explosion_CreateLodeOrb Auto
Spell Property WB_D100_ForbiddenSun_Spell_PC Auto
Spell Property WB_D100_StaticDome_Spell_PC Auto

; -----

Actor NearestActor
ObjectReference FinisherBox
Int CurrentCharges
ObjectReference CreatedBook
Actor CasterActor
Actor TargetActor
Spell TriggeredSpell

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TriggeredSpell = akCaster.GetEquippedSpell(0)
	If TriggeredSpell && (TriggeredSpell != WB_D100_ForbiddenSun_Spell_PC && TriggeredSpell != WB_D100_StaticDome_Spell_PC)
		CasterActor = akCaster
		TargetActor = akTarget
		CreatedBook = akTarget.PlaceAtMe(WB_AlterationAlt_Activator_HethothsGrimoire)
		CreatedBook.MoveTo(akTarget,(WB_DistanceInFrontSpawn*Math.Sin(akTarget.GetAngleZ())),(WB_DistanceInFrontSpawn*Math.Cos(akTarget.GetAngleZ())),WB_Height)
		CreatedBook.SetAngle(0,0,akTarget.GetAngleZ())
		FinisherBox = CreatedBook.PlaceAtMe(FXEmptyActivator)
		RegisterForUpdate(WB_UpdateRate)
	Else
		WB_AlterationAlt_Message_HethothsGrimoire_Fail.Show()
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CreatedBook.PlaceAtMe(WB_AlterationAlt_Explosion_CreateLodeOrb)
	CreatedBook.SetPosition(0,0,20000)
	Utility.Wait(2.0)
	CreatedBook.Delete()
	FinisherBox.Delete()

EndEvent

; -----

Event OnUpdate()

	If !Utility.IsInMenuMode()
		FinisherBox.MoveTo(CreatedBook,WB_DistanceInFront*Math.Sin(TargetActor.GetAngleZ()),WB_DistanceInFront*Math.Cos(TargetActor.GetAngleZ()),(WB_DistanceInFront*Math.Tan(-TargetActor.GetAngleX()) + 0))
		TriggeredSpell.RemoteCast(CreatedBook,CasterActor,FinisherBox)
	EndIf

EndEvent

; -----