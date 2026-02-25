Scriptname RFAB_AutoLoot extends ReferenceALias  

import RFAB_PapyrusFunctions

Spell Property CollectCloak Auto
{Пассивный сбор}
Spell Property CollectExplosion Auto
{По клавише} 

Keyword Property LeatherToSell Auto
Keyword Property VendorItemKey Auto

Keyword Property VendorNoSale Auto
Keyword Property Trophy Auto

Keyword Property ArmorMaterialDaedric Auto
Keyword Property WeapMaterialDaedric Auto
Keyword Property DaedricArtifact Auto

MiscObject Property Septim Auto

FormList Property StackActors Auto

GlobalVariable Property AutoLootInCombat Auto

string FileName = "RFAB_MCM_Settings.json"

bool _LootByCloak
bool Property LootByCloak Hidden
	bool Function Get()
		return _LootByCloak
	EndFunction
	Function Set(bool abValue)
		_LootByCloak = abValue
		if (abValue)
			Player.AddSpell(CollectCloak, true)
		else
			Player.RemoveSpell(CollectCloak)			
		endif
	EndFunction
EndProperty

; Подбор в бою
bool Property InCombat Hidden
	bool Function Get()
		return AutoLootInCombat.GetValue() as bool
	EndFunction
	Function Set(bool abValue)
		AutoLootInCombat.SetValue(abValue as int)
	EndFunction
EndProperty

bool _LootByHotKey
bool Property LootByHotKey Hidden
	bool Function Get()
		return _LootByHotKey
	EndFunction
	Function Set(bool abValue)
		_LootByHotKey = abValue
		if (_LootByHotKey)
			RegisterForKey(HotKey)		
		else
			UnregisterForKey(HotKey)
		endif
	EndFunction
EndProperty

int Property HotKey Hidden
	int Function Get()
		return JsonUtil.GetPathIntValue(FileName, ".AutoLoot.HotKey")
	EndFunction
	Function Set(int aiValue)
		UnregisterForAllKeys()
		RegisterForKey(aiValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.HotKey", aiValue)
		JsonUtil.Save(FileName)
		UpdateVariables()
	EndFunction
EndProperty

string[] Property Methods Auto Hidden
{Подбирать всё, цена/вес, цена, вес}

string[] Property MethodsStates Auto Hidden

int Property MethodID Hidden
	int Function Get()
		return JsonUtil.GetPathIntValue(FileName, ".AutoLoot.MethodID")
	EndFunction
	Function Set(int aiValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.MethodID", aiValue)
		JsonUtil.Save(FileName)
		UpdateVariables()
	EndFunction
EndProperty

; Подбор игредиентов и шкур
bool Property LootMisc Hidden
	bool Function Get()
		return JsonUtil.GetPathBoolValue(FileName, ".AutoLoot.LootMisc")
	EndFunction
	Function Set(bool abValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.LootMisc", abValue as int)
		JsonUtil.Save(FileName)
		UpdateVariables()
	EndFunction
EndProperty

; Подбор трофеев
bool Property LootTrophies Hidden
	bool Function Get()
		return JsonUtil.GetPathBoolValue(FileName, ".AutoLoot.LootTrophies")
	EndFunction
	Function Set(bool abValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.LootTrophies", abValue as int)
		JsonUtil.Save(FileName)	
		UpdateVariables()
	EndFunction
EndProperty

; Предотвращение перегруза
bool Property DisallowOverWeight Hidden
	bool Function Get()
		return JsonUtil.GetPathBoolValue(FileName, ".AutoLoot.AllowOverWeight")
	EndFunction
	Function Set(bool abValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.AllowOverWeight", abValue as int)
		JsonUtil.Save(FileName)
		UpdateVariables()
	EndFunction
EndProperty

; Не брать неправедные предметы
bool Property SaveBlessing Hidden
	bool Function Get()
		return JsonUtil.GetPathBoolValue(FileName, ".AutoLoot.SaveBlessing")
	EndFunction
	Function Set(bool abValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.SaveBlessing", abValue as int)
		JsonUtil.Save(FileName)
		UpdateVariables()
	EndFunction
EndProperty

; Значение подбора предметов
; Собирать ниже веса
; Собирать выше цены
; Собирать если цена/вес выше
int Property Value Hidden
	int Function Get()
		return JsonUtil.GetPathIntValue(FileName, ".AutoLoot.Value")
	EndFunction
	Function Set(int aiValue)
		JsonUtil.SetPathIntValue(FileName, ".AutoLoot.Value", aiValue)
		JsonUtil.Save(FileName)
	EndFunction
EndProperty

Actor Player

Event OnInit()
	Player = Game.GetPlayer()
    Methods = new string[4] 
    Methods[0] = "Собирать всё"
    Methods[1] = "Цена/Вес"
    Methods[2] = "Цена"
    Methods[3] = "Вес"
    MethodsStates = new string[4]
    MethodsStates[0] = ""
    MethodsStates[1] = "LootByWeightPrice"
    MethodsStates[2] = "LootByPrice"
    MethodsStates[3] = "LootByWeight"
    UpdateVariables()
EndEvent

Event OnPlayerLoadGame()
	if (LootByHotKey)
		UnregisterForAllKeys()
		RegisterForKey(HotKey)
	endif
	UpdateVariables()
EndEvent

Event OnKeyDown(int aiKeyCode)
	if (!Utility.IsInMenuMode())
    	CollectExplosion.Cast(Player)
	endif
EndEvent

int _Value
bool _DisallowOverWeight
bool _SaveBlessing
bool _LootMisc
bool _LootTrophies

Function UpdateVariables()
	_Value = Value
	_DisallowOverWeight = DisallowOverWeight
	_SaveBlessing = SaveBlessing
	_LootMisc = LootMisc
	_LootTrophies = LootTrophies
	GoToState(MethodsStates[MethodID])
EndFunction

bool Working = false

Function AddToStack(Actor akTarget)
	if StackActors.HasForm(akTarget)
		return
	endif
	if (Working)
		StackActors.AddForm(akTarget)
	else
		Working = true
		LootItemsFrom(akTarget)
		Working = false
	endif
EndFunction

Function LootItemsFrom(Actor akTarget)
	if akTarget.GetItemCount(Septim) > 0
		akTarget.RemoveItem(Septim, akTarget.GetItemCount(Septim), true, Player)
	endif

	int i = akTarget.GetNumItems()
	while i > 0
		i -= 1
		Form Item = akTarget.GetNthForm(i)
		int Count = akTarget.GetItemCount(Item)

		if IsMeetsCriteria(Item) && AllowTakeThis(Item, Count)
			akTarget.RemoveItem(Item, Count, true, Player)
		endif
	endwhile

	StackActors.RemoveAddedForm(akTarget)
	Actor NextActor = StackActors.GetAt(0) as Actor
	if (NextActor)
		LootItemsFrom(NextActor)
	endif
EndFunction

; ========================================================================================================================================

bool Function IsMeetsCriteria(Form akItem)
	return true
EndFunction

State LootByWeightPrice
	bool Function IsMeetsCriteria(Form akItem)
		return _Value <= GetTotalItemValue(akItem) / akItem.GetWeight() || akItem.HasKeyword(VendorItemKey) || (_LootMisc && IsLeatherOrIngredient(akItem))
	EndFunction
EndState

State LootByPrice
	bool Function IsMeetsCriteria(Form akItem)
		return _Value <= GetTotalItemValue(akItem) || akItem.HasKeyword(VendorItemKey) || (_LootMisc && IsLeatherOrIngredient(akItem))
	EndFunction
EndState

State LootByWeight
	bool Function IsMeetsCriteria(Form akItem)
		return _Value >= akItem.GetWeight() || akItem.HasKeyword(VendorItemKey) || (_LootMisc && IsLeatherOrIngredient(akItem))
	EndFunction
EndState

; ========================================================================================================================================

bool Function AllowTakeThis(Form akItem, int aiCount)
	if !akItem.IsPlayable() || (akItem.HasKeyword(VendorNoSale) && !_LootTrophies && !akItem.HasKeyword(Trophy)) || (_SaveBlessing && IsRuineBlessing(akItem)) || (_DisallowOverWeight && IsOverWeight(akItem, aiCount))
		return false
	endif
	return true
EndFunction

bool Function IsRuineBlessing(Form akItem)
	return akItem.HasKeyword(ArmorMaterialDaedric) || akItem.HasKeyword(WeapMaterialDaedric) || akItem.HasKeyword(DaedricArtifact)  
EndFunction

bool Function IsLeatherOrIngredient(Form akItem)
	return (akItem as Ingredient) || akItem.HasKeyword(LeatherToSell)
EndFunction

bool Function IsOverWeight(Form akItem, int aiCount)
	return Player.GetActorValue("InventoryWeight") + akItem.GetWeight() * aiCount >= Player.GetActorValue("CarryWeight") - 5
EndFunction

; ========================================================================================================================================