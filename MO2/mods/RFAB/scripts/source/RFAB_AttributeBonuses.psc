Scriptname RFAB_AttributeBonuses extends ReferenceAlias
{Бафы за белые характеристики}

int[] Property ThresholdHealth Auto
int[] Property ThresholdMagicka Auto
int[] Property ThresholdStamina Auto

Spell[] Property _BonusHealth Auto
Spell[] Property _BonusMagicka Auto
Spell[] Property _BonusStamina Auto

Spell[] Property BonusHealthMagicka Auto
Spell[] Property BonusHealthStamina Auto

Actor Player

Event OnInit()
	Player = Game.GetPlayer()
	RegisterForMenu("StatsMenu")
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("StatsMenu")
EndEvent

Event OnMenuClose(String asMenuName)
	UpdateAttributeBonuses()
EndEvent

Event OnUpdate()
	UpdateAttributeBonuses()
EndEvent

Function ModBaseActorValue(string asActorValue, float afValue)
	GoToState("Busy")
	Player.SetActorValue(asActorValue, Player.GetBaseActorValue(asActorValue) + afValue)
	GoToState("")
	RegisterForSingleUpdate(0.5)
EndFunction

State Busy
	Function ModBaseActorValue(string asActorValue, float afValue)
		while (GetState() == "Busy")
			Utility.Wait(0.5)
		endwhile
		ModBaseActorValue(asActorValue, afValue)
	EndFunction
EndState

Function UpdateAttributeBonuses()
	int healthIndex = GetValueIndex(Player.GetBaseActorValue("Health"), ThresholdHealth)
	int magickaIndex = GetValueIndex(Player.GetBaseActorValue("Magicka"), ThresholdMagicka)
	int staminaIndex = GetValueIndex(Player.GetBaseActorValue("Stamina"), ThresholdStamina)

	if (healthIndex != -1 && !Player.HasSpell(_BonusHealth[healthIndex]))
		RemoveSpells(_BonusHealth)
		Player.AddSpell(_BonusHealth[healthIndex])
	endif

	if (magickaIndex != -1 && !Player.HasSpell(_BonusMagicka[magickaIndex]))
		RemoveSpells(_BonusMagicka)
		Player.AddSpell(_BonusMagicka[magickaIndex])
	endif

	if (staminaIndex != -1 && !Player.HasSpell(_BonusStamina[staminaIndex]))
		RemoveSpells(_BonusStamina)
		Player.AddSpell(_BonusStamina[staminaIndex])
	endif

	if (healthIndex != -1 && magickaIndex != -1 && !Player.HasSpell(BonusHealthMagicka[Min(healthIndex, magickaIndex)]))
		RemoveSpells(BonusHealthMagicka)
		Player.AddSpell(BonusHealthMagicka[Min(healthIndex, magickaIndex)])
	endif

	if (healthIndex != -1 && staminaIndex != -1 && !Player.HasSpell(BonusHealthStamina[Min(healthIndex, staminaIndex)]))
		RemoveSpells(BonusHealthStamina)
		Player.AddSpell(BonusHealthStamina[Min(healthIndex, staminaIndex)])
	endif
EndFunction

int Function GetValueIndex(float afValue, int[] aiThresholds)
	int i = aiThresholds.Length
	while (i > 0)
		i -= 1
		if (afValue >= aiThresholds[i])
			return i
		endif
	endWhile
	return -1
EndFunction

Function RemoveSpells(Spell[] akSpells)
	int i = akSpells.Length
	while (i > 0)
		i -= 1
		Player.RemoveSpell(akSpells[i])
	endWhile
EndFunction

int Function Min(int a, int b)
	if (a < b)
		return a
	endif
	return b
EndFunction