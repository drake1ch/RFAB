scriptName RestoreAVOnDying extends ActiveMagicEffect

String Property RestoredAV Auto

Event OnDying(Actor akKiller)
    If akKiller == game.GetPlayer()
        akKiller.RestoreAV(RestoredAV, self.GetMagnitude() as Float)
    EndIf
EndEvent