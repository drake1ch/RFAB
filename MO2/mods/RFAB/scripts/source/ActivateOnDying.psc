Scriptname ActivateOnDying extends ObjectReference

objectReference Property Ref Auto

Event OnDying(Actor akKiller)

    Ref.Activate(game.GetPlayer())
EndEvent