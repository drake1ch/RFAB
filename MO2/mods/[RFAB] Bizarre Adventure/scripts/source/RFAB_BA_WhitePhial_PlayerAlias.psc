Scriptname RFAB_BA_WhitePhial_PlayerAlias extends ReferenceAlias  

Quest Property MyQuest Auto

Potion Property Phial01 Auto
Potion Property Phial02 Auto
Potion Property Phial03 Auto
Potion Property Phial04 Auto
Potion Property Phial05 Auto
Potion Property Phial06 Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	if MyQuest.GetStage() != 20
		return
	endif

	if akBaseObject == Phial01 || \
	   akBaseObject == Phial02 || \
	   akBaseObject == Phial03 || \
	   akBaseObject == Phial04 || \
	   akBaseObject == Phial05 || \
	   akBaseObject == Phial06

		MyQuest.SetStage(100)

	endif

EndEvent