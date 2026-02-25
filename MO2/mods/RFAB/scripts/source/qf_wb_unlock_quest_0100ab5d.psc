;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WB_Unlock_Quest_0100AB5D Extends Quest Hidden

;BEGIN ALIAS PROPERTY WB_Unlock_Activator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Unlock_Activator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Unlock_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Unlock_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Unlock_Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Unlock_Door Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ObjectReference DoorReference = Alias_WB_Unlock_Door.GetReference()
Debug.Trace("APOCALYPSE DEBUG: Lock " + DoorReference + " found!")
If DoorReference.GetLockLevel() <= (PlayerRef.GetAV("Alteration") - 25)
	If DoorReference.GetLockLevel() <= (PlayerRef.GetAV("Alteration") - 50)
		(WB_AlterationAlt_FormList_DetonateLock_H.GetAt(Utility.RandomInt(0,WB_AlterationAlt_FormList_DetonateLock_H.GetSize() - 1)) as Message).Show()
	Else
		WB_AlterationAlt_Message_DetonateLock_Success.Show()
	EndIf
	Game.AdvanceSkill("Alteration",DoorReference.GetLockLevel() / 5)
	DoorReference.PlaceAtMe(WB_AlterationAlt_Explosion)
	WB_AlterationAlt_FXS.Play(DoorReference,1.5)
	DoorReference.Lock(false)
Else
	WB_AlterationAlt_Message_DetonateLock_Failure.Show()
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property WB_AlterationAlt_Message_DetonateLock_Success  Auto  

Message Property WB_AlterationAlt_Message_DetonateLock_Failure  Auto  

FormList Property WB_AlterationAlt_FormList_DetonateLock_H  Auto  

Explosion Property WB_AlterationAlt_Explosion  Auto  

Actor Property PlayerRef  Auto  

EffectShader Property WB_AlterationAlt_FXS  Auto  
