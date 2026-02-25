;/ Decompiled by Champollion V1.0.1
Source   : QF_MS01GuardAmbushQuest_000210CD.psc
Modified : 2024-06-25 23:32:43
Compiled : 2024-06-25 23:32:44
User     : user
Computer : WIN-2V1G9CFBKBS
/;
scriptName QF_MS01GuardAmbushQuest_000210CD extends Quest hidden

;-- Properties --------------------------------------
referencealias property Alias_Guard03 auto
referencealias property Alias_ShrineDoor auto
referencealias property Alias_ForcegreetGuard auto
faction property PlayerEnemyFaction auto
Quest property MS02 auto
objectreference property ShrineDoor auto
referencealias property Alias_Guard06 auto
Quest property MS01 auto
referencealias property Alias_EltrysDead auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_3()

	MS02.SetStage(5)
	self.Stop()
endFunction

; Skipped compiler generated GotoState

function Fragment_7()

	Alias_Guard03.GetActorReference().RemoveFromFaction(PlayerEnemyFaction)
	Alias_Guard06.GetActorReference().RemoveFromFaction(PlayerEnemyFaction)
endFunction

function Fragment_2()

	Alias_ForcegreetGuard.GetActorReference().SetPlayerResistingArrest()
	Alias_Guard03.GetActorReference().AddtoFaction(PlayerEnemyFaction)
	Alias_Guard06.GetActorReference().AddtoFaction(PlayerEnemyFaction)
endFunction

function Fragment_6()

	Alias_Guard03.GetActorReference().AddtoFaction(PlayerEnemyFaction)
	Alias_Guard06.GetActorReference().AddtoFaction(PlayerEnemyFaction)
endFunction

function Fragment_0()

	Quest __temp = self as Quest
	ms01ambushquestscript kmyQuest = __temp as ms01ambushquestscript
	Alias_Guard03.GetActorReference().Moveto(kmyQuest.GuardMarker03, 0.000000, 0.000000, 0.000000, true)
	Alias_Guard06.GetActorReference().Moveto(kmyQuest.GuardMarker06, 0.000000, 0.000000, 0.000000, true)
	Alias_ForcegreetGuard.GetActorReference().Moveto(kmyQuest.NeposMarker01, 0.000000, 0.000000, 0.000000, true)
endFunction

function Fragment_5()

	; Empty function
endFunction

; Skipped compiler generated GetState
