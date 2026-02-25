Scriptname WB_MindControl_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_IllusionPuppeteer_Imod_PullTheirStringsLoop Auto
ImagespaceModifier Property WB_IllusionPuppeteer_Imod_PullTheirStringsEnd Auto
Float Property WB_ImodStrength Auto
ActorBase Property InvisibleNPC Auto
Bool Property WB_DisableCaster = false Auto
Bool Property WB_AggroIfKill = false Auto
Float Property WB_CheckEquippedRate Auto
GlobalVariable Property WB_Illusion_Global_IsControlling Auto
Faction Property MagicCharmFaction Auto
Keyword Property WB_IsDisableAI Auto

; -----

Actor TheTarget
Actor TheCaster
Bool WasTeammate

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.IsPlayerTeammate() || akTarget.IsInFaction(MagicCharmFaction)
		WasTeammate = true
	Else
		WasTeammate = false
	EndIf
	WB_Illusion_Global_IsControlling.Mod(1)
	WB_IllusionPuppeteer_Imod_PullTheirStringsLoop.Apply(WB_ImodStrength)

	If WB_DisableCaster
		Game.DisablePlayerControls(abCamSwitch=true)
	EndIf
	akTarget.SetPlayerControls(true)
	Game.SetPlayerAIDriven(true)
	Game.SetCameraTarget(akTarget)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()
	akTarget.AddToFaction(MagicCharmFaction)
	akTarget.SetPlayerTeammate(true, false)
	akTarget.EnableAI(true)
	akTarget.StopCombat()
	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForUpdate(WB_CheckEquippedRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If WB_DisableCaster
		Game.EnablePlayerControls()
	EndIf
	Game.SetCameraTarget(Game.GetPlayer())
	Game.SetPlayerAIDriven(false)

	akTarget.SetPlayerControls(false)
	If akTarget.HasEffectKeyword(WB_IsDisableAI)
		akTarget.EnableAI(false)
	Else
		akTarget.EnableAI(true)
	EndIf
	TheTarget.RemoveFromFaction(MagicCharmFaction)
	If !WasTeammate
		akTarget.SetPlayerTeammate(false, false)
	EndIf

	WB_IllusionPuppeteer_Imod_PullTheirStringsEnd.Apply(WB_ImodStrength)
	WB_IllusionPuppeteer_Imod_PullTheirStringsLoop.Remove()
	WB_Illusion_Global_IsControlling.Mod(-1)

EndEvent

; -----

Event OnDying(Actor akKiller)

	If WB_AggroIfKill
		TheTarget.SendAssaultAlarm()
	EndIf
	Dispel()

EndEvent

; -----

Event OnUpdate()

	If !TheCaster.IsWeaponDrawn()
		Dispel()
	EndIf

EndEvent

; -----