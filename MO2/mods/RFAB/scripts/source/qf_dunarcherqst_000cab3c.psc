scriptName QF_dunArcherQST_000CAB3C extends Quest hidden

;-- Properties --------------------------------------
ReferenceAlias property Alias_FarTarget auto
ReferenceAlias property Alias_WeaponRackWeapon auto
ReferenceAlias property Alias_LeftTarget auto
ReferenceAlias property Alias_AngisTargetMarker auto
ReferenceAlias property Alias_AngiAlias auto
ReferenceAlias property Alias_AngiTargetLookMarker auto
ReferenceAlias property Alias_RightTarget auto
ReferenceAlias property Alias_MiddleTarget auto
GlobalVariable Property Xp auto
Float property AddXP auto
zzzSXPController Property XPC Auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_37()

	; Empty function
endFunction

function Fragment_2()

	; Empty function
endFunction

function Fragment_30()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.angiShootsFinalTime.stop()
	kmyQuest.playerChallengeComplete01 = 0
	kmyQuest.playerHitTargetLeft = 0
	kmyQuest.playerHitTargetMiddle = 0
	kmyQuest.playerHitTargetRight = 0
	kmyQuest.playerHitTargetFar = 0
	kmyQuest.playerShootsAllTargets.start()
endFunction

; Skipped compiler generated GotoState

function Fragment_19()

	; Empty function
endFunction

function Fragment_29()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerShootsAllTargets.stop()
endFunction

function Fragment_9()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerHitMidTarget.stop()
	Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference(), 0.000000, 0.000000, 0.000000, true)
	kmyQuest.angiShootsSecondTime.start()
endFunction

function Fragment_0()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.angiShootsSecondTime.stop()
	kmyQuest.playerChallengeComplete01 = 0
	kmyQuest.playerHitTargetLeft = 0
	kmyQuest.playerHitTargetMiddle = 0
	kmyQuest.playerHitTargetRight = 0
	kmyQuest.playerHitTargetFar = 0
	kmyQuest.playerShootsThreeTargets.start()
endFunction

function Fragment_4()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.angiShootsFirstTime.stop()
	kmyQuest.playerHitMidTarget.start()
endFunction

function Fragment_28()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction

function Fragment_12()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerShootsThreeTargets.stop()
endFunction

function Fragment_3()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference(), 0.000000, 0.000000, 0.000000, true)
	kmyQuest.angiShootsFirstTime.start()
endFunction

function Fragment_18()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerShootsAllTargets.stop()
endFunction

function Fragment_16()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction

function Fragment_31()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerShootsFarTarget.stop()
	Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference(), 0.000000, 0.000000, 0.000000, true)
	kmyQuest.angiShootsFinalTime.start()
endFunction

function Fragment_21()

	; Empty function
endFunction

function Fragment_26()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.playerShootsThreeTargets.stop()
	Alias_AngisTargetMarker.GetReference().moveto(Alias_FarTarget.GetReference(), 0.000000, 0.000000, 0.000000, true)
	kmyQuest.angiShootsThirdTime.start()
endFunction

function Fragment_14()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction

function Fragment_24()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction

function Fragment_23()

	Quest __temp = self as Quest
	dunarcherquestscript kmyQuest = __temp as dunarcherquestscript
	kmyQuest.angiShootsThirdTime.stop()
	kmyQuest.playerChallengeComplete01 = 0
	kmyQuest.playerHitTargetLeft = 0
	kmyQuest.playerHitTargetMiddle = 0
	kmyQuest.playerHitTargetRight = 0
	kmyQuest.playerHitTargetFar = 0
	kmyQuest.playerShootsFarTarget.start()
endFunction

function Fragment_1()

	(Alias_AngiAlias.GetReference() as actor).startCombat(game.getPlayer())
endFunction

function Fragment_10()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction

; Skipped compiler generated GetState

function Fragment_40()

	; Empty function
endFunction

function Fragment_8()

	;Xpn = AddXP as int / 100
	;Xp.SetValue(Xp.GetValue() + AddXP as Float)
	;debug.Notification("Анги обучила вас: "+Xpn+"00 опыта")
	XPC.GainModXPMessage(AddXP as float, "Анги:", true)
endFunction
