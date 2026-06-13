;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname PRKF_RFAB_Perk_Lockpicki_07000800_255 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Process(akTargetRef as Actor, 5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Process(akTargetRef as Actor, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Actor kActor = akTargetRef as Actor

if (!IsMeetsConditions(kActor, 100))
	return
endif

if (kActor.GetActorValue("Variable02") == -1)
	Debug.Notification("Анимункул уже серьезно поврежден")
	return
endif

if (HackMessageForgeMaster.Show() == 0)
	kActor.ForceActorValue("Variable02", -1)
	kActor.DamageActorValue("Health", kActor.GetActorValue("Health") * 0.25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Process(akTargetRef as Actor, 75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Process(akTargetRef as Actor, 25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Process(akTargetRef as Actor, 50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function Process(Actor akTarget, int aiSkillThreshold)
	if (!IsMeetsConditions(akTarget, aiSkillThreshold))
		return
	endif

	if (HackMessage.Show() == 0)
		akTarget.ForceActorValue("Variable02", -1)
		akTarget.Kill(PlayerRef)
	endif
EndFunction

bool Function IsMeetsConditions(Actor akTarget, int aiSkillThreshold)
	if (akTarget.IsDead())
		return false
	endif

	if (RFAB_PapyrusFunctions.GetCombatState(PlayerRef) != 1)
		Debug.Notification("Меня обнаружили!")
		return false
	endif

	if (PlayerRef.GetActorValue("Lockpicking") < aiSkillThreshold)
		Debug.Notification("Мне не хватает навыков")
		return false
	endif

	return true
EndFunction

Message Property HackMessage  Auto  

Message Property HackMessageForgeMaster  Auto  

Actor Property PlayerRef Auto  
