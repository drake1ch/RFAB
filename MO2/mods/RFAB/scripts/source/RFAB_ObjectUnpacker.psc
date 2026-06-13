Scriptname RFAB_ObjectUnpacker extends ReferenceAlias  

MiscObject[] Property PackedObjects Auto
int[] Property Counts Auto
Form[] Property Items Auto

Actor Property PlayerRef Auto

Event OnInit()
	RegisterForMenu("BarterMenu")
EndEvent

Event OnMenuClose(string asMenuName)
	int i = PackedObjects.Length
	while (i > 0)
		i -= 1
		MiscObject kPack = PackedObjects[i]
		int iPackCount = PlayerRef.GetItemCount(kPack)

		if (iPackCount > 0)
			PlayerRef.AddItem(Items[i], Counts[i] * iPackCount)
			PlayerRef.RemoveItem(kPack, iPackCount, abSilent = true)
		endif
	endwhile
EndEvent