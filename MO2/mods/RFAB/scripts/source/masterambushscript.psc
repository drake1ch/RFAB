scriptName masterambushscript extends Actor
{Script that lives on the actor and takes care of all instances of how an actor can come out of idle state while in ambush mode}

;-- Properties --------------------------------------
Bool property ambushOnTrigger = false auto
{By default, this is set to false. Set to true if you want encounter to come out of ambush when player enters trigger}
Float property fActorVariableOnReset = 0.000000 auto hidden
String property sActorVariable = "Variable01" auto hidden
{By default, this property is set to Variable01.}
Float property fAggressionOnReset = 0.000000 auto hidden
keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}
Race property DragonPriestRace Auto ;added by Fozar
GlobalVariable Property BB_Enabled Auto ;added by Fozar
Float property fAggression = 2.00000 auto hidden
{By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else}
Float property fActorVariable = 1.00000 auto hidden
{By default this property is set to 1.}

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function onReset()

	self.setAV(sActorVariable, fActorVariableOnReset)
	self.setAV("Aggression", fAggressionOnReset)
	self.evaluatePackage()
endFunction

; Skipped compiler generated GetState

;-- State -------------------------------------------
state allDone

	function onBeginState()
	
		if self.GetActorBase().GetRace() == DragonPriestRace && BB_Enabled.GetValueInt() == 1
			self.SetGhost(true)
			utility.Wait(10.0000)
			self.SetGhost(false)
		endIf
	endFunction
endState

;-- State -------------------------------------------
auto state waiting

	function onActivate(ObjectReference triggerRef)

		Actor actorRef = triggerRef as Actor
		if actorRef == game.getPlayer() || ambushOnTrigger == true
			self.GotoState("allDone")
		else
			self.setAV("Aggression", fAggression)
			self.evaluatePackage()
		endIf
	endFunction

	function onHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

		self.GotoState("allDone")
	endFunction

	function onGetUp(ObjectReference myFurniture)

		cell parentCell = self.GetParentCell()
		if parentCell as Bool && parentCell.IsAttached() && self.is3DLoaded()
			self.GotoState("allDone")
		endIf
	endFunction

	function OnCombatStateChanged(Actor actorRef, Int aeCombatState)

		if aeCombatState != 0
			self.GotoState("allDone")
		endIf
	endFunction

	function onEndState()

		if self.getLinkedRef(none)
			self.getLinkedRef(none).activate(self as ObjectReference, false)
		endIf
		if self.getNthLinkedRef(1)
			self.getNthLinkedRef(1).activate(self as ObjectReference, false)
		endIf
		if self.getNthLinkedRef(2)
			self.getNthLinkedRef(2).activate(self as ObjectReference, false)
		endIf
		self.setAV(sActorVariable, fActorVariable)
		self.setAV("Aggression", fAggression)
		self.evaluatePackage()
		if self.getLinkedRef(linkKeyword)
			self.getLinkedRef(linkKeyword).activate(self as ObjectReference, false)
		endIf
	endFunction
endState
