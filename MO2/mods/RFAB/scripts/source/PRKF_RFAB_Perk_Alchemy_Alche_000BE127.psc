;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname PRKF_RFAB_Perk_Alchemy_Alche_000BE127 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if (AlchemyChoice.Show() == 1)
	akTargetRef.Activate(akActor, true)
	return
endif
if (akTargetRef.IsActivationBlocked())
	return
endif
akTargetRef.BlockActivation(true)

CountsPoison = Utility.CreateIntArray(ExtractsPoison.Length, 0)
CountsPotion = Utility.CreateIntArray(ExtractsPotion.Length, 0)
Owner = akActor

int i = Ingredients.GetSize()
while (i > 0)
	i -= 1
	Form kForm = Ingredients.GetAt(i)
	int iCount = Owner.GetItemCount(kForm)
	if (iCount > 0 && !Game.IsObjectFavorited(kForm))
		string sName = kForm.GetName()
		bool bRemove = false

		int iTierIndex = PapyrusIniManipulator.PullIntFromIni(PATH_INGREDIENTS, sName, "Tier") - 1
		int iPoisonCount = PapyrusIniManipulator.PullIntFromIni(PATH_INGREDIENTS, sName, "Poison")
		int iPotionCount = PapyrusIniManipulator.PullIntFromIni(PATH_INGREDIENTS, sName, "Potion")

		if (iPoisonCount > 0)
			CountsPoison[iTierIndex] = CountsPoison[iTierIndex] + iPoisonCount * iCount
			bRemove = true
		endif
		if (iPotionCount > 0)
			CountsPotion[iTierIndex] = CountsPotion[iTierIndex] + iPotionCount * iCount
			bRemove = true
		endif
			
		if (bRemove)
			Owner.RemoveItem(kForm, iCount, true)
		endif
	endif
endwhile
GiveExtracts()

akTargetRef.BlockActivation(false)
akTargetRef.Activate(akActor, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function GiveExtracts()
	int i = 0
	while (i < ExtractsPoison.Length)
		if (CountsPoison[i] != 0)
			Owner.AddItem(ExtractsPoison[i], CountsPoison[i])
		endif
		i += 1
	endwhile
	i = 0
	while (i < ExtractsPotion.Length)
		if (CountsPotion[i] != 0)
			Owner.AddItem(ExtractsPotion[i], CountsPotion[i])
		endif
		i += 1
	endwhile	
EndFunction

string PATH_INGREDIENTS = "DATA/SKSE/PLUGINS/[RFAB] Ingredients.ini"

Ingredient[] Property ExtractsPoison Auto
int[] CountsPoison
Ingredient[] Property ExtractsPotion Auto
int[] CountsPotion

Message Property AlchemyChoice Auto

Formlist Property Ingredients Auto

Actor Owner
