Scriptname RFAB_PerkEssence extends ActiveMagicEffect

Sound Property GainSound Auto

int PerkCount = 0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PerkCount = GetMagnitude() as int
EndEvent

Event OnDying(Actor akKiller)
	Utility.Wait(0.25)
	GainSound.Play(Game.GetPlayer())
	Utility.Wait(1.5)
	string sText = "Получено очко навыков!"
	RFAB_PapyrusFunctions.ShowQuestNotification(sText)
	Game.ModPerkPoints(PerkCount)    
EndEvent