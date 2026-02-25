Scriptname RFAB_OnMenuOpenClose_SetGV extends ReferenceAlias  

Bool Property TriggerWhenOpen = False Auto
Bool Property TriggerWhenClose = False Auto

String[] Property MenusNames Auto
GlobalVariable[] Property GlobalValues Auto
Int[] Property Numbers Auto
Perk[] Property Perks Auto

Event OnInit()
	Register()
EndEvent

Event OnPlayerLoadGame()
    Register()
EndEvent

Event OnMenuOpen(String menuName)
	if TriggerWhenOpen
		ChangeValue()
	endif
EndEvent

Event OnMenuClose(String menuName)
	if TriggerWhenClose
		ChangeValue()
	endif
EndEvent

Function Register()
	int i = 0 
    while i < MenusNames.Length
    	RegisterForMenu(MenusNames[i])
    	i +=1
    endwhile
EndFunction

Function ChangeValue()
	int i = 0
	while i < GlobalValues.Length
		if !Perks[i] || self.GetActorReference().HasPerk(Perks[i]) ; ≈сли перк не указан в свойстве или у алиаса он есть
			GlobalValues[i].SetValueInt(Numbers[i])
		endif
		i += 1
	endwhile
EndFunction