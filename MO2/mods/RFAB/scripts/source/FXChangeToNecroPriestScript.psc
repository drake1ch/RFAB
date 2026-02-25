Scriptname FXChangeToNecroPriestScript extends ObjectReference  
{Changes the dunKilkreathWarlock into a necro priest on death.}

actorBase Property EncSkeletonNecroPriest auto
EffectShader Property SkeletonNecroBirthFXS auto
bool wasExecuted = false

Event OnDying(Actor akKiller)
	
	if !wasExecuted
		wasExecuted = true
		self.PlaceAtMe(EncSkeletonNecroPriest)
		SkeletonNecroBirthFXS.play(self)
	endif
EndEvent


