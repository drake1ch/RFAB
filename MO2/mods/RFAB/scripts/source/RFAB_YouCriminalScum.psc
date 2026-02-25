Scriptname RFAB_YouCriminalScum extends ActiveMagicEffect

RFAB_MCM_Alias Property Data Auto

GlobalVariable Property PlayerIsRighteous Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PlayerIsRighteous.SetValueInt(0)
	
	if (Data.IsBlessingMessageOn)
		Debug.Messagebox("Ваша праведность утрачена. Аэдра отвернулись от вас...")
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	PlayerIsRighteous.SetValueInt(1)

	if (Data.IsBlessingMessageOn)
		Debug.Messagebox("Ваша праведность восстановлена. Аэдра вернулись к вам...")
	endif
EndEvent