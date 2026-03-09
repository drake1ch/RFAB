;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB09GuardYellScene_00064374 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;USKP 2.0.4 - No sanity checking for dead guards existed.
pDB09Script Script = DB09 as pDB09Script
if Script.pDecoyDeadPoison == 1
	if( !pEmpGuard1Alias.GetActorReference().IsDead() )
		pEmpGuard1Alias.GetActorReference().StartCombat(Game.GetPlayer())
		pEmpGuard1Alias.GetActorReference().AddToFaction(DBAttackPlayerFaction)
	EndIf
	if( !pEmpGuard2Alias.GetActorReference().IsDead() )
		pEmpGuard2Alias.GetActorReference().StartCombat(Game.GetPlayer())
		pEmpGuard2Alias.GetActorReference().AddToFaction(DBAttackPlayerFaction)
	endif
endif

if Script.pDecoyDeadPoison == 2
	GiannaScreamScene.Start()
	if( !pEmpGuard1Alias.GetActorReference().IsDead() )
		pEmpGuard1Alias.GetActorReference().StartCombat(Game.GetPlayer())
		pEmpGuard1Alias.GetActorReference().AddToFaction(DBAttackPlayerFaction)
	EndIf
	if( !pEmpGuard2Alias.GetActorReference().IsDead() )
		pEmpGuard2Alias.GetActorReference().StartCombat( pGiannaAlias.GetActorRef())
		pEmpGuard2Alias.GetActorReference().AddToFaction(DBAttackGiannaFaction)
	EndIf
endif

Actor Decoy = DecoyAlias.GetReference() as Actor
Decoy.SendAssaultAlarm()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pGiannaAlias  Auto  

ReferenceAlias Property pEmpGuard1Alias  Auto  

ReferenceAlias Property pEmpGuard2Alias  Auto  

Quest Property DB09  Auto  

Scene Property GiannaScreamScene  Auto  

Faction Property DBAttackPlayerFaction  Auto  

Faction Property DBAttackGiannaFaction  Auto  

ReferenceAlias Property DecoyAlias  Auto  
