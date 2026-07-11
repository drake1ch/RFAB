;/ Decompiled by Champollion V1.0.1
Source   : RFAB_BA_DungeonEscape.psc
Modified : 2026-07-01 01:26:24
Compiled : 2026-07-01 01:26:25
User     : Kravc
Computer : DESKTOP-UQJG7B4
/;
scriptName RFAB_BA_DungeonEscape extends ActiveMagicEffect

;-- Properties --------------------------------------
rfab_ba_quests property ScriptQuests auto
location property HubLocation auto
quest property SewerQuest auto
rfab_ba_radiant property ScriptRadiant auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

    if akTarget.GetCurrentLocation() == HubLocation
        return 
    endIf
   if (akTarget == Game.GetPlayer())
      if SewerQuest.GetStage() == 10 || SewerQuest.GetStage() == 20 
        debug.Notification("Я не могу отсюда выбраться!") 
        return 
      endif
     endif
    if akTarget.IsInCombat()
        debug.Notification("Сначала мне надо разобраться с врагами")
        return 
    endIf
    if ScriptQuests.ActiveQuest.IsInQuestLocation()
        if ScriptQuests.ActiveQuest.IsAllowedToEspace()
            ScriptRadiant.ShowExit(false, true)
        else
            debug.Notification("Мне надо выполнить задание")
        endIf
        return 
    endIf
    if ScriptRadiant.IsRadiantCompleted()
        ScriptRadiant.ShowExit(false, true)
    else
        debug.Notification("Мне надо изучить локацию")
    endIf
endFunction
