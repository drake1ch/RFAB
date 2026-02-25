Scriptname RFAB_BA_DungeonDoor extends ObjectReference

bool Property MessageAboutDanger = false Auto

int Property StageWhenDisable = 100 Auto

int Property StageWhenOpen = 100 Auto

RFAB_BA_Dungeons ScriptDungeons
RFAB_BA_Radiant ScriptRadiant

Event OnCellAttach()
	Utility.Wait(1.0)

	ScriptDungeons = BizarreAdventure.GetDungeonScript()
	ScriptRadiant = BizarreAdventure.GetRadiantScript()
	int iStage = ScriptDungeons.StageNumber.GetValueInt()

	if iStage >= StageWhenDisable
		Disable()
		return
	endif

	if IsLocked() && iStage >= StageWhenOpen
		SetOpen()
		GoToState("Done")
	endif

	if GetState() == "Done"
		SetDisplayName(GetBaseObject().GetName())
	else
		SetDisplayName("Выход")
	endif

	if ScriptRadiant.IsRadiantCompleted()
		ToggleColor(abOpen = true)
	else
		RegisterForModEvent("RFAB_BA_Event_BossSlain", "OnBossSlain")
		ToggleColor(abClose = true)
	endif
EndEvent

Event OnCellDetach()
	UnregisterForModEvent("RFAB_BA_Event_BossSlain")
	ToggleColor(false, false)
	ScriptDungeons = None
	ScriptRadiant = None
EndEvent

Event OnBossSlain(Form akBoss)
	UnregisterForModEvent("RFAB_BA_Event_BossSlain")
	ToggleColor(abOpen = true)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		TryExit()
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		TryExit()
	endif
EndEvent

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
	EndEvent
EndState

Function TryExit()
	if !ScriptRadiant.IsRadiantCompleted()
		Debug.Notification("Сначала мне надо разобраться с врагами")
	else
		ScriptRadiant.ShowExit(MessageAboutDanger)
	endif
EndFunction

Function ToggleColor(bool abOpen = false, bool abClose = false)
	if (!HasWorldModel())
		return
	endif
	ScriptRadiant.DoorOpen.Stop(self)
	ScriptRadiant.DoorClosed.Stop(self)
	if (abOpen)
		ScriptRadiant.DoorOpen.Play(self)
	endif
	if (abClose)
		ScriptRadiant.DoorClosed.Play(self)
	endif
EndFunction