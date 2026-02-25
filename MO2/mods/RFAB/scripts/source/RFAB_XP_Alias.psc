Scriptname RFAB_XP_Alias extends ReferenceAlias  

import PO3_Events_Alias
import PO3_SKSEFunctions
import RFAB_PapyrusFunctions
import PapyrusIniManipulator

RFAB_Menu Property Menu Auto
RFAB_XP_Handler Property XPHandler Auto

Keyword Property NoXPKeyword Auto
Keyword Property IllusionFrenzy Auto

Faction Property PlayerFaction Auto
Actor Property Player Auto

FormList Property XPBooks Auto
FormList Property XPBooksReaded Auto

Perk Property Unlock Auto

int Property StartPerksCount Auto

Message Property CapLevel Auto
Message Property CapLevelImperial Auto

Race[] Property ImperialRaces Auto

bool IsBizarreActive = false

Event OnInit()
	Game.SetPerkPoints(StartPerksCount)
	Player.AddPerk(Unlock)
	IsBizarreActive = IsPluginFound("RFAB_BizarreAdventure.esp")
	Register()
EndEvent

Event OnPlayerLoadGame()
	Register()
	Game.SetGameSettingFloat("fXPLevelUpMult", 0.0) ; Отключаем множитель уровня
	Game.SetGameSettingFloat("fXPLevelUpBase", XPHandler.Experience[Player.GetLevel() - 1])
EndEvent

Event OnKeyDown(int aiKeyCode)
	if !Utility.IsInMenuMode() && !UI.IsMenuOpen("CustomMenu")
		Menu.Open()
	endif	
EndEvent

Event OnLevelIncrease(int aiLevel)
	Game.SetGameSettingFloat("fXPLevelUpBase", XPHandler.Experience[aiLevel - 1])
	XPHandler.ShowLevelUp = true
	if (aiLevel == 51)
		RegisterForMenu("StatsMenu")
	endif
	; Максимальный уровень находится в RFAB.dll
EndEvent

Event OnMenuClose(string asMenuName)
	if (ImperialRaces.Find(Player.GetRace()) != -1)
		CapLevelImperial.Show()
	else
		CapLevel.Show()
	endif
	UnregisterForMenu("StatsMenu")
EndEvent

Event OnActorKilled(Actor akVictim, Actor akKiller)
	if (IsFrenzyEffect(akVictim, akKiller) || akKiller.IsInFaction(PlayerFaction)) && !akVictim.HasKeyword(NoXPKeyword) && !IsSummonedActor(akVictim) && akVictim.GetActorValue("Infamy") != -1
		XPHandler.OnKill(akVictim)
		akVictim.ForceActorValue("Infamy", -1)
	endIf
EndEvent

bool Function IsFrenzyEffect(Actor akVictim, Actor akKiller)
	return akVictim.HasMagicEffectWithKeyword(IllusionFrenzy) || akKiller.HasMagicEffectWithKeyword(IllusionFrenzy)
EndFunction

Event OnBookRead(Book akBook)
	if XPBooks.HasForm(akBook) && !XPBooksReaded.HasForm(akBook)
		XPHandler.OnBookRead()
		XPBooksReaded.AddForm(akBook)
	endif
EndEvent

Function Register()
	if (!IsBizarreActive)
		RegisterForActorKilled(self)
	endif
	RegisterForLevelIncrease(self)
	RegisterForBookRead(self)
	UnregisterForAllKeys()
	RegisterForKey(Menu.Hotkey)
EndFunction

