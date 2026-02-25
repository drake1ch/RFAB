Scriptname EquipUnarmedScript extends ReferenceAlias

Weapon Property Castet Auto
Weapon Property Unarmed Auto

Actor Player

Race WerewolfBeastRace
Race DLC1VampireBeastRace

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    if Player.GetRace() == DLC1VampireBeastRace
        return
    endif
    If akBaseObject as Weapon || akBaseObject as Spell || (akBaseObject as Armor).IsShield() || akBaseObject as Light || akBaseObject as Scroll
        If (akBaseObject as Weapon) != Castet && Player.GetEquippedWeapon(false) != Unarmed
            If Player.GetEquippedItemType(1) == 0 && Player.GetEquippedWeapon(false) != Castet
                Player.EquipItemEx(Castet, 1, false, true)
            EndIf
            If Player.GetEquippedItemType(0) == 0 && Player.GetEquippedWeapon(true) != Castet
                Player.EquipItemEx(Castet, 2, false, true)
            EndIf
        EndIf
    EndIf
EndEvent

Event OnInit()
    Player = Game.GetPlayer()
    WerewolfBeastRace = Game.GetForm(843140) as Race
    DLC1VampireBeastRace = Game.GetForm(33564730) as Race

    If Player.GetItemCount(Castet) < 2
        Player.AddItem(Castet, 2, true)
        If Player.GetEquippedItemType(1) == 0
            Player.EquipItemEx(Castet, 1, false, true)
        EndIf
        If Player.GetEquippedItemType(0) == 0
            Player.EquipItemEx(Castet, 2, false, true)
        EndIf
    EndIf
EndEvent