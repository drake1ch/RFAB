Scriptname RFAB_BA_Radiant extends Quest

EffectShader Property DoorOpen Auto
EffectShader Property DoorClosed Auto

Quest Property RadiantQuest Auto
Keyword Property RadiantKeyword Auto

string Property DungeonNext = "Куда отправиться?" Auto
string Property DungeonDanger = "Я чувствую опасность за этой дверью, возможно я вернусь сюда позже.\nКуда отправиться?" Auto

FormList Property DungeonAreas Auto
GlobalVariable Property InDungeonArea Auto
{ >= 1 == in area | == 0 != in area }

RFAB_BA_Dungeons Property ScriptDungeons Auto
RFAB_BA_StageHandler Property ScriptStages Auto

ObjectReference Property HubMarker Auto

Actor Property Player Auto

DialogueFollowerScript Property DialogueFollower Auto

Spell Property BossCloak Auto

int DeathTime = 5
int DeathCount = 0

Event OnInit()
	RegisterForModEvent("RFAB_BA_Event_BossLoad", "OnBossLoad")
	RegisterForModEvent("RFAB_BA_Event_BossSlain", "OnBossSlain")
EndEvent

Event OnBossLoad(Form akBoss)
	(akBoss as Actor).AddSpell(BossCloak)
EndEvent

Event OnBossSlain(Form akBoss)
	(RadiantQuest.GetAliasByName("Boss") as ReferenceAlias).ForceRefTo(akBoss as ObjectReference)
	RadiantQuest.SetStage(200)
	ScriptDungeons.CompleteDungeon()
EndEvent

bool Function IsRadiantCompleted()
	return RadiantQuest.IsCompleted()
EndFunction

Function ShowExit(bool abDanger = false, bool abCancel = true)
	int iChoiceID = ShowChoice(abDanger, abCancel)
	if (iChoiceID == 2)
		return
	endif
	BlockAreas()
	if (iChoiceID == 0)
		ScriptDungeons.GoToNewDungeon()
	elseif (iChoiceID == 1)
		MoveToHub()
	endif
EndFunction

int Function ShowChoice(bool abDanger, bool abCancel)
	string[] sButtons
	if (abCancel)
		sButtons = new string[3]
		sButtons[0] = "В путь"
		sButtons[1] = "В лагерь"
		sButtons[2] = "Отойти"
	else
		sButtons = new string[2]
		sButtons[0] = "В путь"
		sButtons[1] = "В лагерь"
	endif
	if (abDanger)
		return SkyMessage.ShowArray(DungeonDanger, sButtons, getIndex = true) as int
	else
		return SkyMessage.ShowArray(DungeonNext, sButtons, getIndex = true) as int
	endif
EndFunction

; Dungeon area

Function AddArea(ObjectReference akArea)
	DungeonAreas.AddForm(akArea)
EndFunction

Function BlockAreas()
	int i = DungeonAreas.GetSize()
	while (i > 0)
		i -= 1
		(DungeonAreas.GetAt(i) as RFAB_BA_DungeonArea).GoToState("Blocked")
	endwhile
	DungeonAreas.Revert()
	InDungeonArea.SetValue(0.0)
EndFunction

Function OnAreaEnter()
	InDungeonArea.Mod(1.0)
	DeathCount = DeathTime
	UnregisterForUpdate()
EndFunction

Function OnAreaLeave()
	bool bIsInDungeon = InDungeonArea.Mod(-1.0) > 0
	if (bIsInDungeon)
		return
	endif
	if (IsRadiantCompleted())
		ShowExit(abCancel = false)
	else
		RFAB_PapyrusFunctions.ShowQuestNotification("Вернитесь обратно в локацию!")
		DeathCount = DeathTime
		RegisterForSingleUpdate(5.0)
	endif	
EndFunction

Event OnUpdate()
	if (DeathCount == 0)
		Game.GetPlayer().Kill()
	else
		RegisterForSingleUpdate(2.0)
	endif
	RFAB_PapyrusFunctions.ShowQuestNotification(DeathCount)
	DeathCount -= 1
EndEvent

; Misc

Function StartDungeon(ObjectReference akMarker)
	if (ScriptStages.IsNeedShowMovie)
		ShowNextStageMovie()
	endif
	RadiantKeyword.SendStoryEvent(akRef1 = akMarker)
EndFunction

Function MoveToHub()
	if (ScriptStages.IsNeedShowMovie)
		ShowNextStageMovie()
	endif
	MovePlayerTo(HubMarker)
EndFunction

Function MovePlayerTo(ObjectReference akMarker)
	Player.MoveTo(akMarker)
	Player.StopCombatAlarm()
	Actor kFollower = DialogueFollower.pFollowerAlias.GetActorReference()
	if (kFollower)
		float fAngle = akMarker.GetAngleZ()
		kFollower.MoveTo(akMarker, 80.0 * Math.Cos(fAngle), 80.0 * Math.Sin(fAngle))
		kFollower.StopCombatAlarm()
	endif
	Game.RequestSave()
EndFunction

Function ShowNextStageMovie()
	ScriptStages.IsNeedShowMovie = false
	Game.DisablePlayerControls()
	Game.FadeOutGame(true, true, 0.0, 1.0)
	Utility.Wait(0.7)
	Game.PlayBink("RFAB_BA_Video_Chapter0" + ScriptDungeons.StageNumber.GetValueInt() + ".bik", abLetterbox = false)
	Game.FadeOutGame(false, true, 2.0, 1.0)
	Utility.Wait(1.0)
	Game.EnablePlayerControls()
EndFunction