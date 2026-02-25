scriptName aaaUDDragonAIScript extends activemagiceffect

;-- Properties --------------------------------------
spell property aaaUDStampSpell auto
spell property aaaUDDragonAISpell auto
magiceffect property aaaUDOnHitEffect auto
formlist property aaaUDPreventDupList auto
explosion property FearShout auto
actorbase property aaaUDSpectralDragon auto
globalvariable property aaaUDMeleeDmgMult auto
idle property aaaUDTailTurnRight auto
idle property aaaUDTailTurnLeft auto
spell property AbDragonFrost auto
spell property aaaUDMarkedForDeathSpell auto
spell property aaaUDSwingShoutSpell auto
spell property AbDragonFire auto
spell property aaaUDEnrageSpell auto
spell property L_VoiceDragonFrostBall01 auto
sound property WPNBashBlade auto
spell property aaaUD3ShoutSpell auto
explosion property ForceShout auto
activator property FXEmptyActivator auto
actor property player auto
globalvariable property aaaUDMagicSelector auto
explosion property IceFormShout auto
spell property L_VoiceDragonFireBall01 auto
globalvariable property aaaUDMagicDmgMult auto
spell property aaaUDMagicAttackSpell auto
spell property aaaUDFearShoutSpell auto
visualeffect property aaaUDSwingTailVFX auto
spell property AbAlduinInvulnerability auto
spell property aaaUDTailTurnSpell auto

;-- Variables ---------------------------------------
ObjectReference Box
Bool bOnce = true
actor Target
String Node
Int NoDistRate
Int[] MeleeList
String Type
Int LvRank
Int[] NoDistList
Float _Rank = 0.000000
Int[] RangedList
actor selfActor

;-- Functions ---------------------------------------

function OnAnimationEvent(ObjectReference deliverator, String eventName)

	if eventName == "DragonLandEffect"
		self.GotoState("Land")
	endIf
	if eventName == "endGroundAttack"
		MeleeList[1] = 3
		self.GotoState("AddBehavior")
	endIf
	if eventName == "BeginCastVoice" && selfActor.GetAnimationVariableBool("IsOnGround")
		self.GotoState("MoveControllShout")
	endIf
	if selfActor.GetAnimationVariableBool("IsUDAnimation")
		if eventName == "EnrageEvent"
			self.Enrage()
		elseIf eventName == "StampHitEvent"
			if selfActor.GetAnimationVariableBool("IsRight")
				Node = "NPC RLegToe1"
			else
				Node = "NPC LLegFoot"
			endIf
			self.CastAreaEffect(aaaUDStampSpell, Node)
		elseIf eventName == "TailTurnHitEvent"
			aaaUDSwingTailVFX.Play(selfActor as ObjectReference, 1.00000, none)
			self.CastAreaEffect(aaaUDTailTurnSpell, "NPC Tail4")
		elseIf eventName == "TailTurnEndEvent"
			self.OneMoreTailTurn()
		elseIf eventName == "ShoutFireBallEvent"
			if Type == "Frost"
				L_VoiceDragonFrostBall01.Cast(selfActor as ObjectReference, Target as ObjectReference)
			else
				L_VoiceDragonFireBall01.Cast(selfActor as ObjectReference, Target as ObjectReference)
			endIf
		elseIf eventName == "SoundPlay.VOCShoutDragon02BRuMaar"
			aaaUDFearShoutSpell.Cast(selfActor as ObjectReference, none)
		elseIf eventName == "SoundPlay.VOCShoutDragon03BSlenNus"
			self.Shout(IceFormShout)
		elseIf eventName == "SoundPlay.VOCShoutDragon01BRoDah"
			self.Shout(ForceShout)
		elseIf eventName == "MarkedForDeathEvent"
			Box.MovetoNode(selfActor as ObjectReference, "NPC Head MagicNode [Hmag]")
			aaaUDMarkedForDeathSpell.RemoteCast(Box, selfActor, none)
		endIf
	endIf
endFunction

Bool function GetFuzzy(Float value, Float min, Float max)

	if value <= min
		return true
	elseIf value <= max
		Float grade = (value - min) / (max - min)
		if utility.RandomFloat(0.000000, 1.00000) > grade
			return true
		else
			return false
		endIf
	else
		return false
	endIf
endFunction

Int function Random(Int[] List)

	Int i = 0
	Int sum = 0
	while i < List.length
		sum += List[i]
		i += 1
	endWhile
	Int RandomResult = utility.RandomInt(1, sum)
	i = 0
	while i < List.length && RandomResult > 0
		RandomResult -= List[i]
		i += 1
	endWhile
	i -= 1
	return i
endFunction

function OnUpdate()

	selfActor.SetAnimationVariableBool("IsEnraging", false)
	selfActor.SetAnimationVariableFloat("playbackSpeed", 1.00000)
	self.CreateAttackList()
endFunction

function OnDying(actor akKiller)

	aaaUDPreventDupList.RemoveAddedForm(selfActor as form)
	Box.Delete()
	Box = none
endFunction

function Anim(String AnimEventName)

	debug.SendAnimationEvent(selfActor as ObjectReference, AnimEventName)
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	selfActor = akTarget
	Type = self.DragonType()
	LvRank = self.CalcLevelRank()
	if aaaUDPreventDupList.HasForm(selfActor as form) == false
		aaaUDPreventDupList.AddForm(selfActor as form)
		selfActor.SendModEvent("HPCalcEvent", "", 0.000000)
		;selfActor.ForceAV("DamageResist", (LvRank * 45) as Float / (1 as Float + math.abs(3 as Float - math.log(player.GetLevel() as Float)) * math.pow(2.71800, (-1 * LvRank) as Float)))
		selfActor.ForceAV("UnarmedDamage", selfActor.GetAV("UnarmedDamage") * aaaUDMeleeDmgMult.GetValue())
		selfActor.ForceAV("ShieldPerks", aaaUDMagicDmgMult.GetValue())
	endIf
	self.Register()
	self.CreateAttackList()
	Box = selfActor.Placeatme(FXEmptyActivator as form, 1, false, false)
endFunction

function OnCombatStateChanged(actor akTarget, Int aeCombatState)

	if aeCombatState == 0
		selfActor.removespell(aaaUDDragonAISpell)
		Box.Delete()
		Box = none
	endIf
endFunction

function Enrage()

	self.Shout(FearShout)
	selfActor.SetAnimationVariableBool("IsEnraging", true)
	selfActor.SetAnimationVariableFloat("playbackSpeed", 1.20000)
	NoDistRate = 4
	NoDistList[0] = 0
	MeleeList[2] = 0
	MeleeList[4] = 0
	MeleeList[5] = 3
	RangedList[0] = 0
	RangedList[2] = 1
	RangedList[4] = 18
	self.RegisterForSingleUpdate(60 as Float)
endFunction

function MagicSelector(Int value)

	if Type == "Frost"
		value += 1
	endIf
	aaaUDMagicSelector.SetValueInt(value)
	utility.Wait(0.0100000)
	aaaUDMagicAttackSpell.Cast(selfActor as ObjectReference, selfActor as ObjectReference)
endFunction

; Skipped compiler generated GetState

String function DragonType()

	if selfActor.HasSpell(AbAlduinInvulnerability as form)
		return "Alduin"
	elseIf selfActor.HasSpell(AbDragonFire as form)
		return "Fire"
	elseIf selfActor.HasSpell(AbDragonFrost as form)
		return "Frost"
	else
		return "Other"
	endIf
endFunction

function CreateAttackList()

	NoDistRate = 8
	NoDistList = new Int[5]
	MeleeList = new Int[6]
	RangedList = new Int[5]
	NoDistList[0] = 10 - LvRank
	NoDistList[1] = 0
	NoDistList[2] = 0
	NoDistList[3] = 0
	NoDistList[4] = 0
	MeleeList[0] = 14 - LvRank
	MeleeList[1] = 14
	MeleeList[2] = LvRank
	MeleeList[3] = 0
	MeleeList[4] = 6
	MeleeList[5] = 3
	RangedList[0] = 10 - LvRank
	RangedList[1] = 9
	RangedList[2] = LvRank
	RangedList[3] = LvRank
	RangedList[4] = 12
	if Type == "Fire" || Type == "Other"
		NoDistList[2] = 8
	elseIf Type == "Frost"
		NoDistList[1] = 8
	elseIf Type == "Alduin"
		NoDistList[3] = 8
		NoDistList[4] = 12
	endIf
	if LvRank >= 4
		MeleeList[3] = 6
	endIf
endFunction

; Skipped compiler generated GotoState

function Summon()

	selfActor.Placeatme(aaaUDSpectralDragon as form, 1, false, false)
	selfActor.Placeatme(aaaUDSpectralDragon as form, 1, false, false)
endFunction

function OneMoreTailTurn()

	if selfActor.GetAnimationVariableBool("bTailTurnOneMore") == false
		selfActor.SetAnimationVariableBool("bTailTurnOneMore", true)
		return 
	endIf
	Float HeadAngle = selfActor.GetHeadingAngle(Target as ObjectReference)
	if self.GetFuzzy(HeadAngle, 30.0000, 90.0000) == false
		if HeadAngle < -30.0000 && HeadAngle > -180.000
			selfActor.PlayIdle(aaaUDTailTurnRight)
		elseIf HeadAngle > 30.0000 && HeadAngle < 180.000
			selfActor.PlayIdle(aaaUDTailTurnLeft)
		endIf
		selfActor.SetAnimationVariableBool("bTailTurnOneMore", false)
	endIf
endFunction

Int function CalcLevelRank()

	Int Rank = 0
	Int Level = selfActor.GetLevel()
	while Rank * 10 < Level && Rank < 7
		Rank += 1
	endWhile
	return Rank
endFunction

function Register()

	Target = selfActor.GetCombatTarget()
	self.registerForAnimationEvent(selfActor as ObjectReference, "DragonLandEffect")
	self.registerForAnimationEvent(selfActor as ObjectReference, "endGroundAttack")
	self.registerForAnimationEvent(selfActor as ObjectReference, "BeginCastVoice")
	self.registerForAnimationEvent(selfActor as ObjectReference, "SoundPlay.VOCShoutDragon02BRuMaar")
	self.registerForAnimationEvent(selfActor as ObjectReference, "ShoutFireBallEvent")
	self.registerForAnimationEvent(selfActor as ObjectReference, "EnrageEvent")
	self.registerForAnimationEvent(selfActor as ObjectReference, "TailTurnHitEvent")
	self.registerForAnimationEvent(selfActor as ObjectReference, "TailTurnEndEvent")
	self.registerForAnimationEvent(selfActor as ObjectReference, "StampHitEvent")
	if Type == "Frost"
		self.registerForAnimationEvent(selfActor as ObjectReference, "SoundPlay.VOCShoutDragon03BSlenNus")
	else
		self.registerForAnimationEvent(selfActor as ObjectReference, "SoundPlay.VOCShoutDragon01BRoDah")
	endIf
	if LvRank >= 4
		self.registerForAnimationEvent(selfActor as ObjectReference, "MarkedForDeathEvent")
	endIf
endFunction

function CastAreaEffect(spell Effect, String sNode)

	Box.MovetoNode(selfActor as ObjectReference, sNode)
	Effect.RemoteCast(Box, selfActor, none)
endFunction

function Shout(explosion shoutexp)

	utility.Wait(0.0660000)
	Box.MovetoNode(selfActor as ObjectReference, "NPC Head MagicNode [Hmag]")
	Box.Placeatme(shoutexp as form, 1, false, false)
endFunction

;-- State -------------------------------------------
state AddBehavior

	function OnAnimationEvent(ObjectReference deliverator, String eventName)

		if eventName == "endGroundAttack"
			return 
		endIf
	endFunction

	function onBeginState()

		Int i = utility.RandomInt(1, 100)
		if i >= 80 + LvRank
			self.GotoState("")
			return 
		endIf
		Target = selfActor.GetCombatTarget()
		Float distance = Target.GetDistance(selfActor as ObjectReference)
		Float headingAngle = selfActor.GetHeadingAngle(Target as ObjectReference)
		if i <= NoDistRate
			i = self.Random(NoDistList)
			if i == 0
				self.Anim("Step")
			elseIf i == 1
				self.Anim("IceFormShout")
			elseIf i == 2
				self.Anim("ForceShout")
			elseIf i == 3
				self.Summon()
			elseIf i == 4
				self.MagicSelector(7)
			endIf
		elseIf self.GetFuzzy(distance, 530 as Float, 700 as Float)
			i = self.Random(MeleeList)
			if i == 1
				if headingAngle <= 180.000 && headingAngle > 0.000000
					selfActor.PlayIdle(aaaUDTailTurnLeft)
				else
					selfActor.PlayIdle(aaaUDTailTurnRight)
				endIf
			elseIf i == 2
				self.MagicSelector(1)
			elseIf i == 3
				self.Anim("MarkedForDeath")
			elseIf self.GetFuzzy(math.abs(headingAngle), 80 as Float, 90 as Float)
				if i == 4
					aaaUDSwingShoutSpell.Cast(selfActor as ObjectReference, selfActor as ObjectReference)
				elseIf i == 5
					self.GotoState("parrywait")
				endIf
			endIf
		elseIf self.GetFuzzy(math.abs(headingAngle), 80 as Float, 90 as Float)
			i = self.Random(RangedList)
			if i == 0
				self.Anim("Step")
			elseIf i == 1
				aaaUD3ShoutSpell.Cast(selfActor as ObjectReference, selfActor as ObjectReference)
			elseIf i == 2
				self.MagicSelector(3)
			elseIf i == 3
				self.MagicSelector(5)
			elseIf i == 4
				self.Anim("ShoutFireBallStart")
			endIf
		endIf
		self.GotoState("")
	endFunction
endState

;-- State -------------------------------------------
state Land

	function onBeginState()

		utility.Wait(2.00000)
		self.Anim("FearShout")
		self.UnregisterForAnimationEvent(selfActor as ObjectReference, "DragonLandEffect")
		self.GotoState("")
	endFunction
endState

;-- State -------------------------------------------
state parrywait

	function OnAnimationEvent(ObjectReference deliverator, String eventName)

		if eventName == "preHitframe" && selfActor.GetDistance(Target as ObjectReference) <= 530 as Float && math.abs(selfActor.GetHeadingAngle(Target as ObjectReference)) < 90.0000
			if utility.RandomInt(1, 100) <= 80
				self.Anim("ParryAttack")
			else
				self.Anim("Parry")
			endIf
			debug.SendAnimationEvent(Target as ObjectReference, "RecoilLargeStart")
			utility.Wait(0.200000)
			WPNBashBlade.Play(selfActor as ObjectReference)
		endIf
	endFunction

	function onBeginState()

		self.Anim("parrywait")
		self.registerForAnimationEvent(Target as ObjectReference, "preHitframe")
		utility.Wait(3.00000)
		self.UnregisterForAnimationEvent(Target as ObjectReference, "preHitframe")
		self.GotoState("")
	endFunction
endState

;-- State -------------------------------------------
state MoveControllShout

	function onBeginState()

		Float distance = selfActor.GetDistance(Target as ObjectReference)
		Float Degrees = math.abs(selfActor.GetHeadingAngle(Target as ObjectReference))
		if utility.RandomInt(1, 100) <= 15 && distance < 1500.00 && Degrees < 80.0000
			aaaUDSwingShoutSpell.Cast(selfActor as ObjectReference, selfActor as ObjectReference)
			self.GotoState("")
			return 
		endIf
		selfActor.SetAnimationVariableFloat("BSLookAtModifier_m_onGain_Shouting", 0.0300000)
		utility.Wait(1.50000)
		Float trackSpeed = math.pow(Degrees * (1.00000 + (LvRank / 50) as Float) / 10 as Float, 3 as Float) / 10000 as Float
		selfActor.SetAnimationVariableFloat("BSLookAtModifier_m_onGain_Shouting", trackSpeed)
		Int count = 0
		while selfActor.GetAnimationVariableBool("IsShouting") == true && count < 12
			utility.Wait(0.250000)
			count += 1
		endWhile
		selfActor.SetAnimationVariableFloat("BSLookAtModifier_m_onGain_Combat", 0.0750000)
		selfActor.SetAnimationVariableFloat("BSLookAtModifier_m_onGain_Shouting", 0.250000)
		utility.Wait(0.100000)
		MeleeList[1] = 0
		self.GotoState("AddBehavior")
	endFunction
endState
