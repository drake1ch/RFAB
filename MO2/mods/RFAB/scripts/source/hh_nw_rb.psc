Scriptname HH_NW_RB extends Quest  
GlobalVariable Property HH_NW_KEY Auto
int blockKeyCode = 48	
Spell Property NW_SUMMON  Auto
Actor Property PlayerRef  Auto

Function InitializeMod()
								;Debug.Notification("Initialization started")
	RegisterForKey(blockKeyCode)
      RegisterForKey(1)
								;Debug.Notification("BlockKeyCode Registered")
	RegisterForControl("Right Attack/Block")
								;Debug.Notification("Right Attack/Block registered")
      setBlockKeyCode()
EndFunction

Function setBlockKeyCode()
								;Debug.Notification("setBlockKeyCode started")
	UnregisterForKey(blockKeyCode)
								;Debug.Notification("unregistered previous key")
	if HH_NW_KEY.GetValueInt() !=0
       blockKeyCode = HH_NW_KEY.GetValueInt()
	RegisterForKey(blockKeyCode)
      endif
								;Debug.Notification("registered new key")
EndFunction

Event OnKeyDown(Int KeyCode)
if KeyCode==1
setBlockKeyCode()
endif
if KeyCode == blockKeyCode&& (!Utility.IsInMenuMode())
NW_SUMMON.cast(PlayerRef, PlayerRef)
setBlockKeyCode()
endif
EndEvent