Scriptname WB_LocateObject_Script extends activemagiceffect  

; -----

Quest[] Property WB_FindQuest Auto
ReferenceAlias[] Property WB_FindRef Auto

Message[] Property WB_AlterationAlt_Message_Failure Auto
Message[] Property WB_AlterationAlt_Message_Success Auto
Message Property WB_AlterationAlt_Message_LocateObject Auto

Static Property WB_AlterationAlt_Static_FindOre Auto
Light Property WB_AlterationAlt_Light_FindOre Auto
Explosion Property WB_AlterationAlt_Explosion_FindOre Auto
EffectShader Property WB_AlterationAlt_FXS Auto
Float Property WB_Wait Auto
Int Property WB_AltSkill Auto
Float Property WB_InitialWait Auto

; -----

ObjectReference TheMarker
;ObjectReference TheLight
Int ObjectType
ObjectReference FoundObject

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(WB_AlterationAlt_Explosion_FindOre)
	ObjectType = WB_AlterationAlt_Message_LocateObject.Show()
	While WB_FindQuest[ObjectType].IsStopping()
		Utility.Wait(WB_InitialWait)
	EndWhile
	WB_FindQuest[ObjectType].Start()
	RegisterForSingleUpdate(WB_Wait)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_FindQuest[ObjectType].Stop()
	If FoundObject
		WB_AlterationAlt_FXS.Stop(FoundObject)
	;	TheLight.Delete()
		TheMarker.Disable(true)
		TheMarker.Delete()
	EndIf

EndEvent

; -----

Event OnUpdate()

	If WB_FindQuest[ObjectType].IsRunning()
		FoundObject = WB_FindRef[ObjectType].GetReference()
		WB_AlterationAlt_FXS.Play(FoundObject)
		TheMarker = FoundObject.PlaceAtMe(WB_AlterationAlt_Static_FindOre)
	;	TheLight = FoundObject.PlaceAtMe(WB_AlterationAlt_Light_FindOre,abInitiallyDisabled = true)
		WB_AlterationAlt_Message_Success[ObjectType].Show()
	;	TheLight.MoveTo(FoundObject,0,0,50)
	;	TheLight.Enable(true)
		Game.AdvanceSkill("Alteration", WB_AltSkill)
	Else
		WB_AlterationAlt_Message_Failure[ObjectType].Show()
		Dispel()
	EndIf

EndEvent

; -----