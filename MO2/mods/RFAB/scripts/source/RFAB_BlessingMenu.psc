Scriptname RFAB_BlessingMenu extends Quest  

Actor Property Player Auto

Spell[] Property Blessings Auto

int[] BlockedBlessings

string IniPath = "Data/SKSE/Plugins/[RFAB] Blessings.ini"

Event OnInit()
    BlockedBlessings = Utility.CreateIntArray(Blessings.Length)
EndEvent

Function ChangeBlessing(Spell akNewBlessing)
	RemoveBlessings()
	Player.AddSpell(akNewBlessing, false)
EndFunction

Function RemoveBlessings()
	int i = 0
	while (i < Blessings.Length)
		Player.RemoveSpell(Blessings[i])
		i += 1
	endwhile
EndFunction

Function BlockBlessings(Spell[] akBlessings)
	if (akBlessings.Length > 0)
		int i = 0
		while (i < akBlessings.Length)
			int iIndex = Blessings.Find(akBlessings[i])	
			BlockedBlessings[iIndex] = BlockedBlessings[iIndex] + 1
			i += 1
		endwhile
	else
		int i = 0		
		while (i < BlockedBlessings.Length)
			BlockedBlessings[i] = BlockedBlessings[i] + 1
			i += 1
		endwhile
	endif
EndFunction

Function UnblockBlessings(Spell[] akBlessings)
	if (akBlessings.Length > 0)
		int i = 0
		while (i < akBlessings.Length)
			int iIndex = Blessings.Find(akBlessings[i])	
			BlockedBlessings[iIndex] = BlockedBlessings[iIndex] - 1
			i += 1
		endwhile
	else
		int i = 0	
		while (i < BlockedBlessings.Length)
			BlockedBlessings[i] = BlockedBlessings[i] - 1
			i += 1
		endwhile
	endif
EndFunction

bool Function IsBlocked(Spell akBlessing)
	int iIndex = Blessings.Find(akBlessing)
	return BlockedBlessings[iIndex] > 0
EndFunction

; ///

string Function GetDescription(string asGodName)
	return ReplaceEnters(GetText(asGodName, "Immersive Text") + "\n\n" + GetText(asGodName, "Bonus Text"))
EndFunction

string Function GetText(string asGodName, string asKey)
	return PapyrusIniManipulator.PullStringFromIni(IniPath, asGodName, asKey)
EndFunction

string Function ReplaceEnters(string asString)
	return PapyrusUtil.StringJoin(StringUtil.Split(asString, "|"), "\n") 
EndFunction