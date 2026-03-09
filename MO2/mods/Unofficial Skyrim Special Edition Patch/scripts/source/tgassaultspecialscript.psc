Scriptname TGAssaultSpecialScript extends Actor  

Quest Property TG05 Auto
Quest Property TGBan Auto
Faction Property ThievesGuildFaction Auto
ReferenceAlias Property TG08BMercer Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	
	;USKP 2.0.2 - Changed to check on Self. The alias is invalid before TG08B and thus would allow beating on Mercer without penalty.
	if Self.IsInFaction(ThievesGuildFaction) == 1
		if akTarget == Game.GetPlayer()
			if aeCombatState == 1
				if TGBan.IsRunning() == 0
					TGBan.Start()
				endif
			endif
		endif
	endif

endEvent