scriptName RFAB_YsgramorBattleScript extends ActiveMagicEffect

;-- Properties --------------------------------------
sound property YsgramorHornSound auto
objectreference property Chain auto
sound property YlgarBattleMiscDialogue auto
sound[] property AdrimkBattleDialogue auto
objectreference property YsgramorMarkerForLightning auto
objectreference property JeekMarker auto
actor property Jeek auto
actor property Adrimk auto
objectreference property BattleStartMarker auto
objectreference property AdrimkMarker auto
sound property YlgarPhaseDialogue auto
actor property Jondar auto
globalvariable property AdrimkSoundID auto
objectreference property PortFake auto
actor property Ylgar auto
sound[] property YsgramorBattleDialogue auto
objectreference property ExitDoor auto
sound[] property YsgramorBattleMiscDialogue auto
sound[] property JeekBattleDialogue auto
race[] property ElfRaces auto
Int property AdrimkHealPower auto
explosion property SummonExplosion auto
imagespacemodifier property FadeToBlack auto
spell property YsgramorLightning auto
actor property Ysgramor auto
sound property AdrimkPhaseDialogue auto
spell property YsgramorRewardSpell auto
weapon property Wutrad auto
sound[] property YsgramorPhaseDialogue auto
globalvariable property YsgramorSoundID auto
globalvariable property YlgarSoundID auto
objectreference property FakeChain auto
globalvariable property JondarSoundID auto
sound[] property YlgarBattleDialogue auto
globalvariable property JeekSoundID auto
objectreference property YlgarMarker auto
objectreference property JondarMarker auto
objectreference property Port auto
imagespacemodifier property GhostModifier auto
objectreference property YsgramorTombMarker auto
sound[] property JondarBattleDialogue auto
Int property YsgramorRegenPower auto

quest Property q Auto

;-- Variables ---------------------------------------
Bool YsgramorSaidYouAreElf = false
Bool YsgramorSaidYouAreMage = false
Int JeekBattleDialogueCount
Bool YsgramorSaidYouAreThief = false
Int YlgarBattleDialogueCount
Bool YlgarSaidYouAreMageOrSneaker = false
Bool YsgramorSaidYouAreSneaker = false
Bool PlayerIsAnElf = false
Int JondarBattleDialogueCount
Int YsgramorBattleDialogueCount
actor Player
Int AdrimkBattleDialogueCount

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)

	Player = game.GetPlayer()
	self.CheckIfPlayerIsElf()
	if Player.GetDistance(YsgramorTombMarker) > 200 as Float && !Ysgramor.IsDead() && !Ysgramor.IsEnabled()
		debug.messagebox("Этот громкий звук разбудит даже мертвецов!")
		YsgramorHornSound.Play(Player as objectreference)
		game.ShakeCamera(none, 0.500000, 2 as Float)
	elseIf Player.GetDistance(YsgramorTombMarker) <= 200 as Float && !Ysgramor.IsDead() && !Ysgramor.IsEnabled()
		YsgramorHornSound.Play(Player as objectreference)
		game.ShakeCamera(none, 0.500000, 2 as Float)
		self.phase1()
	endIf
endFunction

function CheckIfPlayerIsElf()

	Int i = 0
	while i < ElfRaces.length
		if Player.GetRace() == ElfRaces[i]
			PlayerIsAnElf = true
			return 
		endIf
		i += 1
	endWhile
endFunction

function Phase3()

	Ysgramor.SetGhost(true)
	sound.StopInstance(YsgramorSoundID.GetValue() as Int)
	YsgramorPhaseDialogue[2].Play(Ysgramor as objectreference)
	utility.wait(4 as Float)
	Adrimk.EnableNoWait(true)
	Adrimk.MoveTo(AdrimkMarker, 0.000000, 0.000000, 0.000000, true)
	Adrimk.Placeatme(SummonExplosion as form, 1, false, false)
	utility.wait(2 as Float)
	AdrimkPhaseDialogue.Play(Adrimk as objectreference)
	Jeek.EnableNoWait(true)
	Jeek.MoveTo(JeekMarker, 0.000000, 0.000000, 0.000000, true)
	Jeek.Placeatme(SummonExplosion as form, 1, false, false)
	Jondar.EnableNoWait(true)
	Jondar.MoveTo(JondarMarker, 0.000000, 0.000000, 0.000000, true)
	Jondar.Placeatme(SummonExplosion as form, 1, false, false)
	AdrimkBattleDialogueCount = AdrimkBattleDialogue.length - 1
	JeekBattleDialogueCount = JeekBattleDialogue.length - 1
	JondarBattleDialogueCount = JondarBattleDialogue.length - 1
	Int i = 0
	while Adrimk.Getactorvalue("health") > 0 as Float && !Adrimk.IsDead() || Jeek.Getactorvalue("health") > 0 as Float && !Jeek.IsDead() || Jondar.Getactorvalue("health") > 0 as Float && !Jondar.IsDead()
		Ysgramor.RestoreActorValue("health", YsgramorRegenPower as Float)
		if Adrimk.Getactorvalue("health") > 0 as Float && !Adrimk.IsDead()
			Ysgramor.RestoreActorValue("health", AdrimkHealPower as Float)
			Adrimk.RestoreActorValue("health", AdrimkHealPower as Float)
			Jeek.RestoreActorValue("health", AdrimkHealPower as Float)
			Jondar.RestoreActorValue("health", AdrimkHealPower as Float)
		endIf
		if i == 15
			if Jeek.Getactorvalue("health") > 0 as Float && !Jeek.IsDead()
				Int current_soundID = JeekBattleDialogue[utility.RandomInt(0, YlgarBattleDialogueCount)].Play(Jeek as objectreference)
				JeekSoundID.setValue(current_soundID as Float)
			else
				i = 29
			endIf
		elseIf i == 30
			if Jondar.Getactorvalue("health") > 0 as Float && !Jondar.IsDead()
				Int current_soundid = JondarBattleDialogue[utility.RandomInt(0, YlgarBattleDialogueCount)].Play(Jondar as objectreference)
				JondarSoundID.setValue(current_soundid as Float)
			else
				i = 44
			endIf
		elseIf i == 45
			if Adrimk.Getactorvalue("health") > 0 as Float && !Adrimk.IsDead()
				Int current_soundid = AdrimkBattleDialogue[utility.RandomInt(0, YlgarBattleDialogueCount)].Play(Adrimk as objectreference)
				AdrimkSoundID.setValue(current_soundid as Float)
				i = 0
			else
				i = 14
			endIf
		endIf
		i += 1
		utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
	endWhile
	Ysgramor.SetGhost(false)
	Ysgramor.GetActorBase().SetEssential(false)
	Ysgramor.AddSpell(YsgramorRewardSpell, true)
	i = 0
	utility.wait(5 as Float)
	YsgramorPhaseDialogue[3].Play(Ysgramor as objectreference)
	while Ysgramor.Getactorvalue("health") > 0 as Float && !Ysgramor.IsDead()
		if Ysgramor.GetDistance(Player as objectreference) > 500 as Float
			YsgramorMarkerForLightning.MoveTo(Ysgramor as objectreference, 0 as Float, 0 as Float, 50 as Float, true)
			YsgramorLightning.Cast(YsgramorMarkerForLightning, Player as objectreference)
		endIf
		if i == 15
			if PlayerIsAnElf as Bool && !YsgramorSaidYouAreElf
				Int current_soundid = YsgramorBattleMiscDialogue[0].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreElf = true
			elseIf (Player.GetEquippedItemType(0) == 9 || Player.GetEquippedItemType(1) == 9) && !YsgramorSaidYouAreMage
				Int current_soundid = YsgramorBattleMiscDialogue[1].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreMage = true
			elseIf Player.IsSneaking() && !YsgramorSaidYouAreSneaker
				Int current_soundid = YsgramorBattleMiscDialogue[2].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreSneaker = true
			elseIf Player.GetItemCount(Wutrad as form) > 0 && !YsgramorSaidYouAreThief
				Int current_soundid = YsgramorBattleMiscDialogue[3].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreThief = true
			else
				Int current_soundid = YsgramorBattleDialogue[utility.RandomInt(0, YsgramorBattleDialogueCount)].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
			endIf
			i = 0
		endIf
		i += 1
		utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
	endWhile
	imagespacemodifier.RemoveCrossFade(2 as Float)
	YsgramorPhaseDialogue[4].Play(game.GetPlayer() as objectreference)
	Player.AddSpell(YsgramorRewardSpell, true)
	Chain.EnableNoWait(false)
	FakeChain.DisableNoWait(false)
	ExitDoor.Lock(false, false)
	PortFake.DisableNoWait(false)
	Port.EnableNoWait(false)
	q.setstage(4)
	q.completequest()
endFunction

function phase1()
	q.setstage(3)
	Chain.DisableNoWait(false)
	FakeChain.EnableNoWait(false)
	ExitDoor.SetLockLevel(255)
	ExitDoor.Lock(true, false)
	Port.DisableNoWait(false)
	PortFake.EnableNoWait(false)
	game.DisablePlayerControls(true, true, true, true, true, true, true, true, 0)
	FadeToBlack.ApplyCrossfade(2 as Float)
	utility.wait(5 as Float)
	YsgramorPhaseDialogue[0].Play(Player as objectreference)
	utility.wait(2 as Float)
	Player.MoveTo(BattleStartMarker, 0.000000, 0.000000, 0.000000, true)
	GhostModifier.ApplyCrossfade(18 as Float)
	utility.wait(18 as Float)
	game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	Ysgramor.EnableNoWait(false)
	Ysgramor.MoveTo(YsgramorTombMarker, 0.000000, 0.000000, 0.000000, true)
	Ysgramor.Placeatme(SummonExplosion as form, 1, false, false)
	YsgramorBattleDialogueCount = YsgramorBattleDialogue.length - 1
	Int i = 0
	while Ysgramor.GetActorValuePercentage("health") > 0.300000
		if Ysgramor.GetDistance(Player as objectreference) > 500 as Float
			YsgramorMarkerForLightning.MoveTo(Ysgramor as objectreference, 0 as Float, 0 as Float, 50 as Float, true)
			YsgramorLightning.Cast(YsgramorMarkerForLightning, Player as objectreference)
		endIf
		if i == 15
			if PlayerIsAnElf as Bool && !YsgramorSaidYouAreElf
				Int current_soundID = YsgramorBattleMiscDialogue[0].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundID as Float)
				YsgramorSaidYouAreElf = true
			elseIf (Player.GetEquippedItemType(0) == 9 || Player.GetEquippedItemType(1) == 9) && !YsgramorSaidYouAreMage
				Int current_soundid = YsgramorBattleMiscDialogue[1].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreMage = true
			elseIf Player.IsSneaking() && !YsgramorSaidYouAreSneaker
				Int current_soundid = YsgramorBattleMiscDialogue[2].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreSneaker = true
			elseIf Player.GetItemCount(Wutrad as form) > 0 && !YsgramorSaidYouAreThief
				Int current_soundid = YsgramorBattleMiscDialogue[3].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreThief = true
			else
				Int current_soundid = YsgramorBattleDialogue[utility.RandomInt(0, YsgramorBattleDialogueCount)].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
			endIf
			i = 0
		endIf
		i += 1
		utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
	endWhile
	self.Phase2()
endFunction

; Skipped compiler generated GotoState

function Phase2()

	Ysgramor.SetGhost(true)
	sound.StopInstance(YsgramorSoundID.GetValue() as Int)
	YsgramorPhaseDialogue[1].Play(Ysgramor as objectreference)
	utility.wait(6 as Float)
	Ylgar.EnableNoWait(true)
	Ylgar.MoveTo(YlgarMarker, 0.000000, 0.000000, 0.000000, true)
	Ylgar.Placeatme(SummonExplosion as form, 1, false, false)
	utility.wait(0.500000)
	YlgarPhaseDialogue.Play(Ylgar as objectreference)
	YlgarBattleDialogueCount = YlgarBattleDialogue.length - 1
	Int i = 0
	while Ylgar.Getactorvalue("health") > 0 as Float && !Ylgar.IsDead()
		Ysgramor.RestoreActorValue("health", YsgramorRegenPower as Float)
		if i == 15
			if (Player.GetEquippedItemType(0) == 9 || Player.GetEquippedItemType(1) == 9 || Player.IsSneaking()) && !YlgarSaidYouAreMageOrSneaker
				Int current_soundID = YlgarBattleMiscDialogue.Play(Ylgar as objectreference)
				YsgramorSoundID.setValue(current_soundID as Float)
				YlgarSaidYouAreMageOrSneaker = true
			else
				Int current_soundid = YlgarBattleDialogue[utility.RandomInt(0, YlgarBattleDialogueCount)].Play(Ylgar as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
			endIf
			i = 0
		endIf
		i += 1
		utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
	endWhile
	Ysgramor.SetGhost(false)
	i = 0
	while Ysgramor.GetActorValuePercentage("health") > 0.300000
		if Ysgramor.GetDistance(Player as objectreference) > 500 as Float
			YsgramorMarkerForLightning.MoveTo(Ysgramor as objectreference, 0 as Float, 0 as Float, 50 as Float, true)
			YsgramorLightning.Cast(YsgramorMarkerForLightning, Player as objectreference)
		endIf
		if i == 15
			if PlayerIsAnElf as Bool && !YsgramorSaidYouAreElf
				Int current_soundid = YsgramorBattleMiscDialogue[0].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreElf = true
			elseIf (Player.GetEquippedItemType(0) == 9 || Player.GetEquippedItemType(1) == 9) && !YsgramorSaidYouAreMage
				Int current_soundid = YsgramorBattleMiscDialogue[1].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreMage = true
			elseIf Player.IsSneaking() && !YsgramorSaidYouAreSneaker
				Int current_soundid = YsgramorBattleMiscDialogue[2].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreSneaker = true
			elseIf Player.GetItemCount(Wutrad as form) > 0 && !YsgramorSaidYouAreThief
				Int current_soundid = YsgramorBattleMiscDialogue[3].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
				YsgramorSaidYouAreThief = true
			else
				Int current_soundid = YsgramorBattleDialogue[utility.RandomInt(0, YsgramorBattleDialogueCount)].Play(Ysgramor as objectreference)
				YsgramorSoundID.setValue(current_soundid as Float)
			endIf
			i = 0
		endIf
		i += 1
		utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
	endWhile
	self.Phase3()
endFunction
