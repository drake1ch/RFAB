Scriptname RFAB_MassEffect extends REQ_PlayerAlias

Perk Property TwoHandedPerk Auto
float Property TwoHandedEfficiency Auto

Perk Property OneHandedPerk Auto
float Property OneHandedEfficiency Auto

Perk Property RangedPerk Auto
float Property RangedEfficiency Auto

Perk Property LightPerk Auto
float Property LightEfficiency Auto

Perk Property HeavyPerk Auto
float Property HeavyEfficiency Auto

Perk Property ShieldPerk Auto
float Property ShieldEfficiency Auto

GlobalVariable Property PenaltySpeedMultUI Auto
GlobalVariable Property PenaltyMovementNoiseUI Auto

float[] _ratiosArmor
;	0 = Light
;	1 = Heavy
;	2 = Cloth or None
;	3 = Shield Light
;	4 = Shield Heavy
;	5 = Shield Cloth

float[] _ratiosWeapon
;	0 = Fists
;	1 = Swords
;	2 = Daggers
;	3 = War Axes
;	4 = Maces
;	5 = Greatswords
;	6 = Battleaxes AND Warhammers
;	7 = Bows
;	8 = Staff
;	9 = Crossbows

float _penalty

Event OnAliasInit()
	_ratiosArmor = new float[6]
	_ratiosWeapon = new float[10]
	UpdateRatios()
	RegisterForMenu("StatsMenu")
	RegisterForMenu("CustomMenu")
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("StatsMenu")
	RegisterForMenu("CustomMenu")
EndEvent

Event OnMenuClose(string asMenuName)
	UpdateRatios()
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnObjectEquipped(Form akObject, ObjectReference akReference)
	if (akObject as Armor || akObject as Weapon)
		RegisterForSingleUpdate(0.1)
	endif
EndEvent

Event OnObjectUnEquipped(Form akObject, ObjectReference akReference)
	if (akObject as Armor || akObject as Weapon)
		RegisterForSingleUpdate(0.1)
	endif
EndEvent

Event OnUpdate()
	float fPenalty = 0.0

	Form[] kEquipment = PO3_SKSEFunctions.AddAllEquippedItemsToArray(Player)
	int i = kEquipment.Length
	while (i > 0)
		i -= 1
		Form kItem = kEquipment[i]
		Armor kArmor = kItem as Armor
		Weapon kWeapon = kItem as Weapon
		float fItemMass = kItem.GetWeight() / 100.0

		if (kArmor)
			int iType = kArmor.GetWeightClass()
			if (kArmor.IsShield())
				iType += 3
			endif
			fPenalty += _ratiosArmor[iType] * fItemMass
		elseif (kWeapon)
			int iType = kWeapon.GetWeaponType()
			fPenalty += _ratiosWeapon[iType] * fItemMass
		endif
	endwhile

	EvaluatePenalty(fPenalty)
EndEvent

Function EvaluatePenalty(float afPenalty)
	float fPenaltyDifference = afPenalty - _penalty

	Player.ModActorValue("SpeedMult", -50.0 * fPenaltyDifference)
	Player.ModActorValue("MovementNoiseMult", fPenaltyDifference)

	PenaltySpeedMultUI.Value = Math.Ceiling(afPenalty * 50.0)
	PenaltyMovementNoiseUI.Value = Math.Ceiling(afPenalty * 100.0)

	_penalty = afPenalty
EndFunction

Function UpdateRatios()
	float fLightRatio = CalculateRatio(LightPerk, LightEfficiency, "LightArmor")
	_ratiosArmor[0] = fLightRatio
	_ratiosArmor[2] = fLightRatio

	float fHeavyRatio = CalculateRatio(HeavyPerk, HeavyEfficiency, "HeavyArmor")
	_ratiosArmor[1] = fHeavyRatio

	float fBlockRatio = CalculateRatio(ShieldPerk, ShieldEfficiency, "Block")
	_ratiosArmor[3] = fBlockRatio
	_ratiosArmor[4] = fBlockRatio
	_ratiosArmor[5] = fBlockRatio

	float fOneHandedRatio = CalculateRatio(OneHandedPerk, OneHandedEfficiency, "OneHanded")
	_ratiosWeapon[1] = fOneHandedRatio
	_ratiosWeapon[2] = fOneHandedRatio
	_ratiosWeapon[3] = fOneHandedRatio
	_ratiosWeapon[4] = fOneHandedRatio
	_ratiosWeapon[8] = fOneHandedRatio

	float fTwoHandedRatio = CalculateRatio(TwoHandedPerk, TwoHandedEfficiency, "TwoHanded")
	_ratiosWeapon[5] = fTwoHandedRatio
	_ratiosWeapon[6] = fTwoHandedRatio

	float fArcheryRatio = CalculateRatio(RangedPerk, RangedEfficiency, "Marksman")
	_ratiosWeapon[7] = fArcheryRatio
	_ratiosWeapon[9] = fArcheryRatio
	_ratiosWeapon[0] = 0.0
EndFunction

float Function CalculateRatio(Perk akPerk, float afSkillEffiency, string asSkillName)
	if (!Player.HasPerk(akPerk))
		return 1.0
	endif

	float fResult = 1.0 - Player.GetActorValue(asSkillName) * afSkillEffiency / 100.0

	return Max(0.0, fResult)
EndFunction

float Function Max(float afValue1, float afValue2)
	if (afValue1 > afValue2)
		return afValue1
	endif
	return afValue2
EndFunction