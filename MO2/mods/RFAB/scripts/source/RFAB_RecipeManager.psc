Scriptname RFAB_RecipeManager extends Quest

Actor Property Player Auto

Sound Property UISound Auto

bool Function LearnRecipe(GlobalVariable akGlobal, string asName)
	if (akGlobal.GetValue() == 0.0)
		akGlobal.SetValue(1.0)
		ShowNotification("Выучен рецепт - " + asName)
		return true
	endif
	return false
EndFunction

bool Function LearnEnchantment(Enchantment akEnch)
	if (!akEnch.PlayerKnows())
		RFAB_PapyrusFunctions.SetPlayerKnowsEnch(akEnch, true)
		ShowNotification("Выучено зачарование - " + akEnch.GetName())
		return true
	endif
	return false
EndFunction

bool Function LearnRecipes(GlobalVariable[] akGlobals)
	int i = 0
	int iCount = 0
	while (i < akGlobals.Length)
		if (akGlobals[i].GetValue() == 0.0)
			akGlobals[i].SetValue(1.0)
			iCount += 1
		endif
		i += 1
	endwhile
	if (iCount > 0)
		ShowNotification("Выучено рецептов: " + iCount)
		return true
	endif
	return false
EndFunction

bool Function LearnEnchantments(Enchantment[] akEnchs)
	int i = 0
	int iCount = 0
	while (i < akEnchs.Length)
		Enchantment kEnch = akEnchs[i]
		if (!kEnch.PlayerKnows())
			RFAB_PapyrusFunctions.SetPlayerKnowsEnch(kEnch, true)
			iCount += 1
		endif
		i += 1
	endwhile
	if (iCount > 0)
		ShowNotification("Выучено зачарований: " + iCount)
		return true
	endif
	return false
EndFunction

bool Function LearnEnchantmentsList(Formlist akList)
	int i = akList.GetSize()
	int iCount = 0
	while (i > 0)
		i -= 1
		Enchantment kEnch = akList.GetAt(i) as Enchantment
		if (kEnch && !kEnch.PlayerKnows())
			RFAB_PapyrusFunctions.SetPlayerKnowsEnch(kEnch, true)
			iCount += 1
		endif
	endwhile
	if (iCount > 0)
		ShowNotification("Выучено зачарований: " + iCount)
		return true
	endif
	return false
EndFunction

Function ShowNotification(string asText)
	UISound.Play(Player)
	Debug.Notification(asText)
EndFunction