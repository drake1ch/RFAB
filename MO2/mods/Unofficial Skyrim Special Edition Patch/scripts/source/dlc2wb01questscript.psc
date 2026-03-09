Scriptname DLC2WB01QuestScript extends Quest conditional


ReferenceAlias Property Journal auto
ReferenceAlias Property Torkild auto
ReferenceAlias Property JournalChest auto
bool Property TorkildTransformed auto conditional


Function PrepTorkild(Actor torkildRef)
; 	Debug.TraceStack("DLC2WB01: Prepping Torkild alias.")
	Torkild.ForceRefTo(torkildRef)
EndFunction

Function ClearTorkild()
; 	Debug.TraceStack("DLC2WB01: Clearing Torkild alias.")
	Torkild.Clear()
	;UDBP 2.0.4 - It's possible for the letter to be pulled back to the chest even if the player is in possession of it.
	if( Game.GetPlayer().GetItemCount(Journal.GetReference()) < 1 )
		JournalChest.GetReference().AddItem(Journal.GetReference())
	EndIf
EndFunction
