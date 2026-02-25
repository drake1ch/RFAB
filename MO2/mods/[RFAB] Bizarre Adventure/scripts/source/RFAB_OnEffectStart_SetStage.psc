Scriptname RFAB_OnEffectStart_SetStage extends ActiveMagicEffect  

Quest Property MyQuest Auto
Int Property Stage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    (BizarreAdventure.GetRadiantScript().RadiantQuest.GetAliasByName("Boss") as ReferenceAlias).ForceRefTo(akCaster)
    MyQuest.SetStage(Stage)
EndEvent