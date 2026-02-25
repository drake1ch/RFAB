Scriptname WB_PillarSpawner_Simple_Script extends ObjectReference  

; ------

Activator[] Property WB_AlterationAlt_Activator_NaturalBarrier_Tree Auto

; ------

Event OnLoad()

	ObjectReference ThePillar = Self.PlaceAtMe(WB_AlterationAlt_Activator_NaturalBarrier_Tree[Utility.RandomInt(0,2)], 1, false, true)
	ThePillar.SetScale(Utility.RandomFloat(0.35, 0.45))
	ThePillar.Enable()
	Delete()

EndEvent

; ------