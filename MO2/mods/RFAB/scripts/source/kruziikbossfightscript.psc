Scriptname KruziikBossFightScript extends Actor

ObjectReference Property CenterLocation auto
ObjectReference Property HiddenLocation auto
GlobalVariable Property KruziikTransformGlobal auto
KruziikUnlockDoor Property KruziikUnlockDoor_Ref auto

bool HasCastedTeleport
bool HasCastedWyrms

event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;if (self.GetAVPercentage("Health") <= 0.6 && !HasCastedWyrms)
	;	KruziikTransformGlobal.SetValue(1)
	;	self.SetGhost()
	;    self.EvaluatePackage()	
	;    HasCastedWyrms = true
	;endif

	if (self.GetAVPercentage("Health") <= 0.25 && !HasCastedTeleport)
    	self.SetGhost()
    	self.EvaluatePackage()
    	HasCastedTeleport = true
    endif
EndEvent

;FrostWyrm Phase-----

	;Actor Property FrostWyrm1 auto
	;Actor Property FrostWyrm2 auto
	;ObjectReference Property FrostWyrm1_ambushmarker auto
	;ObjectReference Property FrostWyrm2_ambushmarker auto
;
	;Function FrostWyrms()
	;	FrostWyrm1_ambushmarker.MoveTo(Self, 120.0 * Math.Sin(Self.GetAngleX()), 120.0 * Math.Cos(Self.GetAngleX()), Self.GetHeight() - 5.0)
	;	FrostWyrm2_ambushmarker.MoveTo(Self, -120.0 * Math.Sin(Self.GetAngleX()), -120.0 * Math.Cos(Self.GetAngleX()), Self.GetHeight() - 5.0)
	;	FrostWyrm1.MoveTo(FrostWyrm1_ambushmarker)
	;	FrostWyrm2.MoveTo(FrostWyrm2_ambushmarker)
	;	FrostWyrm1.Activate(self)
	;	FrostWyrm2.Activate(self)
;
	;	Self.SetGhost(false)
	;	KruziikTransformGlobal.SetValue(0)
	;	Self.StartCombat(Game.GetPlayer())
	;	self.EvaluatePackage()
	;EndFunction

;Atronach Phase------
	Hazard Property FrostOrb auto
	Static Property FXGlowFillRoundXBrt auto
	Actor Property FrostAtronach auto

	ObjectReference FrostOrb_Ref
	ObjectReference FrostOrb_Smaller_Ref
	ObjectReference	GlowFill_Ref

	Function Teleport()
		self.StopCombat()
	    self.PlaceAtMe(game.GetForm(0x0007cd55))
	    	Utility.wait(1)
	    (self as ObjectReference).MoveTo(HiddenLocation)
	    	Utility.wait(4)
	    CenterLocation.PlaceAtMe(game.GetForm(0x0007cd55))
	    	Utility.wait(1)
	    self.MoveTo(CenterLocation)
	    KruziikTransformGlobal.SetValue(2)
	    self.EvaluatePackage()
	EndFunction

	Function AtronachPhase()
		FrostOrb_Ref = Self.PlaceAtMe(FrostOrb)
		FrostOrb_Smaller_Ref = Self.PlaceAtMe(FrostOrb)
		GlowFill_Ref = Self.PlaceAtMe(FXGlowFillRoundXBrt)

		AtronachPhase_Moving()
	EndFunction

	Function AtronachPhase_Moving()
		FrostOrb_ref.MoveTo(self, 0, 0, 120, true)
		FrostOrb_Smaller_Ref.MoveTo(self, 0, 0, 120, true)
		FrostOrb_Ref.PlayGamebryoAnimation("mIdle", afEaseInTime = 2.0)
		FrostOrb_Smaller_Ref.PlayGamebryoAnimation("mIdle")
		FrostOrb_Ref.SetScale(1.25)

		AtronachPhase_SpawnAtronach()
	EndFunction

	Function AtronachPhase_SpawnAtronach()
		Self.Disable()
		utility.wait(1.5)
		FrostAtronach.MoveTo(self)
		FrostAtronach.Enable(true)
		FrostAtronach.SetAV("Health", (FrostAtronach.GetAV("health") * 0.75))

		AtronachPhase_CleanUp()
	EndFunction

	Function AtronachPhase_CleanUp()
		utility.wait(3)
		FrostAtronach.StartCombat(Game.GetPlayer())
		GlowFill_Ref.Disable(true)
		FrostOrb_Ref.Disable(true)
		FrostOrb_Smaller_Ref.Disable(true)
	EndFunction

Event OnDeath(Actor akKiller)
    KruziikUnlockDoor_Ref.EndBossFight()
EndEvent