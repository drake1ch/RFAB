Scriptname USKPCWCampLeadersFixScript extends Quest Hidden

ReferenceAlias Property UlfricAlias Auto
ReferenceAlias Property TulliusAlias Auto
Actor Property USKP_Ulfric  Auto  
Actor Property USKP_Tullius  Auto  

FormList Property USKPLegionCampCOList Auto
FormList Property USKPStormcloakCampCOList Auto

Function UnsetEssentialsInList( FormList USKPCampCOList )
	int x = 0

	While( x < USKPCampCOList.GetSize() )
		ActorBase FieldCO = USKPCampCOList.GetAt(x) as ActorBase
		
		FieldCO.SetEssential(false)
		
		x += 1
	EndWhile
EndFunction

Function FixThisShitOrElse()
	if ( USKP_Ulfric.isDead() == 1 ) || ( USKP_Tullius.isDead() == 1 ) ; Civil War questline is complete if either is dead
		;Imperial Legates
		UnsetEssentialsInList( USKPLegionCampCOList )

		; Stormcloak Commanders
		UnsetEssentialsInList( USKPStormcloakCampCOList )
		Stop()
	EndIf
EndFunction

;This event only matters for people who were using an old USKP version that has since been updated.
EVENT OnUpdate()
	if ( USKP_Ulfric.isDead() == 1 ) || ( USKP_Tullius.isDead() == 1 ) ; Civil War questline is complete if either is dead
		;Imperial Legates
		UnsetEssentialsInList( USKPLegionCampCOList )

		; Stormcloak Commanders
		UnsetEssentialsInList( USKPStormcloakCampCOList )
		Stop()
	Else
		UlfricAlias.ForceRefTo(USKP_Ulfric)
		TulliusAlias.ForceRefTo(USKP_Tullius)
	EndIf
	UnregisterForUpdate()
EndEVENT
