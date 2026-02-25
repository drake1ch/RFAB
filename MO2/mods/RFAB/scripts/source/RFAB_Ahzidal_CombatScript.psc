;/ Decompiled by Champollion V1.0.1
Source   : RFAB_Ahzidal_CombatScript.psc
Modified : 2023-06-17 02:21:25
Compiled : 2023-06-17 02:21:29
User     : Ilya SSD
Computer : HOME-PC
/;
scriptName RFAB_Ahzidal_CombatScript extends ObjectReference

;-- Properties --------------------------------------
ObjectReference property Sol auto
soulgem property SoulGemForTrigger auto
actor property AhzidalREF auto
Int property delay = 30 auto
explosion property sol_explosion auto
Float property damage_sol = 100.000 auto
ObjectReference property AhzidalStartMarker auto

;-- Variables ---------------------------------------
Bool isdead = false

;-- Functions ---------------------------------------

function OnActivate(ObjectReference akActionRef)

	if !isdead
		while AhzidalREF.GetItemCount(SoulGemForTrigger as form) == 0
			utility.wait(1/RFAB_PapyrusFunctions.GetMagicSlowdown())
		endWhile
		actor Player = game.GetPlayer()
		Sol.Enable(true)
		Int i = 0
		while i < delay && Sol.IsEnabled()
			RFAB_PapyrusFunctions.ScriptDamage(player, AhzidalREF, damage_sol, "firepure", false)
			Player.DamageActorValue("health", damage_sol * (100 as Float - Player.GetActorvalue("FireResist")) / 100 as Float)
			utility.wait(1 as Float)
			i += 1
		endWhile
		if Sol.IsEnabled()
			Sol.Placeatme(sol_explosion as form, 1, false, false)
			Player.Kill(none)
			Sol.disable(false)
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

function OnDying(actor akKiller)

	Sol.disable(false)
	isdead = true
endFunction

; Skipped compiler generated GetState
