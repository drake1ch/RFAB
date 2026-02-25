Scriptname RFAB_RecipeManager extends Quest

Actor Property Player Auto

Sound Property UISound Auto

string PATH_ICONS = "skyui/icons_category_psychosteve.swf"

int ID_ALCHEMY = 16
int ID_ENCHANTMENT = 16

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
	int j = 0
	while (i < akGlobals.Length)
		if (akGlobals[i].GetValue() == 0.0)
			akGlobals[i].SetValue(1.0)
			j += 1
		endif
		i += 1
	endwhile
	if (j > 0)
		ShowNotification("Выучено рецептов: " + j)
		return true
	endif
	return false
EndFunction

bool Function LearnEnchantments(Enchantment[] akEnchs)
	int i = 0
	int j = 0
	while (i < akEnchs.Length)
		Enchantment kEnch = akEnchs[i]
		if (!kEnch.PlayerKnows())
			RFAB_PapyrusFunctions.SetPlayerKnowsEnch(kEnch, true)
			j += 1
		endif
		i += 1
	endwhile
	if (j > 0)
		ShowNotification("Выучено зачарований: " + j)
		return true
	endif	
	return false
EndFunction

Function ShowNotification(string asText)
	UISound.Play(Player)
	Debug.Notification(asText)
EndFunction