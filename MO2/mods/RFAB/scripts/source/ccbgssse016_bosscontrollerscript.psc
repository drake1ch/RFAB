;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_BossControllerScript.psc
Modified : 2019-02-15 23:48:17
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_BossControllerScript extends Quest conditional

;-- Properties --------------------------------------
globalvariable property battleOngoing auto
{Global that tracks if the boss battle is currently ongoing or not.}
Float property ARENA_X_MIDPOINT hidden
	Float function get()

		return -48.0000
	endFunction
endproperty
Float property TELEPORT_TRAIL_FX_DURATION hidden
	Float function get()

		return 0.750000
	endFunction
endproperty
globalvariable property umbraIsInvulnerable auto
{Is Umbra currently invulnerable?}
actor property PlayerRef auto
Float property ARENA_Y_MIDPOINT hidden
	Float function get()

		return -2240.00
	endFunction
endproperty
Float property ARENA_FLOOR_Z hidden
	Float function get()

		return -1648.00
	endFunction
endproperty
referencealias property UmbraBoss auto
objectreference property warpTargetFrontRight auto
visualeffect property TrailFXAbsorb auto
objectreference property warpTargetFrontHallway auto
Float property TELEPORT_SUMMON_FX_DURATION hidden
	Float function get()

		return 0.500000
	endFunction
endproperty
objectreference property battlefieldCenterRef auto
Float property SOUL_FORM_VFX_DURATION hidden
	Float function get()

		return 2.00000
	endFunction
endproperty
Float property PHASE_1_DURATION hidden
	Float function get()

		return 15.0000
	endFunction
endproperty
objectreference property warpTargetFrontLeft auto
Float property HEALTH_CHECK_DURATION hidden
	Float function get()

		return 1.00000
	endFunction
endproperty
objectreference property warpTargetRearRight auto
globalvariable property currentPhase auto
{Used by packages to know the current boss phase.}
visualeffect property soulFormFX auto
effectshader property fadeOutFX auto
activator property SummonFX auto
musictype property bossMusicType auto
objectreference property warpTargetRearHallway auto
actorbase[] property UmbraImageTypesBySpawnRef auto
visualeffect property TrailFXProject auto
objectreference property warpTargetRearLeft auto
globalvariable property summonImagesEnabled auto
{Should the Summon Images spellcasting package be enabled?}
objectreference[] property imageSpawnRefs auto
globalvariable property explosionToCast auto
{Which explosion should Umbra cast next?}
Quest property umbraMainQuest auto

;-- Variables ---------------------------------------
Int currentHealthThreshold = 2 conditional
Bool initialized = false
Int phase2CheckCount = 35
Int phase2Checks = 0
Actor[] currentImages

;-- Functions ---------------------------------------

function ResetEncounter()

	actor UmbraBossRef = UmbraBoss.GetActorRef()
	self.SetUmbraInvulnerable(true)
	self.UnregisterForUpdate()
	UmbraBossRef.StopCombat()
	self.TeleportToLocation(battlefieldCenterRef, false)
	self.KillImages()
	self.GotoState("Waiting")
	bossMusicType.Remove()
	currentPhase.SetValueInt(0)
	self.SetCurrentHealthThreshold(2)
	UmbraBossRef.EvaluatePackage()
	UmbraBossRef.RestoreAV("Health", UmbraBossRef.GetBaseAV("Health"))
endFunction

; Skipped compiler generated GotoState

function SetUmbraInvulnerable(Bool abInvulnerable)

	actor UmbraBossRef = UmbraBoss.GetActorRef()
	UmbraBossRef.GetActorBase().SetInvulnerable(abInvulnerable)
	if abInvulnerable && !UmbraBossRef.IsDead()
		self.PlaySoulFormVFX()
	endIf
	utility.Wait(self.SOUL_FORM_VFX_DURATION)
	if abInvulnerable
		umbraIsInvulnerable.SetValueInt(1)
	else
		umbraIsInvulnerable.SetValueInt(0)
	endIf
endFunction

function TeleportToLocation(objectreference teleportMarker, Bool abAutodetectPlayer)

	actor UmbraBossRef = UmbraBoss.GetActorRef()
	fadeOutFX.play(UmbraBossRef as objectreference, -1.00000)
	UmbraBossRef.setGhost(true)
	objectreference previousLoc = UmbraBossRef.PlaceAtMe(SummonFX as form, 1, false, false)
	utility.Wait(self.TELEPORT_SUMMON_FX_DURATION)
	TrailFXAbsorb.play(previousLoc, self.TELEPORT_TRAIL_FX_DURATION, teleportMarker)
	UmbraBossRef.MoveTo(teleportMarker, 0.000000, 0.000000, 0.000000, true)
	UmbraBossRef.PlaceAtMe(SummonFX as form, 1, false, false)
	utility.Wait(self.TELEPORT_SUMMON_FX_DURATION)
	fadeOutFX.Stop(UmbraBossRef as objectreference)
	UmbraBossRef.setGhost(false)
	if abAutodetectPlayer
		UmbraBossRef.StartCombat(PlayerRef)
		UmbraBossRef.CreateDetectionEvent(PlayerRef, 100)
	endIf
endFunction

function AdjustPhase2Timing()

	phase2CheckCount = 55 - currentHealthThreshold * 10
endFunction

function SetCurrentHealthThreshold(Int aiThreshold)

	currentHealthThreshold = aiThreshold
	self.AdjustPhase2Timing()
endFunction

function OnUmbraCastExplosion()

	self.GotoState("Phase1")
	UmbraBoss.GetActorRef().EvaluatePackage()
endFunction

; Skipped compiler generated GetState

function Initialize()

	if !initialized
		currentImages = new Actor[5]
		self.SetUmbraInvulnerable(true)
		initialized = true
	endIf
endFunction

Bool function TryToTeleportToPlayer()

	Float playerY = PlayerRef.GetPositionY()
	Bool teleported = false
	if playerY > self.ARENA_Y_MIDPOINT + 3000.00
		self.TeleportToLocation(warpTargetRearHallway, true)
		teleported = true
	elseIf playerY < self.ARENA_Y_MIDPOINT - 2600.00
		self.TeleportToLocation(warpTargetFrontHallway, true)
		teleported = true
	elseIf PlayerRef.GetPositionZ() > self.ARENA_FLOOR_Z + 250.000
		Float playerX = PlayerRef.GetPositionX()
		if playerX > self.ARENA_X_MIDPOINT
			if playerY > self.ARENA_Y_MIDPOINT
				self.TeleportToLocation(warpTargetRearLeft, true)
				teleported = true
			else
				self.TeleportToLocation(warpTargetFrontLeft, true)
				teleported = true
			endIf
		elseIf playerY > self.ARENA_Y_MIDPOINT
			self.TeleportToLocation(warpTargetRearRight, true)
			teleported = true
		else
			self.TeleportToLocation(warpTargetFrontRight, true)
			teleported = true
		endIf
	endIf
	return teleported
endFunction

function OnUmbraDeath()

	self.UnregisterForUpdate()
	self.KillImages()
	umbraMainQuest.SetStage(40)
	bossMusicType.Remove()
endFunction

function PlaySoulFormVFX()

	actor UmbraBossRef = UmbraBoss.GetActorRef()
	if UmbraBossRef.Is3DLoaded()
		soulFormFX.play(UmbraBossRef as objectreference, 10.0000, none)
	endIf
endFunction

function SummonImages()

	Int imagesToSummon = 0
	if currentHealthThreshold == 2
		imagesToSummon = 3
	elseIf currentHealthThreshold == 1
		imagesToSummon = 4
	else
		imagesToSummon = 5
	endIf
	actor UmbraBossRef = UmbraBoss.GetActorRef()
	Int i = 0
	while i < imagesToSummon
		currentImages[i] = imageSpawnRefs[i].PlaceActorAtMe(UmbraImageTypesBySpawnRef[i], 4, none)
		imageSpawnRefs[i].PlaceAtMe(SummonFX as form, 1, false, false)
		Int waitFor3DCounter = 0
		while !currentImages[i].Is3DLoaded() && waitFor3DCounter < 10
			utility.Wait(0.100000)
			waitFor3DCounter += 1
		endWhile
		TrailFXProject.play(UmbraBossRef as objectreference, 5.00000, currentImages[i] as objectreference)
		currentImages[i].StartCombat(PlayerRef)
		i += 1
	endWhile
	UmbraBossRef.CreateDetectionEvent(PlayerRef, 100)
endFunction

function OnUmbraEnterCombat()

	; Empty function
endFunction

function KillImages()

	Int imagesCount = currentImages.length
	Int i = 0
	while i < imagesCount
		if currentImages[i]
			currentImages[i].Kill(none)
		endIf
		i += 1
	endWhile
	currentImages = new Actor[5]
endFunction

;-- State -------------------------------------------
state phase2

	function onEndState()

		phase2Checks = 0
	endFunction

	function OnUpdate()

		phase2Checks += 1
		Int checksRemaining = phase2CheckCount - phase2Checks
		if checksRemaining == 5
			self.PlaySoulFormVFX()
		endIf
		if phase2Checks < phase2CheckCount
			if UmbraBoss.GetActorRef().GetAVPercentage("Health") < currentHealthThreshold as Float * 0.330000
				self.SetCurrentHealthThreshold(currentHealthThreshold - 1)
				self.GotoState("phase3")
			else
				self.RegisterForSingleUpdate(self.HEALTH_CHECK_DURATION)
			endIf
		else
			self.GotoState("phase3")
		endIf
	endFunction

	function onBeginState()

		summonImagesEnabled.SetValueInt(1)
		currentPhase.SetValueInt(2)
		UmbraBoss.GetActorRef().EvaluatePackage()
		self.RegisterForSingleUpdate(self.HEALTH_CHECK_DURATION)
	endFunction
endState

;-- State -------------------------------------------
state phase3

	function onBeginState()

		actor UmbraBossRef = UmbraBoss.GetActorRef()
		currentPhase.SetValueInt(3)
		self.SetUmbraInvulnerable(true)
		self.KillImages()
		explosionToCast.SetValue(utility.RandomInt(0, 2) as Float)
		UmbraBossRef.StartCombat(PlayerRef)
		UmbraBossRef.EvaluatePackage()
	endFunction
endState

;-- State -------------------------------------------
state Phase1

	function OnUpdate()

		self.GotoState("phase2")
	endFunction

	function onBeginState()

		currentPhase.SetValueInt(1)
		self.RegisterForSingleUpdate(self.PHASE_1_DURATION)
		Bool teleported = self.TryToTeleportToPlayer()
		if !teleported && UmbraBoss.GetActorRef().GetDistance(battlefieldCenterRef) > 1000.00
			self.TeleportToLocation(battlefieldCenterRef, true)
		endIf
	endFunction
endState

;-- State -------------------------------------------
auto state Waiting

	function OnUmbraEnterCombat()

		battleOngoing.SetValueInt(1)
		bossMusicType.Add()
		umbraMainQuest.SetStage(30)
		self.GotoState("Phase1")
	endFunction
endState
