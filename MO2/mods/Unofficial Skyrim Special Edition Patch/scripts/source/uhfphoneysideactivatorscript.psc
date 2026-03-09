ScriptName UHFPHoneysideActivatorScript Extends Quest


ObjectReference[] WRActivator

ObjectReference Property HoneysideWRActivator01 Auto		;RefID = 00102C18
ObjectReference Property HoneysideWRActivator02 Auto		;RefID = 00102C1B
ObjectReference Property HoneysideWRActivator03 Auto		;RefID = 00102C1E
ObjectReference Property HoneysideWRActivator04 Auto		;RefID = 00102C25
ObjectReference Property HoneysideWRActivator05 Auto		;RefID = 00102C26
ObjectReference Property HoneysideWRActivator06 Auto		;RefID = 00102C27
ObjectReference Property HoneysideWRActivator07 Auto		;RefID = 00102C28

Static Property XMarker Auto

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------

State Waiting

	Event OnUpdate()

		Int i = 0

		WeaponRackActivateScript ActivatorScript


		GoToState ("Done")
		InitArray()

		While (i < 7)

			ActivatorScript = WRActivator [i] As WeaponRackActivateScript

			If (ActivatorScript.PlayersDroppedWeapon.GetBaseObject() == XMarker)
				ActivatorScript.PlayersDroppedWeapon = None
				ActivatorScript.PlacedItemInit = False
			EndIf

			i += 1

		EndWhile

	EndEvent

EndState

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------

State Done

	Event OnUpdate()
	EndEvent

EndState

;------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function InitArray()

	WRActivator = New ObjectReference [7]

	WRActivator[0] = HoneysideWRActivator01
	WRActivator[1] = HoneysideWRActivator02
	WRActivator[2] = HoneysideWRActivator03
	WRActivator[3] = HoneysideWRActivator04
	WRActivator[4] = HoneysideWRActivator05
	WRActivator[5] = HoneysideWRActivator06
	WRActivator[6] = HoneysideWRActivator07

EndFunction 