Scriptname RFAB_ModActorValueScript_Werewolf extends ActiveMagicEffect  

String property ActorValue auto

bool property detrimental = false auto
bool property Divided = false auto

Float Modifier

function OnEffectStart(Actor akTarget, Actor akCaster)
	Modifier = self.GetMagnitude()
	if (Divided)
		Modifier /= 100.0
	endif
	if (detrimental)
		Modifier *= -1 
	endif
	akTarget.ModActorValue(ActorValue, Modifier)
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)
	float AVMax = akTarget.GetAVMax(ActorValue)
	float AVPercent = akTarget.GetAV(ActorValue) / AVMax
	;miscutil.printconsole(akTarget.GetAV(ActorValue))
	;miscutil.printconsole(AVMax)
	;miscutil.printconsole(AVPercent)
	akTarget.RestoreAV(ActorValue, AVMax)
	akTarget.ModActorValue(ActorValue, -Modifier)
	akTarget.DamageAV(ActorValue, akTarget.GetAV(ActorValue) * (1 - AVPercent))
endFunction