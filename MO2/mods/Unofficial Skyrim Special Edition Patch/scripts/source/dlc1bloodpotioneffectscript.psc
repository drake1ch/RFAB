Scriptname DLC1BloodPotionEffectScript extends ActiveMagicEffect  

PlayerVampireQuestScript Property PlayerVampireQuest  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;UDGP 1.1.4 added check to be sure the player is the one consuming this before changing feed status.
	if( akCaster == Game.GetPlayer() )
		PlayerVampireQuest.VampireFeed()
	EndIf
EndEvent
