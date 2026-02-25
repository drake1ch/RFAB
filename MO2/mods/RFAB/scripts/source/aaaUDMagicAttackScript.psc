;/ Decompiled by Champollion V1.0.1
Source   : aaaUDMagicAttackScript.psc
Modified : 2015-12-08 16:40:39
Compiled : 2015-12-08 16:40:41
User     : tktk
Computer : TKTK-PC
/;
scriptName aaaUDMagicAttackScript extends activemagiceffect

;-- Properties --------------------------------------
Spell property aaaUDMagicAttackSpell auto
Sound property aaaUDNPCDragonKillMove auto
Explosion property DelayBomb auto
Spell property Meteor auto
GlobalVariable property aaaUDMagicSelector auto
Activator property SteamActivator auto
Hazard property IceHazard auto
Spell property IceMeteor auto
Spell property FireCircleSpell auto
Activator property FXEmptyActivator auto
Explosion property RockExplosion auto

;-- Variables ---------------------------------------
int CountCast
ObjectReference Box
Actor Target
Actor selfActor

;-- Functions ---------------------------------------

function SeachFrost()

	self.Begin()
	float Distance = 150 as float
	float TargetDistance = selfActor.GetDistance(Target as ObjectReference)
	int NumTotal = math.Floor(TargetDistance / Distance) + 1
	Box.MoveTo(selfActor as ObjectReference, 200 as float * math.sin(selfActor.GetAngleZ()), 200 as float * math.cos(selfActor.GetAngleZ()), 0 as float, true)
	while CountCast < NumTotal
		utility.Wait(0.0500000)
		float Degrees = Box.GetHeadingAngle(Target as ObjectReference)
		Box.SetAngle(Box.GetAngleX(), Box.GetAngleY(), Box.GetAngleZ() + Degrees)
		float AngleZ = Box.GetAngleZ()
		float LocX = 200 as float * math.sin(AngleZ)
		float LocY = 200 as float * math.cos(AngleZ)
		float z = Target.z - Box.z
		Box.MoveTo(Box, LocX, LocY, z, true)
		Box.PlaceAtMe(IceHazard as form, 1, false, false)
		CountCast += 1
		utility.Wait(0.350000)
	endWhile
	self.End()
endFunction

function DelayBomb()

	self.Begin()
	utility.Wait(1.80000)
	while CountCast < 4
		float Degrees = (utility.RandomInt(-5, 5) * 10) as float
		float AngleZ = Target.GetAngleZ() + Degrees
		float LocX = 180 as float * math.sin(AngleZ)
		float LocY = 180 as float * math.cos(AngleZ)
		Box.MoveTo(Target as ObjectReference, LocX, LocY, 20 as float, true)
		ObjectReference Steam = Box.PlaceAtMe(SteamActivator as form, 1, false, false)
		Box.PlaceAtMe(RockExplosion as form, 1, false, false)
		utility.Wait(1.15000)
		Box.PlaceAtMe(DelayBomb as form, 1, false, false)
		Steam.Delete()
		Steam = none
		CountCast += 1
		utility.Wait(0.150000)
	endWhile
	self.End()
endFunction

; Skipped compiler generated GotoState

function RangedMeteor(spell MeteorSpell)

	self.Begin()
	Box.MoveTo(selfActor as ObjectReference, 0 as float, 0 as float, 1500 as float, true)
	utility.Wait(1.00000)
	while CountCast < 4
		MeteorSpell.RemoteCast(Box, selfActor, Target as ObjectReference)
		utility.Wait(0.900000)
		CountCast += 1
	endWhile
	self.End()
endFunction

function Selector(int i)

	if i == 1
		self.MeleeMeteor(Meteor)
	elseIf i == 2
		self.MeleeMeteor(IceMeteor)
	elseIf i == 3
		self.RangedMeteor(Meteor)
	elseIf i == 4
		self.RangedMeteor(IceMeteor)
	elseIf i == 5
		self.DelayBomb()
	elseIf i == 6
		self.SeachFrost()
	elseIf i == 7
		self.FireCircle()
	endIf
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	selfActor = akTarget
	Target = selfActor.GetCombatTarget()
	self.Selector(aaaUDMagicSelector.GetValueInt())
endFunction

function FireCircle()

	self.Begin()
	float Degrees = 0 as float
	ObjectReference TargetBox = selfActor.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
	utility.Wait(1.00000)
	float height = Target.z - Box.z + 80 as float
	float Distance = selfActor.GetDistance(Target as ObjectReference)
	while CountCast < 8
		float AngleZ = selfActor.GetAngleZ() + Degrees
		float LocX = 500 as float * math.sin(AngleZ)
		float LocY = 500 as float * math.cos(AngleZ)
		float TLocX = Distance * math.sin(AngleZ)
		float TLocY = Distance * math.cos(AngleZ)
		Box.MoveTo(selfActor as ObjectReference, LocX, LocY, 80 as float, true)
		TargetBox.MoveTo(selfActor as ObjectReference, TLocX, TLocY, height, true)
		FireCircleSpell.RemoteCast(Box, selfActor, TargetBox)
		utility.Wait(0.200000)
		Degrees += 45 as float
		CountCast += 1
	endWhile
	TargetBox.Delete()
	TargetBox = none
	self.End()
endFunction

function Begin()

	self.GotoState("Busy")
	aaaUDNPCDragonKillMove.Play(selfActor as ObjectReference)
	debug.SendAnimationEvent(selfActor as ObjectReference, "MagicAttackEnter")
	selfActor.SetAnimationVariableBool("bNoStagger", true)
	Box = selfActor.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
	CountCast = 0
endFunction

; Skipped compiler generated GetState

function End()

	Box.Delete()
	Box = none
	debug.SendAnimationEvent(selfActor as ObjectReference, "MagicAttackExit")
	selfActor.SetAnimationVariableBool("bNoStagger", false)
	selfActor.RemoveSpell(aaaUDMagicAttackSpell)
	self.GotoState("")
endFunction

function MeleeMeteor(spell MeteorSpell)

	self.Begin()
	ObjectReference TargetBox = selfActor.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
	float Degrees = -45 as float
	int i = utility.RandomInt(1, 4)
	while i < 4
		Degrees += 90 as float
		i += 1
	endWhile
	Box.MoveTo(selfActor as ObjectReference, 0 as float, 0 as float, 1500 as float, true)
	utility.Wait(1.00000)
	while CountCast < 4
		float AngleZ = selfActor.GetAngleZ() + Degrees
		float LocX = 500 as float * math.sin(AngleZ)
		float LocY = 500 as float * math.cos(AngleZ)
		TargetBox.MoveTo(selfActor as ObjectReference, LocX, LocY, 0 as float, true)
		MeteorSpell.RemoteCast(Box, selfActor, TargetBox)
		utility.Wait(0.700000)
		Degrees += 90 as float
		CountCast += 1
	endWhile
	TargetBox.Delete()
	TargetBox = none
	self.End()
endFunction

;-- State -------------------------------------------
state busy

	function Selector(int i)

		; Empty function
	endFunction

	function OnEffectStart(Actor akTarget, Actor akCaster)

		; Empty function
	endFunction
endState
