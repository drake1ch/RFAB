scriptname WitchlightActorScript extends Actor conditional
{Actor Base Object script for the Witchlight}
;======================================================================================;
;	PROPERTIES  /
;=============/
Actor property myWisp auto conditional hidden ; USKP 2.0.4 - Change to Actor. The repeated casting seems to mess things up.
keyword property wispKeyword auto
keyword property wispChild01 auto
keyword property wispChild02 auto
keyword property wispChild03 auto
spell property wispBuff01 auto
spell property wispBuff02 auto
spell property wispBuff03 auto
explosion property ExplosionIllusionLight01 auto
activator property ingredientDrop auto

;======================================================================================;
;	VARIABLES   /
;=============/
int WispChildXX
actor myEnemy
spell myBuff
spell myDrain
;======================================================================================;
;	EVENTS	    /
;=============/

EVENT onInit()
	;
; 	;debug.trace("Init block ran on "+self)
	;childSetup()
endEVENT

;=================================================================================

EVENT onCellLoad()
; 	debug.trace("Load and setup on wisp: "+self)
	myWisp = getLinkedRef(wispKeyword) as Actor
	childSetup()
	; having trouble seeing these guys path.  Try a prod on load?
	evaluatePackage()
endEVENT

;=================================================================================

EVENT OnCombatStateChanged(Actor attacker, int aeCombatState)
	if aeCombatState != 0 ; 0 means not in combat, so non-zero means we entered combat
; 		debug.trace("began combat: "+self)
		
		;USLEEP 3.0.2 Bug #19914
		if( !myWisp )
			myWisp = getLinkedRef(wispKeyword) as Actor
			childSetup()
		EndIf

		; save the attacker so we can later remove the debuff
		myEnemy = attacker
		
		if aeCombatState == 1
			;USKP 2.0.4 - Make sure the blasted thing is alive first, and also enabled.
			if( !myWisp.IsDead() && !myWisp.IsDisabled() )
				myWisp.startCombat(myEnemy)
			EndIf
		endif
	else ; if we didn't enter combat, then we obviously left combat
		; if I have a stored enemy (ie I was not one-shotted) then remove the debuff drain
		if myEnemy != NONE
			myEnemy.removeSpell(myDrain)
		endif
	endif
endEVENT

;=================================================================================

EVENT onDying(actor myKiller)
	
	; play a little explosion
	objectReference myDeathFX = placeatme(ExplosionIllusionLight01)
	myDeathFX.setScale(0.3)
	
	; drop my husk/ingredient object/whatever it ends up being.
	placeatme(ingredientDrop)
	
	if myWisp == NONE
		; quick safety check as onLoad() wasn't firing?
; 		debug.trace("MyWisp was not set properly for "+self)
; 		debug.trace("Setting myWisp to "+getLinkedRef(wispKeyword))
		myWisp = getLinkedRef(wispKeyword) as Actor
		childSetup()
	endif
	
	;send an activate to my mommy to notify her of my death
; 	debug.trace("try to activate my Wisp: "+myWisp+" ("+self+")")
	bool DidWork = myWisp.activate(self)
; 	debug.trace("Did activation pass: "+didWork)
	
	; Use booleans to check for successful spell removal
	bool BSdetector01 = FALSE
	
	if myKiller == NONE
; 		debug.trace("No killer returned onDeath of "+self)
	else
		; if we know who killed me, make my Wisp go after him/her/it
		;USKP 2.0.4 - Make sure the blasted thing is alive first.
		if( !myWisp.IsDead() )
			myWisp.startCombat(myKiller)
		EndIf
	endif
	
; 	debug.trace("Wisp Child died ("+self+")("+myWisp+")")
	BSdetector01 = myWisp.removeSpell(myBuff)
	
	if BSdetector01 == FALSE
; 			debug.trace("ERROR! Spell ("+myBuff+") not removed from ("+myWisp+") By "+self)
	endIF
	
	disable()
	delete()

endEVENT

;======================================================================================;
;	FUNCTIONS   /
;=============/

FUNCTION childSetup()
	
	if myWisp == NONE
		; quick safety check as onLoad() wasn't firing?
; 		debug.trace("MyWisp was not set properly for "+self)
; 		debug.trace("Setting myWisp to "+getLinkedRef(wispKeyword))
		myWisp = getLinkedRef(wispKeyword) as Actor
	endif

	;USKP 2.0.1 - Disable the wisp and then bail out. If one of these out there is tied to an enable parent, undo it. They're all supposed to key off of their Wisp Mothers anyway.
	if( myWisp.IsDisabled() || myWisp.IsDead() )
		Disable()
		Return
	Else
		enable()
	EndIf
	
	if myWisp.getLinkedRef(wispChild01) == self
		; I am the health orb
		myWisp.addSpell(wispBuff01)
		wispChildXX = 01
		myBuff = wispBuff01
	elseif myWisp.getLinkedRef(wispChild02) == self
		; I am the magicka orb
		myWisp.addSpell(wispBuff02)
		wispChildXX = 02
		myBuff = wispBuff02
	elseif myWisp.getLinkedRef(wispChild03) == self
		; I am the stamina orb
		myWisp.addSpell(wispBuff03)
		wispChildXX = 03
		myBuff = wispBuff03
	else
; 		debug.trace("Warning: Wisp Child problem with "+self+" and/or "+myWisp)
	endif
	
endFUNCTIOn
