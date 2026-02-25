Scriptname RFAB_CarriagesTravel extends Quest  


event OnInit()
	RegisterForModEvent("RFAB_CarriageTravel", "OnAcceptTravel") 
	RegisterForModEvent("RFAB_CarriageNotEnoughMoney", "OnNotEnoughMoneyTravel") 
	RegisterForModEvent("RFAB_CancelTravel", "OnCancelTravel") 
endevent

Function CommentLoop(int destinationID) 
	sayComments = true
	KmodCarriageDestination.SetValue(DestinationValues[destinationID])
	RegisterForSingleUpdate(3)
endfunction

Event OnUpdate()
	if sayComments
		CurrentDriver.Say(KmodFastTravelCarriageComment)
		RegisterForSingleUpdate(15)
	endif
endevent

Event OnAcceptTravel(string eventName, string strArg, float numArg, Form sender)
	
	
	int i = 0
	string[] arguments = StringUtil.split(strArg,"|")
	string destination = arguments[0]
	int price = arguments[1] as int
	while i < MarkersNames.length
		if (MarkersNames[i] == destination) 
			sayComments = false
			CurrentDriver.disable()
			CurrentDriver.enable()
			utility.wait(0.1)
			CurrentDriver.say(CarriageConfirmTopic)
			CurrentDriver.say(CarriageConfirmTopic)
			Game.GetPlayer().RemoveItem(gold001,price)
			
			UI.CloseCustomMenu()
			
			fadeToBlack.ApplyCrossFade(3)
			utility.wait(3.1)
			Game.FastTravel(Markers[i])
			fadeToBlack.Remove()
			Game.EnablePlayerControls()

			if (ArrivalTopics[i] && Utility.RandomFloat(0, 10) > 5)
				Drivers[i].say(ArrivalTopics[i])
			else
				KmodCarriageDestination.SetValue(DestinationValues[i])
				Drivers[i].say(KmodFastTravelCarriageComment)
			endif
				
			i = MarkersNames.length
		endif
		i = i + 1
	endwhile

endevent

Event OnNotEnoughMoneyTravel(string eventName, string strArg, float numArg, Form sender)

	CurrentDriver.disable()
	CurrentDriver.enable()

	utility.wait(0.1)
	CurrentDriver.say(CarriageNotEnoughMoneyTopic)
	
	CurrentDriver.say(CarriageNotEnoughMoneyTopic)
endevent

Event OnCancelTravel(string eventName, string strArg, float numArg, Form sender)

	Game.EnablePlayerControls()
	if Utility.RandomFloat(0, 10) > 2
		CurrentDriver.say(CarriageCancelTopic)

	else
		CurrentDriver.Say(KmodFastTravelCarriageComment)

	endif

	UI.CloseCustomMenu()
	sayComments = false
endevent

actor[] Property Drivers  Auto  

ObjectReference[] Property Markers  Auto  

String[] Property MarkersNames  Auto  

string Property costMultiplier = "0.5" Auto
MiscObject property gold001 auto
ImageSpaceModifier property fadeToBlack auto
Topic property CarriageConfirmTopic auto
Topic property CarriageNotEnoughMoneyTopic auto
Topic property CarriageCancelTopic auto
actor property CurrentDriver auto
Topic[] property ArrivalTopics auto
Topic property KmodFastTravelCarriageComment auto
bool property sayComments = true auto
globalvariable property KmodCarriageDestination auto
int[] property DestinationValues auto