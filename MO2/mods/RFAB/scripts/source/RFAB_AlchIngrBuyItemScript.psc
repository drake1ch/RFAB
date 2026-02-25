scriptName RFAB_AlchIngrBuyItemScript extends form

Form[] Property ItemToAdd Auto
Int[] Property AddCount Auto

Function AddIngrs(int count = 1)
    int i = ItemToAdd.Length
    While (i)
        i-=1
        Game.GetPlayer().AddItem(ItemToAdd[i], AddCount[i] * count, true)
    EndWhile
EndFunction