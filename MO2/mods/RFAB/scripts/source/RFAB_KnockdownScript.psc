Scriptname RFAB_KnockdownScript extends ActiveMagicEffect

int Property Force Auto
int Property RequiredResist = 100 Auto
string Property ResistAV Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int iResist = akTarget.GetActorValue(ResistAV) as Int

	if iResist < RequiredResist
		akCaster.PushActorAway(akTarget, Force)
	endif
endevent