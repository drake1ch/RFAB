Scriptname RFAB_ObjectUnpacker extends ReferenceAlias  

Keyword Property PackedObject Auto

Actor Player
int kMisc = 32 

Event OnInit()
	Player = Game.GetPlayer()
	AddObjectsToFilter()
EndEvent

Event OnItemAdded(Form akItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if (!akItem.HasKeyword(PackedObject))
		return
	endif
	int count = aiItemCount
	while count
		count -=1
		Unpack(akItem)
	endwhile
EndEvent

Event OnObjectEquipped(Form akObject, ObjectReference akReference)
    if (akObject.HasKeyword(PackedObject))
		Unpack(akObject)
    endif
EndEvent

Function Unpack(Form akObject)
    Player.AddItem((akObject as RFAB_PackedObject).Items)
    Player.RemoveItem(akObject)
EndFunction

Function AddObjectsToFilter()
	Keyword[] objectKeyword = new Keyword[1]
	objectKeyword[0] = PackedObject

	Form[] PackedObjects = PO3_SKSEFunctions.GetAllForms(kMisc, objectKeyword)

	int count = PackedObjects.Length
	while count
		count -= 1
    	AddInventoryEventFilter(PackedObjects[count])
    endwhile
EndFunction