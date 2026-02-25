Scriptname ReturnBagPlayerAfterDeath extends ObjectReference  

float Property DaysBeforeCleanUp = 1.0 Auto 
ReferenceAlias Property DeathContainerRef Auto

Quest Property ReturnBagsQuest Auto
Quest Property WICourier Auto
Faction Property PlayerFaction Auto

ObjectReference SelfRef
bool IsPlayerHorse = false
bool cleanedUp = false	

State Dead
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			cleanedUp = true
		EndIf
	EndEvent
EndState

Event OnDying(Actor akKiller)
	SelfRef = self 
	IsPlayerHorse = SelfRef.GetFactionOwner() == PlayerFaction
	if DeathContainerRef.GetReference() && IsPlayerHorse == true
		while cleanedUp == false
			gotoState("Dead")
			utility.waitGameTime(1) 
			if cleanedUp == false
				cleanedUp = checkForCleanup()
			EndIf
		endWhile
	endif
EndEvent

bool function checkForCleanup()
	If GetParentCell() != Game.GetPlayer().GetParentCell()
		cleanUpBody() ; очистить тело и начать квест
		return true ; прекратить цикл
	EndIf
	return false
endfunction

function cleanUpBody()
	utility.waitGameTime(DaysBeforeCleanUp * 24)
	DeathContainerRef.GetReference().SetActorOwner(Game.GetPlayer().GetActorBase())
	RemoveAllItems(DeathContainerRef.GetReference())
	ReturnBagsQuest.SetCurrentStageID(5) ; если игрок не совершит сделку и потеряет еще одну лошадь
	ReturnBagsQuest.SetCurrentStageID(0) ; чтобы если еще и записку не прочитал то вор работал
EndFunction