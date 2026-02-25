Scriptname RFAB_BA_XP extends Quest  

RFAB_XP_Handler Property SystemXP Auto

string PATH_ICONS = "skyui/icons_item_psychosteve.swf"
int ICON_QUEST = 58

UILIB_1 HUD

Event OnInit()
    HUD = (self as Form) as UILIB_1
EndEvent

Function RewardForQuest(int aiCountXP)
	CustomReward("Задание выполнено", aiCountXP)
EndFunction

Function RewardForLocation(int aiCountXP)
	CustomReward("Локация пройдена", aiCountXP)
EndFunction

Function CustomReward(string asText, int aiCountXP)
	int iGainedXP = SystemXP.CalculateXP(aiCountXP)
	SystemXP.ModXP(iGainedXP)
	string sColor = JSONUtil.GetStringValue("RFAB_XP_Settings.json", "Notification color", "")
	string sMessage = asText + ": " + iGainedXP + " XP"
	HUD.ShowNotificationIcon(sMessage, PATH_ICONS, ICON_QUEST, sColor)
EndFunction