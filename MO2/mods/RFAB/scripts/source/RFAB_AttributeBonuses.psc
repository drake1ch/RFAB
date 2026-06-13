Scriptname RFAB_AttributeBonuses extends ReferenceAlias
{Buffs for white attributes}

int[] Property ThresholdHealth Auto
int[] Property ThresholdMagicka Auto
int[] Property ThresholdStamina Auto

int Property ThresholdHealthTop Auto
int Property ThresholdMagickaTop Auto
int Property ThresholdStaminaTop Auto

Spell[] Property _BonusHealth Auto
Spell[] Property _BonusMagicka Auto
Spell[] Property _BonusStamina Auto

Spell Property BonusHealthTop Auto
Spell Property BonusMagickaTop Auto
Spell Property BonusStaminaTop Auto

Actor Player

Event OnInit()
	Player = Game.GetPlayer()
	RegisterForMenu("StatsMenu")
EndEvent

Event OnPlayerLoadGame()
	Player = Game.GetPlayer()
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
	SendModEvent("RFAB_BaseAttributesChanged")
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
	float health = Player.GetBaseActorValue("Health")
	float magicka = Player.GetBaseActorValue("Magicka")
	float stamina = Player.GetBaseActorValue("Stamina")

	UpdateSpellSet(_BonusHealth, GetValueIndex(health, ThresholdHealth))
	UpdateSpellSet(_BonusMagicka, GetValueIndex(magicka, ThresholdMagicka))
	UpdateSpellSet(_BonusStamina, GetValueIndex(stamina, ThresholdStamina))

	UpdateTopSpell(BonusHealthTop, health, ThresholdHealthTop)
	UpdateTopSpell(BonusMagickaTop, magicka, ThresholdMagickaTop)
	UpdateTopSpell(BonusStaminaTop, stamina, ThresholdStaminaTop)
EndFunction

Function UpdateSpellSet(Spell[] akSpells, int aiIndex)
	if (aiIndex != -1 && !Player.HasSpell(akSpells[aiIndex]))
		RemoveSpells(akSpells)
		Player.AddSpell(akSpells[aiIndex])
	endif
EndFunction

Function UpdateTopSpell(Spell akSpell, float afValue, int aiThreshold)
	if (afValue >= aiThreshold && !Player.HasSpell(akSpell))
		Player.AddSpell(akSpell)
	elseif (afValue < aiThreshold && Player.HasSpell(akSpell))
		Player.RemoveSpell(akSpell)
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
