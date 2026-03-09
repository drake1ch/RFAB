ScriptName defaultSetAVonActivate extends Actor
{Default script that lives on an actor. When activated, its actor value (property) gets set to a value (property)}

import game
import debug

;USKP 2.0.1 - So if there's supposed to be defaults, it's usually helpful to attach them!
string property sActorVariable = "Variable01" auto
{By default, this property is set to Variable01. Set which actor variable to set as a string}

float property fActorVariable = 1.0 auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

bool property doOnce = True auto
{By default, this fires only once}

auto State waiting
	Event onActivate(ObjectReference triggerRef)
		self.setAV(sActorVariable, fACtorVariable)
		self.evaluatePackage()
		if (doOnce == true)
			gotoState ("allDone")
		else
			gotoState ("waiting")
		endif
		
		
	endEvent	
endState

State allDone
	;do nothing
endState
	