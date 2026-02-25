;/ Decompiled by Champollion V1.0.1
Source   : QF_ccBGSSSE016_UmbraMainQues_020021B6.psc
Modified : 2019-03-05 02:26:18
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName QF_ccBGSSSE016_UmbraMainQues_020021B6 extends Quest hidden

;-- Properties --------------------------------------
weapon property ccBGSSSE016_UmbraBossWeapon auto
referencealias property Alias_report auto
referencealias property Alias_UmbraBoss auto
objectreference property Stones auto

;-- Variables ---------------------------------------

bool done = false
Quest Property CourierQuest  Auto
book property note auto

event oninit()
    RegisterForSingleUpdate(5.0)
endevent

event OnUpdate()
    if(Game.Getplayer().Getlevel() >= 30 && !done)
		done = true
        (CourierQuest as WICourierScript).AddItemToContainer(note)
    else
        RegisterForSingleUpdate(5.0)
    endif
endevent

;-- Functions ---------------------------------------

function Fragment_8()

	Alias_UmbraBoss.GetActorRef().RemoveItem(ccBGSSSE016_UmbraBossWeapon as form, 1, false, none)
	self.SetObjectiveCompleted(20, true)
	self.SetObjectiveDisplayed(30, true, false)
endFunction

; Skipped compiler generated GetState

function Fragment_4()

	self.SetObjectiveCompleted(30, true)
	self.Stop()
endFunction

function Fragment_1()

	self.SetObjectiveCompleted(0, true)
	if !self.IsObjectiveDisplayed(10)
		self.SetObjectiveDisplayed(10, true, false)
	endIf
endFunction

function Fragment_0()

	self.SetObjectiveDisplayed(0, true, false)
	Stones.disable()
endFunction

function Fragment_6()

	self.SetObjectiveDisplayed(0, false, false)
	if !self.IsObjectiveDisplayed(10)
		self.SetObjectiveDisplayed(10, true, false)
	endIf
endFunction

function Fragment_3()

	Alias_UmbraBoss.GetActorRef().RemoveItem(ccBGSSSE016_UmbraBossWeapon as form, 1, false, none)
	self.SetObjectiveCompleted(20, true)
	self.SetObjectiveDisplayed(30, true, false)
endFunction

; Skipped compiler generated GotoState

function Fragment_7()

	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(20, true, false)
endFunction

function Fragment_2()

	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(20, true, false)
endFunction
