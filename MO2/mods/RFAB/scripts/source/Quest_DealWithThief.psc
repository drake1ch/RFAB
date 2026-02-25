;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname Quest_DealWithThief Extends Quest Hidden

;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerItemsContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerItemsContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_Note.ForceRefTo(Game.GetPlayer().PlaceAtMe(NoteBaseObject))
WICourierScript vWICourierScript = pWICourier as WICourierScript 
vWICourierScript.addAliasToContainer(Alias_Note)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted (10,1)
game.getPlayer().removeItem(Gold001,1000)

game.getPlayer().removeItem(Alias_Note.GetReference().GetBaseObject(), Game.GetPlayer().GetItemCount(Alias_Note.GetReference().GetBaseObject()))

PO3_SKSEFunctions.ClearReadFlag(Alias_Note.GetReference().GetBaseObject() as Book)

Alias_PlayerItemsContainer.GetReference().RemoveAllItems(Game.GetPlayer() as ObjectReference)
CompleteAllObjectives()

utility.waitGameTime(1)
Alias_Thief.GetActorRef().Disable()

Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10)
utility.waitGameTime(1) ; чтобы не появился из воздуха 
Alias_Thief.GetActorRef().Enable()

ContainerWeight = Alias_PlayerItemsContainer.GetReference().GetTotalItemWeight()
;Debug.Notification(ContainerWeight)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted (10,1)
game.getPlayer().removeItem(Gold001,2000)

Game.GetPlayer().RemoveItem(Alias_Note.GetReference().GetBaseObject(), Game.GetPlayer().GetItemCount(Alias_Note.GetReference().GetBaseObject()))

PO3_SKSEFunctions.ClearReadFlag(Alias_Note.GetReference().GetBaseObject() as Book)

Alias_PlayerItemsContainer.GetReference().RemoveAllItems(Game.GetPlayer() as ObjectReference)
CompleteAllObjectives()

utility.waitGameTime(1)
Alias_Thief.GetActorRef().Disable()

Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted (10,1)
game.getPlayer().removeItem(Gold001,3000)

Game.GetPlayer().RemoveItem(Alias_Note.GetReference().GetBaseObject(), Game.GetPlayer().GetItemCount(Alias_Note.GetReference().GetBaseObject()))

PO3_SKSEFunctions.ClearReadFlag(Alias_Note.GetReference().GetBaseObject() as Book)

Alias_PlayerItemsContainer.GetReference().RemoveAllItems(Game.GetPlayer() as ObjectReference)
CompleteAllObjectives()

utility.waitGameTime(1)
Alias_Thief.GetActorRef().Disable()

Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pWIcourier  Auto  

MiscObject Property Gold001  Auto  

Container Property PlayerItemsConteiner  Auto  

Quest Property ThisQuest Auto  

Book Property NoteBaseObject  Auto  

Float Property ContainerWeight Auto Conditional
