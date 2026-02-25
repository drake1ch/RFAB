;/ Decompiled by Champollion V1.0.1
Source   : RFAB_NPC_HevnoraakScript.psc
Modified : 2022-09-17 00:11:27
Compiled : 2022-09-17 00:11:32
User     : Ilya
Computer : HOME-PC
/;
scriptName RFAB_NPC_HevnoraakScript extends ObjectReference

;-- Properties --------------------------------------
spell property HevnoraakSlaveSummonSpell auto
spell property TripleNovaShout auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnSpellCast(Form akSpell)

	spell spellCast = akSpell as spell
	if spellCast == TripleNovaShout
		utility.wait(1.50000)
		TripleNovaShout.Cast(self as ObjectReference, none)
		utility.wait(1.50000)
		TripleNovaShout.Cast(self as ObjectReference, none)
		SummonSlaves()
	endIf
	
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function SummonSlaves()
	Int i = 0
	while i < 5
		utility.wait(2 as Float)
		HevnoraakSlaveSummonSpell.Cast(self as ObjectReference, none)
		i += 1
	endWhile
endFunction
