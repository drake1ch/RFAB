Scriptname DLC1WEDB02AliasScript01 extends ReferenceAlias Hidden 
{For werewolf so the quest stops when he's unloaded, or dead.}
;UDGP 2.0.1 - Disabled both statements. Neither one is necessary and can somehow be called after the quest ends, resulting in errors.

Event OnDeath(Actor akKiller)
	;GetOwningQuest().SetStage(255)
endEvent

Event OnCellDetach()
	;GetOwningQuest().SetStage(255)
endEvent