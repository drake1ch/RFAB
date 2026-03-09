Scriptname MGBridgePlayerQuest extends ReferenceAlias  


Event OnSpellCast(Form akSpell)
; 	debug.trace(self + ": player cast " + akSpell)
	if( MG01.WaitingForShout == 1 ) ;This should only be checked if the player has been asked to shout by Faralda or Nirya at the College - USKP 1.2.1
		Spell castSpell = akSpell as Spell
		if castSpell && castSpell == ForcePushSpell1
			GetOwningQuest().SetStage(5)
		endif

		if castSpell && castspell == ForcePushSpell2
			GetOwningQuest().SetStage(5)
		endif
	
		if castSpell && castSpell == ForcePushSpell3
			GetOwningQuest().SetStage(5)
		endif
	EndIf
endevent

spell Property ForcePushSpell1  Auto  

spell Property ForcePushSpell2  Auto  

spell Property ForcePushSpell3  Auto  

MG01QuestScript Property MG01 Auto
