Scriptname DeepStorageCast extends ActiveMagicEffect

perk[] property MasteryPerks auto
float[] property MasteryPerksMass auto
actor property Storage auto
ObjectReference property ContainerStorage auto
actor playerref

Event OnEffectStart(Actor akTarget, Actor akCaster)
  playerref = Game.GetPlayer()
  if akCaster == playerref
    Storage.SetActorValue("CarryWeight", GetStorageWeight())
    ContainerStorage.RemoveAllItems(Storage, true, true)
    Storage.OpenInventory(true)
		utility.wait(0.5)
		While (Ui.isMenuOpen("GiftMenu") || Ui.isMenuOpen("InventoryMenu") || Ui.isMenuOpen("ContainerMenu") || utility.IsInMenuMode())	
		  utility.wait(0.1)
		EndWhile
    Storage.RemoveAllItems(ContainerStorage, true, true)
  endif
EndEvent

float Function GetStorageWeight()
  int i = MasteryPerks.Length
  float Weight = MasteryPerksMass[0]
  While (i)
    i-=1
    If (playerref.hasperk(MasteryPerks[i]))
      Weight += MasteryPerksMass[i+1]
    EndIf
  EndWhile
  return Weight
endfunction