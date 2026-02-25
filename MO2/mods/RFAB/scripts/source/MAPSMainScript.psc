;/ Decompiled by Champollion V1.0.1
Source   : MAPSMainScript.psc
Modified : 2013-02-13 18:18:51
Compiled : 2013-02-13 18:18:53
User     : Chris
Computer : CHRIS-PC
/;
scriptName MAPSMainScript extends ObjectReference
{When the player closes the book, adds the indicated map markers to their map, optionally with fast travel enabled.}

;-- Properties --------------------------------------
ObjectReference property MapMarker21 auto
ObjectReference property MapMarker3 auto
ObjectReference property MapMarker15 auto
ObjectReference property MapMarker32 auto
ObjectReference property MapMarker10 auto
ObjectReference property MapMarker7 auto
ObjectReference property MapMarker16 auto
ObjectReference property MapMarker18 auto
ObjectReference property MapMarker4 auto
ObjectReference property MapMarker46 auto
ObjectReference property MapMarker14 auto
ObjectReference property MapMarker35 auto
ObjectReference property MapMarker8 auto
ObjectReference property MapMarker24 auto
ObjectReference property MapMarker5 auto
ObjectReference property MapMarker13 auto
ObjectReference property MapMarker47 auto
Bool property AllowFastTravel = false auto
{Allow fast travel to these markers? Default: False}
ObjectReference property MapMarker38 auto
ObjectReference property MapMarker40 auto
ObjectReference property MapMarker29 auto
ObjectReference property MapMarker44 auto
ObjectReference property MapMarker19 auto
ObjectReference property MapMarker37 auto
ObjectReference property MapMarker28 auto
ObjectReference property MapMarker20 auto
ObjectReference property MapMarker42 auto
ObjectReference property MapMarker41 auto
ObjectReference property MapMarker39 auto
ObjectReference property MapMarker25 auto
ObjectReference property MapMarker9 auto
ObjectReference property MapMarker45 auto
ObjectReference property MapMarker43 auto
ObjectReference property MapMarker30 auto
ObjectReference property MapMarker1 auto
ObjectReference property MapMarker36 auto
ObjectReference property MapMarker2 auto
ObjectReference property MapMarker12 auto
ObjectReference property MapMarker34 auto
ObjectReference property MapMarker33 auto
ObjectReference property MapMarker26 auto
ObjectReference property MapMarker22 auto
ObjectReference property MapMarker11 auto
ObjectReference property MapMarker23 auto
ObjectReference property MapMarker27 auto
ObjectReference property MapMarker31 auto
ObjectReference property MapMarker6 auto
ObjectReference property MapMarker17 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function stageHandling()

	if MapMarker1 != none
		MapMarker1.AddToMap(AllowFastTravel)
	endIf
	if MapMarker2 != none
		MapMarker2.AddToMap(AllowFastTravel)
	endIf
	if MapMarker3 != none
		MapMarker3.AddToMap(AllowFastTravel)
	endIf
	if MapMarker4 != none
		MapMarker4.AddToMap(AllowFastTravel)
	endIf
	if MapMarker5 != none
		MapMarker5.AddToMap(AllowFastTravel)
	endIf
	if MapMarker6 != none
		MapMarker6.AddToMap(AllowFastTravel)
	endIf
	if MapMarker7 != none
		MapMarker7.AddToMap(AllowFastTravel)
	endIf
	if MapMarker8 != none
		MapMarker8.AddToMap(AllowFastTravel)
	endIf
	if MapMarker9 != none
		MapMarker9.AddToMap(AllowFastTravel)
	endIf
	if MapMarker10 != none
		MapMarker10.AddToMap(AllowFastTravel)
	endIf
	if MapMarker11 != none
		MapMarker11.AddToMap(AllowFastTravel)
	endIf
	if MapMarker12 != none
		MapMarker12.AddToMap(AllowFastTravel)
	endIf
	if MapMarker13 != none
		MapMarker13.AddToMap(AllowFastTravel)
	endIf
	if MapMarker14 != none
		MapMarker14.AddToMap(AllowFastTravel)
	endIf
	if MapMarker15 != none
		MapMarker15.AddToMap(AllowFastTravel)
	endIf
	if MapMarker16 != none
		MapMarker16.AddToMap(AllowFastTravel)
	endIf
	if MapMarker17 != none
		MapMarker17.AddToMap(AllowFastTravel)
	endIf
	if MapMarker18 != none
		MapMarker18.AddToMap(AllowFastTravel)
	endIf
	if MapMarker19 != none
		MapMarker19.AddToMap(AllowFastTravel)
	endIf
	if MapMarker20 != none
		MapMarker20.AddToMap(AllowFastTravel)
	endIf
	if MapMarker21 != none
		MapMarker21.AddToMap(AllowFastTravel)
	endIf
	if MapMarker22 != none
		MapMarker22.AddToMap(AllowFastTravel)
	endIf
	if MapMarker23 != none
		MapMarker23.AddToMap(AllowFastTravel)
	endIf
	if MapMarker24 != none
		MapMarker24.AddToMap(AllowFastTravel)
	endIf
	if MapMarker25 != none
		MapMarker25.AddToMap(AllowFastTravel)
	endIf
	if MapMarker26 != none
		MapMarker26.AddToMap(AllowFastTravel)
	endIf
	if MapMarker27 != none
		MapMarker17.AddToMap(AllowFastTravel)
	endIf
	if MapMarker28 != none
		MapMarker28.AddToMap(AllowFastTravel)
	endIf
	if MapMarker29 != none
		MapMarker29.AddToMap(AllowFastTravel)
	endIf
	if MapMarker30 != none
		MapMarker30.AddToMap(AllowFastTravel)
	endIf
	if MapMarker31 != none
		MapMarker31.AddToMap(AllowFastTravel)
	endIf
	if MapMarker32 != none
		MapMarker32.AddToMap(AllowFastTravel)
	endIf
	if MapMarker33 != none
		MapMarker33.AddToMap(AllowFastTravel)
	endIf
	if MapMarker34 != none
		MapMarker34.AddToMap(AllowFastTravel)
	endIf
	if MapMarker35 != none
		MapMarker35.AddToMap(AllowFastTravel)
	endIf
	if MapMarker36 != none
		MapMarker36.AddToMap(AllowFastTravel)
	endIf
	if MapMarker37 != none
		MapMarker37.AddToMap(AllowFastTravel)
	endIf
	if MapMarker38 != none
		MapMarker38.AddToMap(AllowFastTravel)
	endIf
	if MapMarker39 != none
		MapMarker39.AddToMap(AllowFastTravel)
	endIf
	if MapMarker40 != none
		MapMarker40.AddToMap(AllowFastTravel)
	endIf
	if MapMarker41 != none
		MapMarker41.AddToMap(AllowFastTravel)
	endIf
	if MapMarker42 != none
		MapMarker42.AddToMap(AllowFastTravel)
	endIf
	if MapMarker43 != none
		MapMarker43.AddToMap(AllowFastTravel)
	endIf
	if MapMarker44 != none
		MapMarker44.AddToMap(AllowFastTravel)
	endIf
	if MapMarker45 != none
		MapMarker45.AddToMap(AllowFastTravel)
	endIf
	if MapMarker46 != none
		MapMarker46.AddToMap(AllowFastTravel)
	endIf
	if MapMarker47 != none
		MapMarker47.AddToMap(AllowFastTravel)
	endIf
endFunction

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state done
endState

;-- State -------------------------------------------
auto state ready

	function OnEquipped(Actor akActor)

		self.stageHandling()
	endFunction

	function OnActivate(ObjectReference akActionRef)

		self.stageHandling()
	endFunction
endState
