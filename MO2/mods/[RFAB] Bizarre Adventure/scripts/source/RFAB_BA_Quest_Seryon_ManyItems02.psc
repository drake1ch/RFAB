Scriptname RFAB_BA_Quest_Seryon_ManyItems02 extends Quest  

ObjectReference Property AnsilvundMarker Auto
ObjectReference Property HillgrundsTombMarker Auto
ObjectReference Property YngvildMarker Auto

ReferenceAlias Property Alias_LocationMarker Auto

Function GoToStage(int aiStage)

	((self as Form) as RFAB_BA_Quest).GiveExperienceForSituation("Поручение Сириона", 5000)

	if      aiStage == 2
		Alias_LocationMarker.ForceRefTo(AnsilvundMarker)

	elseif aiStage == 3
		Alias_LocationMarker.ForceRefTo(HillgrundsTombMarker)

	elseif aiStage == 4
		Alias_LocationMarker.ForceRefTo(YngvildMarker)

	endif

EndFunction