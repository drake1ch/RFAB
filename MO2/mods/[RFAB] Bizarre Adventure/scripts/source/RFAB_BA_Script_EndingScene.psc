Scriptname RFAB_BA_Script_EndingScene extends ActiveMagicEffect  

GlobalVariable Property QuickStart  Auto  
Quest Property MainQuest  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Darkness.ApplyCrossFade(0.5)
	utility.Wait(0.45)
	QuickStart.SetValueInt(0)
	MainQuest.Reset()
	MainQuest.Setstage(10)
EndEvent


ImageSpaceModifier Property Darkness  Auto  
