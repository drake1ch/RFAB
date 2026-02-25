;/ Decompiled by Champollion V1.0.1
Source   : TIF__0200D605.psc
Modified : 2012-12-31 17:00:53
Compiled : 2012-12-31 17:00:56
User     : Callum
Computer : CALLUM-PC
/;
scriptName TIF__0200D605 extends TopicInfo hidden

;-- Properties --------------------------------------
quest property tos_MyQuest auto
globalvariable property tos_AwaitingAdvance auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

{function Fragment_0(ObjectReference akSpeakerRef) ;Фрагмент полностью закоментирован и перенесен во второй, в плагине отключен флаг OnBegin и этот фрагмент

	actor akSpeaker = akSpeakerRef as actor
	(tos_MyQuest as tos_advanceandpaymentscript).Payment()
	tos_MyQuest.SetObjectiveCompleted(10, true)
	utility.Wait(1 as Float)
	if tos_AwaitingAdvance.GetValue() == 1.00000
		(tos_MyQuest as tos_advanceandpaymentscript).GiveAdvance()
	endIf
	(tos_MyQuest as tos_advanceandpaymentscript).ResetRewardItems()
	utility.Wait(2 as Float)
	tos_MyQuest.Stop()
endFunction}

function Fragment_2(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	tos_MyQuest.SetStage(10) ;Начало и конец фрагмента #2

	(tos_MyQuest as tos_advanceandpaymentscript).Payment() ;Начало фрагмента #0
	tos_MyQuest.SetObjectiveCompleted(10, true)
	;utility.Wait(1 as Float)
	if tos_AwaitingAdvance.GetValue() == 1.00000
		(tos_MyQuest as tos_advanceandpaymentscript).GiveAdvance()
	endIf
	;(tos_MyQuest as tos_advanceandpaymentscript).ResetRewardItems() ;Эта функция закоментирована и не юзабельна
	;utility.Wait(2 as Float)
	tos_MyQuest.Stop() ;Конец фрагмента #0
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
