Scriptname KruziikUnlockDoor extends ObjectReference  

ObjectReference Property Door01 auto

ObjectReference Property BossEntranceObject1 auto
ObjectReference Property BossEntranceObject2 auto
ObjectReference Property BossEntranceObject3 auto

ObjectReference Property BossEntranceDoor auto

Event OnDeath(Actor akKiller)
	EndBossFight()
EndEvent

Function EndBossFight()
    Door01.Lock(false)

    BossEntranceObject1.Enable()
    BossEntranceObject2.Enable()
    BossEntranceObject3.Enable()
    BossEntranceDoor.Disable()
EndFunction