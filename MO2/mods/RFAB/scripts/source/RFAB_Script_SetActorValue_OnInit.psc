Scriptname RFAB_Script_SetActorValue_OnInit extends Actor

Event OnInit()
	Self.SetActorValue(ValueName, Value)
EndEvent

float Property Value Auto

string Property ValueName Auto

{Список всех значений: - https://ck.uesp.net/wiki/Actor_Value
    Attributes
        Health
        Magicka
        Stamina
    Skills
        OneHanded
        TwoHanded
        Marksman (Archery)
        Block
        Smithing
        HeavyArmor
        LightArmor
        Pickpocket
        Lockpicking
        Sneak
        Alchemy
        Speechcraft (Speech)
        Alteration
        Conjuration
        Destruction
        Illusion
        Restoration
        Enchanting
        <skillname>Mod
            SkillMod values are changed by perks and fortify skill enchantments. The automatic perk PerkSkillBoosts translates those into actual game effects.
        <skillname>PowerMod
            SkillPowerMod values are changed by fortify skill potions. The automatic perk AlchemySkillBoosts translates those into actual game effects. The effect is usually the same as increasing the skill level of the associated skill, except for the magic schools: Alteration = duration, Conjuration = duration, Destruction = magnitude, Illusion = magnitude, Restoration = magnitude.
    AI Data
        Aggression
        Confidence
        Energy
        Morality
        Mood
        Assistance
        WaitingForPlayer
    Other Statistics
        HealRate
        MagickaRate
        StaminaRate
        attackDamageMult (try 5 for good ex.)
        SpeedMult
        ShoutRecoveryMult (Handles the shout cooldowns)
        WeaponSpeedMult (values of 1 to 5 work well, 0 to reset)
        InventoryWeight
        CarryWeight
        CritChance
        MeleeDamage
        UnarmedDamage
        Mass
        VoicePoints
        VoiceRate
        DamageResist
        DiseaseResist
        PoisonResist
        FireResist
        ElectricResist
        FrostResist
        MagicResist
        Paralysis
        Invisibility
        NightEye
        DetectLifeRange
        WaterBreathing
        WaterWalking
        JumpingBonus
        AbsorbChance
        WardPower
        WardDeflection
        EquippedItemCharge
        EquippedStaffCharge
        ArmorPerks
        ShieldPerks
        BowSpeedBonus
        DragonSouls
    User-Defined Actor Values
        Variable01-Variable10
    Obsolete/Unused
        CombatHealthRegenMultMod
        CombatHealthRegenMultPowerMod
        PerceptionCondition
        EnduranceCondition
        LeftAttackCondition
        RightAttackCondition
        LeftMobilityCondition
        RightMobilityCondition
        BrainCondition
        IgnoreCrippledLimbs
        Fame
        Infamy
        FavorActive
        FavorPointsBonus
        FavorsPerDay
        FavorsPerDayTimer
        BypassVendorStolenCheck
        BypassVendorKeywordCheck
        LastBribedIntimidated
        LastFlattered}