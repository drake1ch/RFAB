Scriptname RFAB_OnDeath_SetStage extends ReferenceAlias  

Int Property Stage Auto

Event OnDeath(Actor akKiller)
    GetOwningQuest().SetStage(Stage)
EndEvent