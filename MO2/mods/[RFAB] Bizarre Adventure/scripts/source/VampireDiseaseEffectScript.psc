Scriptname VampireDiseaseEffectScript extends ActiveMagicEffect  

Event OnUpdate()

	;Make sure the player is out of combat, then trigger change
	If Game.GetPlayer().GetCombatState() == 0 && Game.IsMovementControlsEnabled() && Game.IsFightingControlsEnabled()
		VampireSleepMessage.Show()
; 		Debug.Trace(self + "Player not in combat, and controls are enabled. Trigger Vampire change")
		PlayerVampireQuest.VampireChange(Game.GetPlayer())
		BloodBarrel.Enable(true)			;Добавлено в RFAB Bizarre Adventure
		CoffinVampBizzare.Enable(true)
		Grishnak_PlayerIsVampire.SetValue(0)
		RFAB_PapyrusFunctions.UpdateVendors()
	Else
		RegisterForSingleUpdate(1)
	EndIf

EndEvent

;Event OnUpdateGameTime()
;
;	If GameHour.GetValueInt() == 5
;		VampireSunriseMessage.Show()		
;		;int instanceID = IntroSoundFX.play((Game.GetPlayer()))          ; play IntroSoundFX sound from my self
;		VampireTransformDecreaseISMD.applyCrossFade(2.0)
;		utility.wait(2.0)
;		imageSpaceModifier.removeCrossFade()
;	EndIf
;	
;	If GameHour.GetValueInt() == 19
;		VampireSunsetMessage.Show()
;		;int instanceID = IntroSoundFX.play((Game.GetPlayer()))          ; play IntroSoundFX sound from my self
;		VampireTransformIncreaseISMD.applyCrossFade(2.0)
;		utility.wait(2.0)
;		imageSpaceModifier.removeCrossFade()
;	EndIf

;	If GameDaysPassed.Value >= GrishnakVendorChangeTimer         ;Äîáàâëåíî â RFAB Bizarre Adventure
;		Grishnak_PlayerIsVampire.SetValue(0)
;	endif
			

;	If GameDaysPassed.Value >= VampireChangeTimer
;		UnRegisterForUpdateGameTime()
;		RegisterForSingleUpdate(10)
;	EndIf
;EndEvent


;Event OnEffectStart(Actor Target, Actor Caster)
;
;	;Player has three days before he becomes a Vampire	
;	If Target == Game.GetPlayer()
;		RegisterForUpdateGameTime(1)
;;		GrishnakVendorChangeTimer = GameDaysPassed.Value + 2       ;Äîáàâëåíî â RFAB Bizarre Adventure
;		VampireChangeTimer = GameDaysPassed.Value + 3
;	EndIf
;
;EndEvent


Event OnEffectStart(Actor Target, Actor Caster)
	RegisterForSingleUpdate(1)
endevent

Message Property VampireSunriseMessage Auto

Message Property VampireSunsetMessage Auto

Message Property VampireSleepMessage Auto

ImageSpaceModifier Property AbsorbRedImod  Auto  

Sound Property IntroSoundFX  Auto  

Sound Property OutroSoundFX  Auto  

Message Property VampireDiseaseMessage Auto

Float Property VampireChangeTimer Auto

GlobalVariable Property Gamehour Auto

GlobalVariable Property GameDaysPassed Auto

Perk Property VampireFeed Auto

PlayerVampireQuestScript Property PlayerVampireQuest Auto

imageSpaceModifier Property VampireTransformIncreaseISMD  Auto
imageSpaceModifier Property VampireTransformDecreaseISMD  Auto 

;Äîáàâëåíî â RFAB Bizarre Adventure
GlobalVariable Property Grishnak_PlayerIsVampire Auto
Float Property GrishnakVendorChangeTimer Auto
ObjectReference Property BloodBarrel Auto
Actor Property GrishnakActor  Auto  
ObjectReference Property CoffinVampBizzare  Auto  
