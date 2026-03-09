Scriptname UDGP_Retroactive122Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive123Script Property Retro123 Auto

ReferenceAlias Property Serana Auto
Armor Property Hood Auto

ObjectReference Property WitchhunterLodgeMarker Auto
ObjectReference Property DLC1HunterBaseIntroIsranStartMarker Auto
Quest Property DLC1VQ01MiscObjective Auto

QF_DA03_0001BFC4 Property DA03 Auto
AchievementsScript Property AchievementsQuest Auto
ObjectReference Property BarbasMovetoMarker Auto
Topic Property EndTopic Auto
Activator Property SummonFx Auto

ObjectReference Property CanyonDoor Auto
ReferenceAlias Property CanyonDoorAlias Auto

Weather Property SoulCairnAmb01 Auto
Weather Property SoulCairnAmb01_Rain Auto
Weather Property SoulCairnAmb02 Auto
Weather Property SoulCairnAmb03 Auto
Weather Property SoulCairnAmb04 Auto
Weather Property SoulCairnAurora Auto
Formlist Property WeatherExceptionList Auto

Worldspace Property DLC01SoulCairn Auto
Formlist Property OversizedSummoningExceptionWorldSpaces Auto

Function Process()
	if( !WeatherExceptionList.HasForm(SoulCairnAmb01) )
		WeatherExceptionList.AddForm(SoulCairnAmb01)
	EndIf
	if( !WeatherExceptionList.HasForm(SoulCairnAmb01_Rain) )
		WeatherExceptionList.AddForm(SoulCairnAmb01_Rain)
	EndIf
	if( !WeatherExceptionList.HasForm(SoulCairnAmb02) )
		WeatherExceptionList.AddForm(SoulCairnAmb02)
	EndIf
	if( !WeatherExceptionList.HasForm(SoulCairnAmb03) )
		WeatherExceptionList.AddForm(SoulCairnAmb03)
	EndIf
	if( !WeatherExceptionList.HasForm(SoulCairnAmb04) )
		WeatherExceptionList.AddForm(SoulCairnAmb04)
	EndIf
	if( !WeatherExceptionList.HasForm(SoulCairnAurora) )
		WeatherExceptionList.AddForm(SoulCairnAurora)
	EndIf

	if( !OversizedSummoningExceptionWorldSpaces.HasForm(DLC01SoulCairn) )
		OversizedSummoningExceptionWorldSpaces.AddForm(DLC01SoulCairn)
	EndIf

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.2.2 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 122
		Retro123.Process()
		Stop()
		Return
	EndIf

	;Bug #12582 - Serana has an inventory full of hoods, even though she shouldn't.
	Serana.GetActorReference().RemoveItem(Hood, 999)

	;Bug #12368 - Vigilant spawns don't patrol due to their hall being destroyed
	if( DLC1VQ01MiscObjective.GetStage() >= 5 )
		WitchhunterLodgeMarker.MoveTo(DLC1HunterBaseIntroIsranStartMarker)
	EndIf

	;Bug #12391 - Dawnguard wiped out several properties on DA03. Once repaired, issue the achievement update call again.
	DA03.AchievementsQuest = AchievementsQuest
	DA03.BarbasMovetoMarker = BarbasMovetoMarker
	DA03.EndTopic = EndTopic
	DA03.SummonFx = SummonFx
	if( DA03.GetStage() >= 200 )
		AchievementsQuest.IncDaedricQuests()
	EndIf
	
	;Quest marker points in wildly wrong directions when trying to reach Dayspring Canyon
	if( DLC1VQ01MiscObjective.IsRunning() )
		CanyonDoorAlias.ForceRefTo(CanyonDoor)
	EndIf
	
	debug.trace( "UDGP 1.2.2 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 122
	Retro123.Process()
	Stop()
EndFunction
