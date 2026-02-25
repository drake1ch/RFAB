Scriptname RFAB_BA_StartQuest extends Quest  

Idle Property WakeUp Auto
ImageSpaceModifier Property Woozy Auto

; заброшенные концепты
Race Property Khadjiit Auto
Race Property Argonian Auto
Spell Property Invisible Auto

Scene Property GudbrandForceGreet Auto
ObjectReference Property GudbrandMarker Auto 
ObjectReference Property PlayerMarker Auto 
Actor Property Gudbrand Auto

GlobalVariable Property GameHour Auto

DialogueFollowerScript Property DialogueFollower Auto 
Actor Property Follower Auto
Quest Property Origins Auto

Globalvariable Property PlayerXP Auto

Function StopSleeping()
	Game.DisablePlayerControls(ablooking = true, abCamSwitch = true)
	Game.ForceFirstPerson()

	GameHour.SetValueInt(10)
	
	Actor Player = Game.GetPlayer()
	Player.MoveTo(PlayerMarker)
	Woozy.Apply()
	Player.PlayIdle(WakeUp)
	
	Utility.Wait(0.5)
	GudbrandForceGreet.Start()

	Utility.Wait(3.0)
	Game.EnablePlayerControls()

	if (Origins.GetStageDone(10))
		DialogueFollower.SetFollower(Follower)
		DialogueFollower.FollowerWait()
		Follower.Enable()
	endif

	PlayerXP.SetValueInt(25000)
EndFunction

Function PushMainQuest()
	(Game.getform(0xF823C) as dunPostHelgenEnableScript).myDaysPassed = 0.0			;этот блок взят с альтернативного старта, выставляем по порядку стадии первого квеста
	(Game.getform(0xF823C) as dunPostHelgenEnableScript).onLoad()
	(Game.getform(0x10CEC4) as dunPostHelgenFXDisableScript).myDaysPassed = 0.0
	(Game.getform(0x10CEC4) as dunPostHelgenFXDisableScript).onCellAttach()

	Quest MQ101 = Quest.GetQuest("MQ101")
	MQ101.SetStage(100)
	MQ101.SetStage(120)
	MQ101.SetStage(145)
	MQ101.SetStage(150)
	MQ101.SetStage(180)
	MQ101.SetStage(200)
	MQ101.SetStage(250)
	MQ101.SetStage(500)
	MQ101.SetStage(800)
	MQ101.SetStage(900)
	MQ101.SetStage(1000)
EndFunction