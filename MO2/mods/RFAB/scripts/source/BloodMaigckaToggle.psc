Scriptname BloodMaigckaToggle extends ActiveMagicEffect

GlobalVariable Property BMGlobal Auto

function OnEffectStart(actor akTarget, actor akCaster)

    BMGlobal.SetValue(1)
EndFunction

function OnEffectFinish(actor akTarget, actor akCaster)

    BMGlobal.SetValue(0)
EndFunction