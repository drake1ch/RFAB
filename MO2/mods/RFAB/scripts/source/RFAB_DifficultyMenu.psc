Scriptname RFAB_DifficultyMenu extends Quest  

float[] Property DamageToPlayer Auto Hidden 
{ Урон получаемый игроком }
float[] Property DamageByPlayer Auto Hidden 
{ Урон наносимый игроком }
float Property DamageWithCurse Auto Hidden 
{ Урон наносимый проклятым игроком }

string[] Property DifficultyNames Auto Hidden
string[] Property DifficultyInfo Auto Hidden

bool Property Cursed = false Auto Hidden
int Property DifficultyIndex Auto Hidden

string SkyUIConfigPath = "Data/Interface/skyui/config.txt"

Event OnInit()
	DamageToPlayer = new float[3]
	DamageToPlayer[0] = 50.0 * 0.01
	DamageToPlayer[1] = 100.0 * 0.01
	DamageToPlayer[2] = 200.0 * 0.01
	DamageByPlayer = new float[3]
	DamageByPlayer[0] = 200.0 * 0.01
	DamageByPlayer[1] = 100.0 * 0.01
	DamageByPlayer[2] = 100.0 * 0.01
	DamageWithCurse = 50.0 * 0.01
EndEvent

Function UpdateDifficulty()
	float _damageByPlayer

	if Cursed
		_damageByPlayer = DamageWithCurse
		Game.SetGameSettingfloat("fDiffMultHPByPCL", DamageWithCurse)
	else
		_damageByPlayer = DamageByPlayer[DifficultyIndex]
		Game.SetGameSettingfloat("fDiffMultHPByPCL", DamageByPlayer[DifficultyIndex])
	endIf

	Game.SetGameSettingFloat("fDiffMultHPByPCVE", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCE", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCN", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCH", _damageByPlayer)
	Game.SetGameSettingFloat("fDiffMultHPByPCVH", _damageByPlayer)

	Game.SetGameSettingFloat("fDiffMultHPToPCL", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCVE", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCE", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCN", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCH", DamageToPlayer[DifficultyIndex])
	Game.SetGameSettingFloat("fDiffMultHPToPCVH", DamageToPlayer[DifficultyIndex])
EndFunction

Function SetDifficulty(int aiIndex)
	DifficultyIndex = aiIndex
	UpdateDifficulty()
EndFunction

Function SetCurse(bool abCursed)
	Cursed = abCursed
	UpdateDifficulty()
EndFunction

Function Open()
	DifficultyIndex = GetMenuIndex()
	UpdateDifficulty()
EndFunction

int Function GetMenuIndex()
	if ui.IsMenuOpen("CustomMenu")
		ui.CloseCustomMenu()
		return -1
	else
		String InitParams = PapyrusIniManipulator.PullStringFromIni(SkyUIConfigPath, "Appearance", "colors.text.enabled")
		ui.OpenCustomMenu("RFAB_DifficultyMenu", 0)
		ui.InvokeString("CustomMenu", "_root.RFAB_MessageBoxMC.InitMessageBox", InitParams)
		ui.Invoke("CustomMenu", "_root.RFAB_MessageBoxMC.SetButtons")
		return DifficultyMenuResult()
	endIf
EndFunction

int function DifficultyMenuResult()
	while ui.IsMenuOpen("CustomMenu") && ui.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") < 9
		Utility.Wait(0.2)
	endWhile
	if ui.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.Status") == 9
		Int result = ui.GetInt("CustomMenu", "_root.RFAB_MessageBoxMC.akCurrentFocusIndex")
		Cursed = ui.GetBool("CustomMenu", "_root.RFAB_MessageBoxMC.Cursed")
		ui.CloseCustomMenu()
		return result
	else
		ui.CloseCustomMenu()
		return -1
	endIf
EndFunction
