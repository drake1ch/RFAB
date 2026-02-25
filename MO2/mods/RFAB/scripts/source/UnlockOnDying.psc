Scriptname UnlockOnDying extends Actor

objectReference property Ref auto
objectReference property Ref2 auto
objectReference property Ref3 auto
objectReference property Ref4 auto
objectReference property Ref5 auto

Event OnDying(Actor akKiller)

    Ref.Lock(False)
    Ref2.Lock(False)
    Ref3.Lock(False)
    Ref4.Lock(False)
    Ref5.Lock(False)
EndEvent