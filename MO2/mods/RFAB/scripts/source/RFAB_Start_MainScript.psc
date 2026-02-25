Scriptname RFAB_Start_MainScript extends ObjectReference  

Quest Property MQ101 Auto
Quest Property MQ102 Auto

FormList Property RFAB_HelgenDisableList Auto  
FormList Property RFAB_HelgenEnableList Auto  

Idle Property OffsetStop auto
Idle Property IdleWalkingCameraEnd auto

Quest[] Property StartQuests Auto  
int[] Property StartQuestsStages Auto  

Globalvariable Property RFAB_StartChoice Auto
Globalvariable Property PlayerXP Auto

VisualEffect Property TeleportIn Auto  
VisualEffect Property TeleportOut Auto  

ImageSpaceModifier Property FadeToBlack Auto

RFAB_Start[] Property Starts Auto
ObjectReference[] Property StartMarkers Auto 

Quest Property Origins Auto
DialogueFollowerScript Property FollowerManager Auto 
ObjectReference[] Property FollowerMarkers Auto 
Actor Property Follower Auto

RFAB_Menu Property Menu Auto

Event OnActivate(ObjectReference akActionRef)
	Actor Player = Game.GetPlayer()

	Game.DisablePlayerControls(true,true,true,true,true,true,true,true)
	Game.ForceThirdPerson()
	TeleportIn.Play(Player, 3)
	TeleportOut.Play(Player, 3)
	FadeToBlack.ApplyCrossFade(2)

	; У хелгена включаем то, что должно включиться и выключаем ненужное (НПС, объекты и тд)
	DisableFormList(RFAB_HelgenDisableList)
	EnableFormList(RFAB_HelgenEnableList)

	Utility.Wait(2.5)

	int ChoiseID = RFAB_StartChoice.GetValueInt()

	if (Origins.GetCurrentStageID() == 10) ; Старт за посла
		Follower.MoveTo(FollowerMarkers[ChoiseID])
		FollowerManager.SetFollower(Follower)
		Follower.Enable()
	endif
	
	Player.MoveTo(StartMarkers[ChoiseID])
	Starts[ChoiseID].Choose()

	if (ChoiseID == 0) ; старт за охотника
		(Game.GetFormFromFile(0x000b1423, "RFAB_Start.esp") as ObjectReference).Enable() ; мешок охотника у палатки
	endif

	Game.ForceFirstPerson()
	ImageSpaceModifier.RemoveCrossFade(5)

	Game.PrecacheCharGenClear()
	
	PlayerXP.SetValueInt(25000)

	string Button = PapyrusIniManipulator.PullStringFromIni("Data/skse/plugins/[RFAB] KeyCodes.ini", "Buttons", Menu.Hotkey)
	SkyMessage.Show("Мне нужно прийти в себя и вспомнить свои навыки.\nНажмите " + Button + ", чтобы распределить опыт.", "Принять")
	
	Game.ShowFirstPersonGeometry(true)
	Game.SetPlayerAIDriven(false)
	Game.EnablePlayerControls()
	PushQuests()
	Player.SetRestrained(false)
	Game.SetHudCartMode(false)
	Player.PlayIdle(OffsetStop)
	Player.PlayIdle(IdleWalkingCameraEnd)
EndEvent

Function PushQuests()
	;этот блок взят с альтернативного старта, выставляем по порядку стадии первого квеста
	dunPostHelgenEnableScript HelgenEnableScript = Game.GetForm(0xF823C) as dunPostHelgenEnableScript
  	dunPostHelgenFXDisableScript HelgenDisableScript = Game.GetForm(0x10CEC4) as dunPostHelgenFXDisableScript

 	HelgenEnableScript.myDaysPassed = 0.0
  	HelgenEnableScript.onLoad()
	HelgenDisableScript.myDaysPassed = 0.0
	HelgenDisableScript.onCellAttach()

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

	;двигаем квест до разговора с Фаренгаром
	MQ102.SetStage(0)
	MQ102.SetStage(1)
	MQ102.SetStage(15)

	;продвигаем квесты до нужных стадий (соратники, гильдия магов, разговор со стражником у ворот Вайтрана итд)
	int i = 0
 	while (i < StartQuests.Length)
  		if StartQuests[i].IsStarting()
  			StartQuests[i].Start()
 		endif
		StartQuests[i].SetStage(StartQuestsStages[i])	
		i += 1
 	 endwhile
EndFunction

Function DisableFormList(FormList akFormList)
	int count = akFormList.GetSize()
	while (count)
		count -= 1
		(akFormList.GetAt(count) as ObjectReference).DisableNoWait()
	endwhile
EndFunction

Function EnableFormList(FormList akFormList)
	int count = akFormList.GetSize()
	while (count)
		count -= 1
		(akFormList.GetAt(count) as ObjectReference).EnableNoWait()
	endwhile
EndFunction