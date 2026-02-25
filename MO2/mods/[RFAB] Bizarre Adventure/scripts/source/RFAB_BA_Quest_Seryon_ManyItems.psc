Scriptname RFAB_BA_Quest_Seryon_ManyItems extends Quest  

; Ia?ea?u ========================================================
ObjectReference Property HarmugstahlMarker Auto
ObjectReference Property JaphetsFollyBoatMarker Auto
ObjectReference Property MorvunskarMarker Auto
ObjectReference Property RannveigsFastMarker Auto

ReferenceAlias Property Alias_LocationMarker Auto

Function GoToNextStage(int aiStage)

	((self as Form) as RFAB_BA_Quest).GiveExperienceForSituation("Поручение Сириона", 5000)

	if       aiStage == 1
		Alias_LocationMarker.ForceRefTo(JaphetsFollyBoatMarker)

	elseif aiStage == 2
		Alias_LocationMarker.ForceRefTo(MorvunskarMarker)

	elseif aiStage == 3
		Alias_LocationMarker.ForceRefTo(RannveigsFastMarker)

	endif

EndFunction