Scriptname DestructionAmmoQuestScript extends Quest

Function AddDestructionAmmo(Actor akCaster, Ammo[] NeedAmmo, Ammo[] CreateAmmo, Message msg)
    Int choice = msg.Show()
    While choice < 2
        String sInput = ((Self as Form) as UILIB_1).ShowTextInput("Сколько снарядов создать?","")
        if sInput != ""
            Int iInput = sInput as Int
            If akCaster.GetItemCount(NeedAmmo[choice]) >= iInput
                akCaster.AddItem(CreateAmmo[choice], iInput, False)
                akCaster.RemoveItem(NeedAmmo[choice], iInput, False)
            Else
                akCaster.AddItem(CreateAmmo[choice], akCaster.GetItemCount(NeedAmmo[choice]), False)
                akCaster.RemoveItem(NeedAmmo[choice], akCaster.GetItemCount(NeedAmmo[choice]), False)
            EndIf
        EndIf
        choice = 2
    EndWhile
EndFunction

Function AddDestructionPotion(Actor akCaster, Potion potionToAdd, Potion potionToRemove)

    String sInput = ((Self as Form) as UILIB_1).ShowTextInput("Сколько бутылок создать?","")
    If sInput != ""
        Int iInput = sInput as Int
        If akCaster.GetItemCount(potionToRemove) >= iInput
            akCaster.AddItem(potionToAdd, iInput, False)
            akCaster.RemoveItem(potionToRemove, iInput, False)
        Else
            akCaster.AddItem(potionToAdd, akCaster.GetItemCount(potionToRemove), False)
            akCaster.RemoveItem(potionToRemove, akCaster.GetItemCount(potionToRemove), False)
        EndIf
    EndIf
EndFunction