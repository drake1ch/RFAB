ScriptName RemoveAddWeapon Extends activemagiceffect

Weapon Property WeapRemove Auto
Weapon Property WeapAdd Auto
Scroll Property MonarhScroll Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
  if akCaster.GetItemCount(WeapRemove) >= 1
    akCaster.RemoveItem(WeapRemove, 1, true)
    akCaster.AddItem(WeapAdd, 1, true)
  Elseif akCaster.GetItemCount(WeapRemove) < 1
    akCaster.AddItem(MonarhScroll, 1, true)
    akCaster.EquipItem(MonarhScroll, false, true)
  EndIf
EndEvent
