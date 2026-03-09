Scriptname USKPCWCampLeadersFixNPCScript extends ReferenceAlias
{This script is attached to Tulius and Ulfric. If either dies, the civil war is over, so their commanders should be killable.}

USKPCWCampLeadersFixScript Property FixerScript Auto

Event OnDeath(Actor akKiller)
	FixerScript.FixThisShitOrElse()
	;The fixer script calls the stop command.
EndEvent
