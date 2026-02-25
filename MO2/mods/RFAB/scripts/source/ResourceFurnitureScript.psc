Scriptname ResourceFurnitureScript extends ObjectReference Conditional
{script for furniture which the player can use to get resources}

formlist Property requiredItemList Auto  
{required for player to use - optional}

Message Property FailureMessage Auto  
{Message to say why you can't use this without RequiredWeapon}

MiscObject Property Resource Auto  
{what you get from using this furniture}

int Property ResourceCount = 1 Auto
{how many resources you get per use}

int property MaxResourcePerActivation = 6 auto
{How many times can this object be used before the player has to re-activate?}

faction property CurrentFollowerFaction auto
{Used to handle player followers using the furniture object}

objectReference property NPCfollower auto hidden
{hidden property to track followers who used this}

Idle Property IdleWoodchopExit Auto

int counter

Actor Player
Actor User

Event OnLoad()
	Player = Game.GetPlayer()
	BlockActivation(true)
EndEvent

Event OnUnload()
	UnregisterForEvents(Player)
	if NPCfollower
		UnregisterForEvents(NPCfollower)
	endif
EndEvent

Auto STATE Normal
Event OnActivate(ObjectReference akActionRef)
	GoToState("Busy")
	Player = Game.GetPlayer()
	User = akActionRef as Actor

	if (User == Player || User.IsInFaction(CurrentFollowerFaction))
		bool allowActivation = true

		if (User.GetItemCount(requiredItemList) == 0)
			allowActivation = false
			if (User == Player)
				FailureMessage.Show()
			endif
		endif
		if (User.GetActorValue("Stamina") < 30)
			allowActivation = false
			if (User == Player)
				Debug.Notification("Мне не хватает сил...")
			endif
		endif

		if (allowActivation && !IsFurnitureInUse())
			Activate(akActionRef, true)
			User.UnEquipItem(GetEquippedAxe(User), abSilent = true)
			RegisterForEvents(akActionRef)
		endif
	endif
	GoToState("Normal")
EndEvent
EndState

Weapon Function GetEquippedAxe(Actor akUser)
	int size = requiredItemList.GetSize()
	while size
		size -= 1
		Weapon Axe = requiredItemList.GetAt(size) as Weapon
		if (Axe && akUser.IsEquipped(Axe))
			return Axe
		endif
	endwhile
	return None
EndFunction

STATE Busy
	; do nothing
endState

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "AddToInventory"
		User.DamageAV("Stamina", 30)
		User.AddItem(Resource, ResourceCount)
		counter = (counter + resourceCount)
		if counter >= MaxResourcePerActivation || User.GetActorValue("Stamina") < 30
			counter = 0
			User.PlayIdle(IdleWoodchopExit)
			UnRegisterForEvents(akSource)
		endif
	elseif asEventName == "IdleFurnitureExit"
		counter = 0
		UnRegisterForEvents(akSource)
	endif
EndEvent

bool isRegisteredForEvents = false

Function RegisterForEvents(objectReference whoToRegister)
	; centralize this
	isRegisteredForEvents = true
	RegisterForAnimationEvent(whoToRegister, "AddToInventory")
	RegisterForAnimationEvent(whoToRegister, "IdleFurnitureExit")
	;RegisterForAnimationEvent(whoToRegister, "SoundPlay . NPCHumanWoodChop")
EndFunction

Function UnregisterForEvents(objectReference whoToUnregister)
	; centralize this
	
	; It is perfectly safe to unregister for events you never registered for, however
	; this function is called as part of OnUnload, and if this object isn't persistent
	; then it may be deleted by the time OnUnload runs, and these function calls will
	; fail. Since RegisterForAnimationEvent persists us, we know it will be safe to
	; call Unregister if we've previously Registered, even if called as a part of
	; OnUnload
	if isRegisteredForEvents
		isRegisteredForEvents = false
		UnRegisterForAnimationEvent(whoToUnregister, "AddToInventory")
		UnRegisterForAnimationEvent(whoToUnregister, "IdleFurnitureExit")
	endif
EndFunction
