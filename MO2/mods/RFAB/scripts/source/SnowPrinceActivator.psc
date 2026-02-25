Scriptname SnowPrinceActivator extends ObjectReference

objectReference Property DoorRef Auto
objectReference Property SnowPrinceRef Auto
Explosion Property Exp Auto
Explosion Property Exp2 Auto
Bool activate = true

Event OnActivate(ObjectReference akActionRef)

    If akActionRef == game.GetPlayer() && activate
        BlockActivation()
        activate = false
        SnowPrinceRef.Enable()
        DoorRef.SetLockLevel(255)
        DoorRef.Lock(True)
        SnowPrinceRef.PlaceAtMe(Exp, 1, false, false)
        SnowPrinceRef.PlaceAtMe(Exp2, 1, false, false)
    EndIf
EndEvent