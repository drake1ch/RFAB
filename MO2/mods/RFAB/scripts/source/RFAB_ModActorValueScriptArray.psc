scriptName RFAB_ModActorValueScriptArray extends ActiveMagicEffect

String[] property ActorValues auto

bool property detrimental = false auto
bool property Divided = false auto

Actor Property SelfRef Auto
float Modifier

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SelfRef = akTarget

    Modifier = GetMagnitude()
    if (Divided)
        Modifier /= 100.0
    endif

    if (detrimental)
        Modifier *= -1
    endif

    Int i = 0
    while i < ActorValues.length
        SelfRef.ModActorValue(ActorValues[i], Modifier)
        i += 1
    endWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Int i = 0
    while i < ActorValues.length
        SelfRef.ModActorValue(ActorValues[i], -Modifier)
        i += 1
    endWhile
EndEvent
