Scriptname ReanimateAshPile2 extends ActiveMagicEffect  

{Scripted effect for on death ash pile}

import debug

;======================================================================================;
;  PROPERTIES  /
;=============/

Keyword Property ActorTypeDaedra  Auto  

Keyword Property ActorTypeFamiliar  Auto  

Spell Property ReanimateSpell01 Auto 

Spell Property ReanimateSpell02 Auto 

Perk Property DarkSouls Auto


;======================================================================================;
;  VARIABLES   /
;=============/


actor Victim
race VictimRace
bool TargetIsImmune = False

;=============
;   FUNCTIONS /
;=============

bool function IsSummoned()
	if Victim.HasKeyword(ActorTypeFamiliar) || Victim.HasKeyword(ActorTypeDaedra)
		return true
; ;		debug.trace("ReanimateAshPile: IsSummoned True")
	else
		return false
; ;		debug.trace("ReanimateAshPile: IsSummoned False")
	endIf
endFunction


;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	victim = target
; 	debug.trace("ReanimateAshpile: victim == " + victim + ", is this right?")

	if Victim.IsCommandedActor() == True && IsSummoned() == False
		TargetIsImmune = False
	else
		TargetIsImmune = True
	endIf

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

	if TargetIsImmune == False
		While Target.IsCommandedActor()	; RRO-179 - Don't turn them to ash before the effect is really finished\
			if Caster.HasPerk(DarkSouls)
				Target.AddSpell(ReanimateSpell02)
			else
				Target.AddSpell(ReanimateSpell01)
			Utility.Wait(4.0)
			endif
		EndWhile
	endif

EndEvent