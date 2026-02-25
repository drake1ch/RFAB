Scriptname WB_PopulateLists_Script extends Quest  

; -----

Formlist Property WB_Quest_Populate_OriginFormlist_List_Books Auto
{An ordered formlist containing formlists of all Books to add}
Formlist Property WB_Quest_Populate_OriginFormlist_List_Scrolls Auto
{An ordered formlist containing formlists of all Scrolls to add}
Formlist Property WB_Quest_Populate_OriginFormlist_List_Staves Auto
{An ordered formlist containing formlists of all Staves to add}

Float Property WB_InitialDelay Auto

Formlist Property WB_Quest_Populate_DestinationLitem_List_Books Auto
{An ordered formlist containing all Book destination lists}
Formlist Property WB_Quest_Populate_DestinationLitem_List_Scrolls Auto
{An ordered formlist containing all Scroll destination lists}
Formlist Property WB_Quest_Populate_DestinationLitem_List_Staves Auto
{An ordered formlist containing all Staff destination lists}

Message Property WB_PopulateLists_Done Auto

; -----

LeveledItem CurrentDestinationLitem
Formlist CurrentOriginFormlist
Book CurrentOriginBookInCurrentOriginFormlist
Scroll CurrentOriginScrollInCurrentOriginFormlist
Weapon CurrentOriginStaffInCurrentOriginFormlist

; -----

Event OnInit()

	Debug.Trace("APOC 7 DEBUG: Initialising Populate Lists script...")
	Utility.Wait(WB_InitialDelay)

	Int i
	Int j

	Debug.Trace("APOC 7 DEBUG: Populating leveled lists... Books...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Books.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Books.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Books.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		While j > 0
			j -= 1
			CurrentOriginBookInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Book
			CurrentDestinationLitem.AddForm(CurrentOriginBookInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOC 7 DEBUG: Populating leveled lists... Scrolls...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Scrolls.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Scrolls.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Scrolls.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		While j > 0
			j -= 1
			CurrentOriginScrollInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Scroll
			CurrentDestinationLitem.AddForm(CurrentOriginScrollInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOC 7 DEBUG: Populating leveled lists... Staves...",1)
	i = WB_Quest_Populate_OriginFormlist_List_Staves.GetSize()
	While i > 0
		i -= 1
		CurrentDestinationLitem = WB_Quest_Populate_DestinationLitem_List_Staves.GetAt(i) as LeveledItem
		CurrentOriginFormlist = WB_Quest_Populate_OriginFormlist_List_Staves.GetAt(i) as FormList
		j = CurrentOriginFormlist.GetSize()
		While j > 0
			j -= 1
			CurrentOriginStaffInCurrentOriginFormlist = CurrentOriginFormlist.GetAt(j) as Weapon
			CurrentDestinationLitem.AddForm(CurrentOriginStaffInCurrentOriginFormlist,1,1)
		EndWhile
	EndWhile

	Debug.Trace("APOCNEW DEBUG: Populating leveled lists...Done",1)
	WB_PopulateLists_Done.Show()
	Stop()

EndEvent

; -----