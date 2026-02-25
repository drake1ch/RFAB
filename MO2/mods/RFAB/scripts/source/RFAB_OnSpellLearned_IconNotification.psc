Scriptname RFAB_OnSpellLearned_IconNotification extends ReferenceAlias  

import PO3_Events_Alias

Sound Property UISpellLearned Auto

string IconPath = "skyui/icons_category_psychosteve.swf"
int Alteration  = 14
int Illusion = 15
int Destruction = 16
int Conjuration = 17
int Restoration = 18

Actor Player
UILIB_1 UILIB

Event OnInit()
	Player = Game.GetPlayer()
	UILIB = (GetOwningQuest() as Form) as UILIB_1
     RegisterForSpellLearned(self as Alias)
EndEvent

Event OnPlayerLoadGame()
     RegisterForSpellLearned(self as Alias)
EndEvent

Event OnSpellLearned(Spell akSpell)
	string MagicSchool = akSpell.GetNthEffectMagicEffect(0).GetAssociatedSkill()
	string SpellName = akSpell.GetName() 

	if MagicSchool == "Alteration"
		ShowMessageIcon(Alteration, SpellName)
	elseif MagicSchool == "Illusion"
		ShowMessageIcon(Illusion, SpellName)
	elseif MagicSchool == "Destruction"
		ShowMessageIcon(Destruction, SpellName)
	elseif MagicSchool == "Conjuration"
		ShowMessageIcon(Conjuration, SpellName)
	elseif MagicSchool == "Restoration"
		ShowMessageIcon(Restoration, SpellName)
	endif
EndEvent

Function ShowMessageIcon(int aiIconFrame, string asSpellName)
	UISpellLearned.Play(Player)
	UILIB.ShowNotificationIcon(" Изучено заклинание - " + asSpellName, IconPath, aiIconFrame)
EndFunction