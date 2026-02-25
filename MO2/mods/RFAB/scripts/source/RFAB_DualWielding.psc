Scriptname RFAB_DualWielding extends Quest Conditional

Idle Property BashStart Auto
Idle Property BashRelease Auto
Idle Property BlockingStart Auto
Idle Property StopBlocking Auto

Bool Property BlockKeyPressed Auto Conditional
Actor Property Player Auto

Bool really

int _KeyBash  = 46  ; C
int _KeyBlock = 47  ; V

int Property KeyBlock
	int Function Get()
		return _KeyBlock
	EndFunction
EndProperty

int Property KeyBash
	int Function Get()
		return _KeyBash
	EndFunction
EndProperty

Event OnInit()
    Enable()
EndEvent

Function Enable()
	RegisterForKey(_KeyBlock)
	RegisterForKey(_KeyBash)
	RegisterForControl("Right Attack/Block")
	RegisterForControl("Left Attack/Block")
EndFunction

Function Disable()
	UnregisterForAllKeys()
	UnregisterForAllControls()
EndFunction

Function SetBashKey(int keyCode)
	UnregisterForKey(_KeyBash)
	_KeyBash = keyCode
	RegisterForKey(_KeyBash)
EndFunction

Function SetBlockKey(int keyCode)
	UnregisterForKey(_KeyBlock)
	_KeyBlock = keyCode
	RegisterForKey(_KeyBlock)
EndFunction

Event OnControlUp(String controlname, Float HoldTime)
	if controlname == "Left Attack/Block"
		blockkeypressed = false as Bool || Input.IsKeyPressed(_KeyBlock)
		really = false
	elseIf Input.IsKeyPressed(_KeyBlock)
		while Input.IsKeyPressed(_KeyBlock) && !Player.GetAnimationVariableBool("Isblocking")
			Player.PlayIdle(BlockingStart)
		endWhile
	endIf
EndEvent

Event OnControlDown(String controlname)
	if controlname == "Left Attack/Block"
		blockkeypressed = true
		really = true
	endIf
EndEvent

Event OnKeyUp(Int keyCode, Float HoldTime)
	BlockKeyPressed = false as Bool || really as Bool
	if keyCode == _KeyBlock
		while Player.GetAnimationVariableBool("Isblocking")
			Player.PlayIdle(StopBlocking)
		endWhile
	endIf
EndEvent

Event OnKeyDown(Int keyCode)
	BlockKeyPressed = true
	if keyCode == _KeyBlock
		while Input.IsKeyPressed(_KeyBlock) && !Player.PlayIdle(BlockingStart)
			
		endWhile
	endIf
	if keyCode == _KeyBash && !utility.IsInMenuMode()
		Player.PlayIdle(BlockingStart)
		Player.PlayIdle(bashStart)
		Player.PlayIdle(bashRelease)
	endIf
EndEvent