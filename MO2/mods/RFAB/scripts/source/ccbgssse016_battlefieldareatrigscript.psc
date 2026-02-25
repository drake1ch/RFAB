;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_BattlefieldAreaTrigScript.psc
Modified : 2019-01-04 11:13:05
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_BattlefieldAreaTrigScript extends ObjectReference

;-- Properties --------------------------------------
ccbgssse016_bosscontrollerscript property BossController auto
globalvariable property battleOngoing auto
actor property PlayerRef auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == PlayerRef as ObjectReference && battleOngoing.GetValueInt() == 1
		BossController.ResetEncounter()
		battleOngoing.SetValueInt(0)
	endIf
endFunction
