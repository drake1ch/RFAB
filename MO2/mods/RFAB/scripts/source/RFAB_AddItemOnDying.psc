Scriptname RFAB_AddItemOnDying extends ObjectReference  

miscobject[] property items_to_add auto
int[] property items_to_add_amount auto

Event OnDying(Actor akKiller)
	GoToState("Done")
	int i = 0 
	while i< items_to_add.length
		AddItem(items_to_add[i], items_to_add_amount[i])
		i += 1
	endwhile
Endevent

State Done
	Event OnDying(Actor akKiller)
	Endevent
EndState