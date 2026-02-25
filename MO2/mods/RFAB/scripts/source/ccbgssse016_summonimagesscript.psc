;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_SummonImagesScript.psc
Modified : 2019-01-04 11:13:05
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_SummonImagesScript extends activemagiceffect

;-- Properties --------------------------------------
ccbgssse016_bosscontrollerscript property BossController auto
globalvariable property ccBGSSSE016_SummonImagesEnabled auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnEffectStart(Actor akTarget, Actor akCaster)

	ccBGSSSE016_SummonImagesEnabled.SetValueInt(0)
	BossController.SummonImages()
	BossController.SetUmbraInvulnerable(false)
	BossController.UmbraBoss.GetActorRef().EvaluatePackage()
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
