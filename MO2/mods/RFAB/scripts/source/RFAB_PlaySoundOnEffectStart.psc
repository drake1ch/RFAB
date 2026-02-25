Scriptname RFAB_PlaySoundOnEffectStart extends ActiveMagicEffect  

Sound Property SelectedSound Auto
Actor Property TargetActor Auto
Float property Volume auto

Event OnEffectStart (Actor akTarget, Actor akCaster)
	Int soundInstance = SelectedSound.Play(TargetActor)
	sound.SetInstanceVolume(soundInstance, Volume)
	SelectedSound.Play(TargetActor)
EndEvent