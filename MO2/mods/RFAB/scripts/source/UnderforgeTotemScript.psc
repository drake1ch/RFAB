Scriptname UnderforgeTotemScript extends ObjectReference  

Shout Property Howl auto
WordOfPower Property HowlWord1 auto
WordOfPower Property HowlWord2 auto
WordOfPower Property HowlWord3 auto

VisualEffect Property Effect01 auto
VisualEffect Property Effect02 auto

Spell Property SpellToAdd1 auto
Spell Property SpellToRemove1 auto
Spell Property SpellToRemove2 auto

CompanionsHousekeepingScript Property chs auto

Perk Property TotemPerk Auto

Event OnActivate(ObjectReference akActivator)
	Actor kActivator = akActivator as Actor

	if (kActivator == Game.GetPlayer() && kActivator.HasPerk(TotemPerk))
		int iButton = SkyMessage.Show( \
			GetDescription(GetDisplayName()), \
			"Получить благословение", \
			"Ничего не делать", \
			getIndex = true) as int

		if (iButton == 0)
			Effect01.Play(self, 2.0, kActivator)
			Effect02.Play(kActivator, 2.0, self)
			chs.CurrentHowl = Howl
			chs.CurrentHowlWord1 = HowlWord1
			chs.CurrentHowlWord2 = HowlWord2
			chs.CurrentHowlWord3 = HowlWord3

			kActivator.RemoveSpell(SpellToRemove1)
			kActivator.RemoveSpell(SpellToRemove2)
			kActivator.AddSpell(SpellToAdd1, true)
		endif
	endif
EndEvent

; ///

string Function GetDescription(string asTotemName)
	return ReplaceEnters(GetText(asTotemName, "Immersive Text") + "\n\n" + GetText(asTotemName, "Bonus Text"))
EndFunction

string Function GetText(string asTotemName, string asKey)
	return PapyrusIniManipulator.PullStringFromIni("Data/SKSE/Plugins/[RFAB] Werewolf.ini", asTotemName, asKey)
EndFunction

string Function ReplaceEnters(string asString)
	return PapyrusUtil.StringJoin(StringUtil.Split(asString, "|"), "\n") 
EndFunction
