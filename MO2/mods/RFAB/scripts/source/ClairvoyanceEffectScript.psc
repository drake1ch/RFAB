scriptName ClairvoyanceEffectScript extends ActiveMagicEffect

RFAB_ConsoleCommands Property ConsoleCommands auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    ConsoleCommands.GetResists(akTarget)
EndEvent