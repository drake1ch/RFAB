Scriptname RFAB_Unlock extends Quest

Perk Property PerkUnlockNovice Auto
Perk Property PerkUnlockAdept Auto
Perk Property PerkUnlockMaster Auto

Perk Property PerkAlterationApprentice Auto
Perk Property PerkAlterationAdept Auto

RFAB_XP_Handler Property XPHandler Auto
UILIB_1 HUD

MiscObject Property SKey Auto
MiscObject Property Lockpick Auto

Sound Property KeySound Auto
Sound Property SKeySound Auto
Sound Property LockpickSound Auto

EffectShader Property UnlockShader Auto

int[] Property ExpForLock Auto
int[] Property LockpickCount Auto
string[] Property LockNames Auto

Race[] Property BeastRaces Auto

int Property LOCK_NOVICE = 1 AutoReadOnly
int Property LOCK_APPRENTICE = 25 AutoReadOnly
int Property LOCK_ADEPT = 50 AutoReadOnly
int Property LOCK_EXPERT = 75 AutoReadOnly

int Property ICON_KEY = 63 AutoReadOnly
int Property ICON_LOCKPICK = 76 AutoReadOnly
int Property ICON_ALTERATION = 98 AutoReadOnly
int Property ICON_SKEY = 19 AutoReadOnly

string Property PATH_ICONS = "skyui/icons_item_psychosteve.swf" AutoReadOnly
string Property PATH_ARTIFACTS = "icons/artefacts.swf" AutoReadOnly

Event OnInit()
	HUD = (self as Form) as UILIB_1
EndEvent

Function TryLockpickUnlock(Actor akActor, ObjectReference akObject)
	Key kKey = akObject.GetKey()

	if (akActor.GetItemCount(kKey) > 0)
		Open(akActor, akObject)
		KeySound.Play(akActor)

		if (IsBeast(akActor))
			ShowKeyMessage("У " + akActor.GetDisplayName() + " есть " + GetKeyName(kKey) + "!", true)
		else
			ShowKeyMessage("У меня есть " + GetKeyName(kKey) + "!", true)
		endif
	elseif (akActor.GetItemCount(SKey) > 0)
		Open(akActor, akObject)
		SKeySound.Play(akActor)

		if (IsBeast(akActor))
			ShowSKeyMessage("У " + akActor.GetDisplayName() + " есть Скелетный Ключ!")
		else
			ShowSKeyMessage("У меня есть Скелетный Ключ!", true)
		endif
	else
		if (IsCanLockpickUnlock(akActor, akObject))
			LockPickUnlock(akActor, akObject)
		else
			if (IsBeast(akActor))
				ShowLockpickMessage(akActor.GetDisplayName() + " не может взломать этот замок.")
			else
				ShowLockpickMessage("Я не могу взломать этот замок.")
			endif
		endif
	endif
EndFunction

Function TryMagicUnlock(Actor akActor, ObjectReference akObject, bool abDualCast, bool abMasterScroll)
	if (IsCanMagicUnlock(akActor, akObject, abDualCast, abMasterScroll))
		MagicUnlock(akActor, akObject)
	else
		if (IsBeast(akActor))
			ShowMagicMessage(akActor.GetDisplayName() + " не может взломать этот замок.")
		else
			ShowMagicMessage("Я не могу взломать этот замок.")
		endif
	endif
EndFunction

Function LockPickUnlock(Actor akActor, ObjectReference akObject)
	int iLockLevel = akObject.GetLockLevel()
	int iLockpickCount = GetLockpickCount(iLockLevel)

	if (akActor.GetItemCount(Lockpick) >= iLockpickCount)
		Open(akActor, akObject)
		LockpickSound.Play(akActor)
		akActor.RemoveItem(Lockpick, iLockpickCount, true)

		if (IsXPObject(akObject))
			LockpickUnlockXP(iLockLevel)
		else
			if (IsBeast(akActor))
				if (akActor.GetActorBase().GetSex() == 0)
					ShowLockpickMessage(akActor.GetDisplayName() + " смог взломать замок!", true)
				else
					ShowLockpickMessage(akActor.GetDisplayName() + " смогла взломать замок!", true)
				endif
			else
				ShowLockpickMessage("Мне удалось взломать замок!", true)
			endif
		endif
	else
		string sPrefix = "Мне"
		if (IsBeast(akActor))
			sPrefix = akActor.GetDisplayName()
		endif
		if (iLockpickCount == 1)
			ShowLockpickMessage(sPrefix + " нужна 1 отмычка.")
		elseif (iLockpickCount >= 2 && iLockpickCount <= 4)
			ShowLockpickMessage(sPrefix + " нужно " + iLockpickCount + " отмычки.")
		else
			ShowLockpickMessage(sPrefix + " нужно " + iLockpickCount + " отмычек.")
		endif
	endif
EndFunction

Function MagicUnlock(Actor akActor, ObjectReference akObject)
	Open(akActor, akObject)
	UnlockShader.Play(akObject, 2.0)

	if (IsXPObject(akObject))
		MagicUnlockXP(akObject.GetLockLevel())
	else
		if (IsBeast(akActor))
			if (akActor.GetActorBase().GetSex() == 0)
				ShowMagicMessage(akActor.GetDisplayName() + " смог взломать замок!", true)
			else
				ShowMagicMessage(akActor.GetDisplayName() + " смогла взломать замок!", true)
			endif
		else
			ShowMagicMessage("Мне удалось взломать замок!", true)
		endif
	endif
EndFunction

Function LockpickUnlockXP(int aiLockLevel)
	GiveUnlockXP(aiLockLevel, PATH_ICONS, ICON_LOCKPICK)
EndFunction

Function MagicUnlockXP(int aiLockLevel)
	GiveUnlockXP(aiLockLevel, PATH_ICONS, ICON_ALTERATION)
EndFunction

Function GiveUnlockXP(int aiLockLevel, string asIconPath, int aiIconID)
	int iStartXP = GetLockXP(aiLockLevel)
	int iGainedXP = XPHandler.CalculateXP(iStartXP)
	XPHandler.ModXP(iGainedXP)
	HUD.ShowNotificationIcon("Замок взломан: " + iGainedXP + " XP", asIconPath, aiIconID, XPHandler.GetXPColor())
EndFunction

bool Function IsCanLockpickUnlock(Actor akActor, ObjectReference akObject)
	int iLockLevel = akObject.GetLockLevel()
	if (iLockLevel <= LOCK_NOVICE)
		return akActor.HasPerk(PerkUnlockNovice)
	elseif (iLockLevel <= LOCK_APPRENTICE)
		return akActor.HasPerk(PerkUnlockNovice) && akActor.GetBaseActorValue("Lockpicking") >= 25
	elseif (iLockLevel <= LOCK_ADEPT)
		return akActor.HasPerk(PerkUnlockAdept)
	elseif (iLockLevel <= LOCK_EXPERT)
		return akActor.HasPerk(PerkUnlockAdept) && akActor.GetBaseActorValue("Lockpicking") >= 75
	else
		return akActor.HasPerk(PerkUnlockMaster)
	endif
EndFunction

bool Function IsCanMagicUnlock(Actor akActor, ObjectReference akObject, bool abDualCast, bool abMasterScroll)
	if (abMasterScroll)
		return true
	endif

	int iLockLevel = akObject.GetLockLevel()
	if (iLockLevel <= LOCK_NOVICE)
		return true
	elseif (iLockLevel <= LOCK_APPRENTICE)
		return akActor.HasPerk(PerkAlterationApprentice)
	elseif (iLockLevel <= LOCK_ADEPT)
		return akActor.HasPerk(PerkAlterationAdept) || (akActor.HasPerk(PerkAlterationApprentice) && abDualCast)
	elseif (iLockLevel <= LOCK_EXPERT)
		return akActor.HasPerk(PerkAlterationAdept) && abDualCast
	else
		return false
	endif
EndFunction

int Function GetLockIndex(int aiLockLevel)
	if (aiLockLevel <= LOCK_NOVICE)
		return 0
	elseif (aiLockLevel <= LOCK_APPRENTICE)
		return 1
	elseif (aiLockLevel <= LOCK_ADEPT)
		return 2
	elseif (aiLockLevel <= LOCK_EXPERT)
		return 3
	else
		return 4
	endif
EndFunction

Function Open(Actor akActor, ObjectReference akObject)
	akObject.lock(False)
	akObject.Activate(akActor)
EndFunction

bool Function IsBeast(Actor akActor)
	return BeastRaces.Find(akActor.GetRace()) != -1
EndFunction

string Function GetKeyName(Key akKey)
	string KeyName = akKey.GetName()
	string FirstWord = StringUtil.Split(KeyName, " ")[0]
	return RFAB_PapyrusFunctions.ToLowerCase(FirstWord) + StringUtil.Substring(KeyName, StringUtil.GetLength(FirstWord))
EndFunction

bool Function IsXPObject(ObjectReference akObject)
	string sObjectName = akObject.GetDisplayName()
	int i = 0
	while (i < LockNames.Length)
		if (StringUtil.Find(sObjectName, LockNames[i]) != -1)
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction

int Function GetLockpickCount(int aiLockLevel)
	return LockpickCount[GetLockIndex(aiLockLevel)]
EndFunction

int Function GetLockXP(int aiLockLevel)
	return ExpForLock[GetLockIndex(aiLockLevel)]
EndFunction

; UI

Function ShowKeyMessage(string asMessage, bool abImportant = false)
	ShowMessage(asMessage, abImportant, PATH_ICONS, ICON_KEY)
EndFunction

Function ShowSKeyMessage(string asMessage, bool abImportant = false)
	ShowMessage(asMessage, abImportant, PATH_ARTIFACTS, ICON_SKEY)
EndFunction

Function ShowLockpickMessage(string asMessage, bool abImportant = false)
	ShowMessage(asMessage, abImportant, PATH_ICONS, ICON_LOCKPICK)
EndFunction

Function ShowMagicMessage(string asMessage, bool abImportant = false)
	ShowMessage(asMessage, abImportant, PATH_ICONS, ICON_ALTERATION)
EndFunction

Function ShowMessage(string asMessage, bool abImportant = false, string asIconPath, int aiIconID)
	if (GetState() != "Waiting" || abImportant)
		GoToState("Waiting")
		HUD.ShowNotificationIcon(asMessage, asIconPath, aiIconID)
		Utility.Wait(2.0)
		GoToState("")
	endif
EndFunction

;/
Function SendSteal(ObjectReference akObject, Actor akActor)
	if akObject.GetGoldValue() <= 0
		akActor.GetParentCell().GetFactionOwner().SendAssaultAlarm()
		akObject.GetFactionOwner().SendAssaultAlarm()
	else
		akObject.SendStealAlarm(akActor)
	endif
EndFunction
/;