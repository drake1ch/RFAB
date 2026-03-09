Scriptname USKPWRPlayerAliasScript extends ReferenceAlias  
;by taleden - 2013-10-28
;by taleden - rev 4 (2013-11-01)

Bool bDropActive = False
Form kDropForm = None
ObjectReference kDropRef = None


Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
EndEvent


;/~~~
Event OnPlayerLoadGame() ;TODO
	Actor player = Game.GetPlayer()
;	player.AddItem(Game.GetForm(0xF), 50000) ; gold
	player.AddItem(Game.GetForm(0x09fd50)) ; Red Eagle's Fury
	player.AddItem(Game.GetForm(0x10c6fb), 5); Silver Greatsword
	player.AddItem(Game.GetForm(0x10aa19), 5); Silver Sword
	player.AddItem(Game.GetForm(0x0956b5)) ; Wuuthrad
;	player.AddItem(Game.GetForm(0x10f601) As ObjectReference) ; Borvir's Dagger (JourneymansNookExterior01)
;	player.AddItem(Game.GetForm(0x0f3248) As ObjectReference) ; Bow of the Hunt (ClearspringTarn01)
	player.AddItem(Game.GetForm(0x08adfd) As ObjectReference) ; Ceremonial Axe (Volunruud01)
;	player.AddItem(Game.GetForm(0x031160) As ObjectReference) ; Dwarven Battleaxe (MarkarthWizardsQuarters01)
;	player.AddItem(Game.GetForm(0x0c19fe) As ObjectReference) ; Dwarven Sword of Arcing (MarkarthWizardsQuarters01)
	player.AddItem(Game.GetForm(0x04a39d) As ObjectReference) ; Ebony Blade (WhiterunDragonsreach)
	              (Game.GetForm(0x094a2c) As ObjectReference).Enable()
	player.AddItem(Game.GetForm(0x094a2c) As ObjectReference) ; Ghostblade (Ansilvund02)
	              (Game.GetForm(0x10e94c) As ObjectReference).Enable()
	player.AddItem(Game.GetForm(0x10e94c) As ObjectReference) ; Keening (WinterholdCollegeHallofCountenance)
;	player.AddItem(Game.GetForm(0x10f904) As ObjectReference) ; Rundi's Dagger (POINorthernCoast16)
	              (Game.GetForm(0x02e526) As ObjectReference).Enable()
	player.AddItem(Game.GetForm(0x02e526) As ObjectReference) ; Volendrung (LargasburExterior04)
EndEvent
;/~~~/;


State active
	
	Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
;		Debug.Trace(Self + ".OnItemRemoved("+akBaseItem+", "+aiItemCount+", "+akItemReference+", "+akDestContainer+")")
		If bDropActive && (akBaseItem == kDropForm) && (akDestContainer == None)
			GotoState("")
			bDropActive = False
			kDropRef = akItemReference
		EndIf
	EndEvent ; OnItemRemoved()
	
EndState ; active


ObjectReference Function DropPlayerItem(Form akItem, Int aiRetries = 100)
	Actor player = GetActorReference()
	player.UnequipItem(akItem, False, True)
	bDropActive = True
	kDropForm = akItem
	kDropRef = None
	GotoState("active")
	player.DropObject(akItem, 1)
	Int try = aiRetries
	While (try > 0) && bDropActive
		try -= 1
		Utility.Wait(0.01) ; one frame draw, unless fps>100
	EndWhile
	GotoState("")
	ObjectReference ref = kDropRef
	bDropActive = False
	kDropForm = None
	kDropRef = None
;	Debug.Trace(Self + ".DropPlayerItem() looped "+(aiRetries-try)+" times, returning "+ref)
	Return ref
EndFunction ; DropPlayerItem()
