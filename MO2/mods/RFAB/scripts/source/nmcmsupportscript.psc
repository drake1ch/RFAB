Scriptname nMCMSupportScript extends SKI_ConfigBase

GlobalVariable Property DDBreathValue  Auto 
GlobalVariable Property DDMeleeValue  Auto
GlobalVariable Property DDAttValue  Auto
GlobalVariable Property DDArmorValue  Auto
GlobalVariable Property DDResValue  Auto
GlobalVariable Property DEventsTimer  Auto
GlobalVariable Property DEventsRnd  Auto
GlobalVariable Property DEventsType1  Auto
GlobalVariable Property DEventsType2  Auto
GlobalVariable Property DEventsType3  Auto
GlobalVariable Property DEventsType4  Auto
GlobalVariable Property DEventsUncapper  Auto
GlobalVariable Property DEventsSZ  Auto
GlobalVariable Property DNSDisable  Auto
GlobalVariable Property DKnockdownEnabled  Auto
GlobalVariable Property DStagger  Auto
GlobalVariable Property isPermanent  Auto
GlobalVariable Property fCellSettings  Auto
GlobalVariable Property fDBSettings  Auto
GlobalVariable Property fDSSettings  Auto
GlobalVariable Property iESSEnabled Auto
GlobalVariable Property nCS  Auto
Quest Property nConfigQST  Auto  
Quest Property nEventsQST  Auto 
Quest Property nAssaultQST00  Auto 

bool szVal = true
bool unVal = false
bool sdVal = true
bool twdVal = false
bool thdVal = false
bool waVal = false
bool extraVal = true
bool knockVal = true
bool staggerVal = true
bool essVal = true
bool storeVal = true
bool startAssaultTimerRequested = false

; OIDs
int difficultyOID_M ; _M for menu
int breathOID_M ; _M for menu
int csOID_M
int resistOID_S
int attOID_S ; _S for slider
int meleeOID_S ; _S for slider
int armorOID_S ; _S for slider
int timerOID_S
int randOID_S
int SZ_B
int un_B
int sd_B
int twd_B
int thd_B
int wa_B
int extra_B
int knock_B
int stagger_B
int store_B
int ess_b
int dsouls_b
int dsoulsinfo_b
int converter_s
int iSouls
int dbweight_s
int dsweight_s

float _cellreset=0.0
float def_att=150.0
float def_melee=150.0
float def_armor=500.0
float def_res=50.0
float def_timer=0.0
float def_rand=0.0
float def_conv=5.0
float def_db=10.0
float def_ds=5.0

string[] difficultyList
string[] breathList
string[] csList

int difficultyIndex = 2
int breathIndex = 6
int csIndex = 1

int function GetVersion()
	return 3
endFunction

event OnConfigInit()

	;parent.OnInit()
	nEventsQST.stop()
	nConfigQST.stop()
	Pages = new string[3]
	Pages[0] = "$Dragons"
	Pages[1] = "$Assault"
	Pages[2] = "$Misc"

	difficultyList = new string[3]
	difficultyList[0] = "$Vanilla"
	difficultyList[1] = "$Hard"
	difficultyList[2] = "$Insane"

	csList = new string[3]
	csList[0] = "$No landing"
	csList[1] = "$Default"
	csList[2] = "$Less flying"

	breathList = new string[13]
	breathList[0] = "+0%"
	breathList[1] = "+25%"
	breathList[2] = "+50%"
	breathList[3] = "+75%"
	breathList[4] = "+100%"
	breathList[5] = "+125%"
	breathList[6] = "+150%"
	breathList[7] = "+175%"
	breathList[8] = "+200%"
	breathList[9] = "+225%"
	breathList[10] = "+250%"
	breathList[11] = "+275%"
	breathList[12] = "+300%"
	LoadPreset()
endEvent

event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}

	; Version 2 specific updating code
if (a_version >= 2 && CurrentVersion < 2)
	Debug.Trace(self + ": Updating script to version 2")
	breathList = new string[13]
	breathList[0] = "+0%"
	breathList[1] = "+25%"
	breathList[2] = "+50%"
	breathList[3] = "+75%"
	breathList[4] = "+100%"
	breathList[5] = "+125%"
	breathList[6] = "+150%"
	breathList[7] = "+175%"
	breathList[8] = "+200%"
	breathList[9] = "+225%"
	breathList[10] = "+250%"
	breathList[11] = "+275%"
	breathList[12] = "+300%"
endif
if (a_version >= 3 && CurrentVersion < 3)
	Debug.Trace(self + ": Updating script to version 3")
	Pages = new string[3]
	Pages[0] = "$Dragons"
	Pages[1] = "$Assault"
	Pages[2] = "$Misc"

	difficultyList = new string[3]
	difficultyList[0] = "$Vanilla"
	difficultyList[1] = "$Hard"
	difficultyList[2] = "$Insane"

	csList = new string[3]
	csList[0] = "$No landing"
	csList[1] = "$Default"
	csList[2] = "$Less flying"
endIf
endEvent

event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

	; Load custom logo in DDS format
	if (a_page == "")
		; Image size 256x256
		; X offset = 376 - (height / 2) = 126
		; Y offset = 223 - (width / 2) = 23
		LoadCustomContent("deadlydragons/ddlogo.dds", 165, -20)
		return
	else
		UnloadCustomContent()
	endIf

	if (a_page == "$Dragons")

		SetCursorFillMode(TOP_TO_BOTTOM)
		SetTitleText("$Dragons settings")
		AddHeaderOption("$Custom Settings", 0)
		attOID_S = AddSliderOption("$Attributes", def_att, "+{0}%", 0)
		meleeOID_S = AddSliderOption("$Melee damage", def_melee, "+{0}%", 0)
		armorOID_S = AddSliderOption("$Armor rating", def_armor, "+{0}", 0)
		resistOID_S = AddSliderOption("$Magic resist", def_res, "+{0}", 0)
		breathOID_M = AddMenuOption("$Magic damage", breathList[breathIndex], 0)
		SetCursorPosition(1)
		;AddEmptyOption()
		AddHeaderOption("$Presets", 0)
		difficultyOID_M = AddMenuOption("$Difficulty", difficultyList[difficultyIndex], 0)
		AddHeaderOption("$Special", 0)
		stagger_B = AddToggleOption("$Stagger", staggerVal, 0)
		extra_B = AddToggleOption("$Special skills", extraVal, 0)
		knock_B = AddToggleOption("$Knockdown", knockVal, 0)
		csOID_M = AddMenuOption("$Combat behaviour", csList[csIndex], 0)

	elseIf (a_page == "$Assault")

		SetCursorFillMode(TOP_TO_BOTTOM)
		SetTitleText("$Assault Settings")
		AddHeaderOption("$Timer Settings", 0)
		timerOID_S = AddSliderOption("$Timer", def_timer, "${0} hour(s)", 0)
		randOID_S = AddSliderOption("$Randomizer", def_rand, "${0} hour(s)", 0)
		AddEmptyOption()
		AddHeaderOption("$Other Settings", 0)
		sz_B = AddToggleOption("$Safe zones", szVal, 0)
		un_B = AddToggleOption("$Unleveler", unVal, 0)
		SetCursorPosition(1)
		AddHeaderOption("$Assault type", 0)
		sd_B = AddToggleOption("$Single dragon", sdVal, 0)
		twd_B = AddToggleOption("$Two dragons", twdVal, 0)
		thd_B = AddToggleOption("$Three dragons", thdVal, 0)
		wa_B = AddToggleOption("$Weather effect", waVal, 0)

	elseIf (a_page == "$Misc")

		SetCursorFillMode(TOP_TO_BOTTOM)
		SetTitleText("$Misc Settings")
		AddHeaderOption("$NPCs", 0)
		ess_b = AddToggleOption("$Important NPCs are essential", essVal, 0)
		SetCursorPosition(1)
		AddHeaderOption("$Weight", 0)
		fDBSettings.Value = Game.getForm(0x003ADA4).GetWeight()
		fDSSettings.Value = Game.getForm(0x003ADA3).GetWeight()
		def_db = fDBSettings.Value
		def_ds = fDSSettings.Value
		dbweight_S = AddSliderOption("$Dragon Bone", def_db, "{0}", 0)
		dsweight_S = AddSliderOption("$Dragon Scale", def_ds, "{0}", 0)
		AddHeaderOption("$Store settings", 0)
		store_B = AddToggleOption("$Store settings", storeVal, 0)
	endIf
endEvent

event OnOptionSelect(int option)
	if (option == sz_B)
		szVal = !szVal
		SetToggleOptionValue(SZ_B, sZVal, 0)
		If szVal
			DEventsSZ.Value = 1
		Else
			DEventsSZ.Value = 0
		Endif
	elseif (option == un_B)
		unVal = !unVal
		SetToggleOptionValue(un_B, unVal, 0)
		If unVal
			DEventsUncapper.Value = 1
		Else
			DEventsUncapper.Value = 0
		Endif
	elseif (option == sd_B)
		sdVal = !sdVal
		SetToggleOptionValue(sd_B, sdVal, 0)
		If sdVal
			DEventsType1.Value = 1
		Else
			DEventsType1.Value = 0
		Endif
	elseif (option == twd_B)
		twdVal = !twdVal
		SetToggleOptionValue(twd_B, twdVal, 0)
		If twdVal
			DEventsType2.Value = 1
		Else
			DEventsType2.Value = 0
		Endif
	elseif (option == thd_B)
		thdVal = !thdVal
		SetToggleOptionValue(thd_B, thdVal, 0)
		If thdVal
			DEventsType3.Value = 1
		Else
			DEventsType3.Value = 0
		Endif
	elseif (option == wa_B)
		waVal = !waVal
		SetToggleOptionValue(wa_B, waVal, 0)
		If waVal
			DEventsType4.Value = 1
		Else
			DEventsType4.Value = 0
		Endif
	elseif (option == extra_B)
		extraVal = !extraVal
		SetToggleOptionValue(extra_B, extraVal, 0)
		If extraVal
			DNSDisable.Value = 0
		Else
			DNSDisable.Value = 1
		Endif
	elseif (option == knock_B)
		knockVal = !knockVal
		SetToggleOptionValue(knock_B, knockVal, 0)
		If knockVal
			DKnockdownEnabled.Value = 1
		Else
			DKnockdownEnabled.Value = 0
		Endif
	elseif (option == stagger_B)
		staggerVal = !staggerVal
		SetToggleOptionValue(stagger_B, staggerVal, 0)
		If staggerVal
			DStagger.Value = 1
		Else
			DStagger.Value = 0
		Endif
	elseif (option == ess_b)
		essVal = !essVal
		SetToggleOptionValue(ess_B, essVal, 0)
		ToggleProtection()
	elseif (option == dsouls_b)
		iSouls = (game.getplayer().GetAV("DragonSouls")) as int
		if iSouls >= def_conv
			game.getplayer().ModAV("DragonSouls", -def_conv)
			game.addperkpoints(1)
			iSouls = (game.getplayer().GetAV("DragonSouls")) as int
		endif
		SetTextOptionValue(dsoulsinfo_B, iSouls, 0)
	elseif (option == store_B)
		storeVal = !storeVal
		SetToggleOptionValue(store_B, storeVal, 0)
		If storeVal
			isPermanent.Value = 1
		Else
			isPermanent.Value = 0
		Endif
	endIf
endEvent

event OnOptionSliderOpen(int option)
	if (option == attOID_S)
		SetSliderDialogStartValue(def_att)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)
	elseif (option == meleeOID_S)
		SetSliderDialogStartValue(def_melee)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)
	elseif (option == armorOID_S)
		SetSliderDialogStartValue(def_armor)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)
	elseif (option == resistOID_S)
		SetSliderDialogStartValue(def_res)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 95.0)
		SetSliderDialogInterval(1.0)
	elseif (option == timerOID_S)
		SetSliderDialogStartValue(def_timer)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 336.0)
		SetSliderDialogInterval(1.0)
		nAssaultQst00.stop()
	elseif (option == randOID_S)
		SetSliderDialogStartValue(def_rand)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 128.0)
		SetSliderDialogInterval(1.0)
	elseif (option == converter_S)
		SetSliderDialogStartValue(def_conv)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(2.0, 25.0)
		SetSliderDialogInterval(1.0)
	elseif (option == dbweight_S)
		SetSliderDialogStartValue(def_db)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(1.0)
	elseif (option == dsweight_S)
		SetSliderDialogStartValue(def_ds)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(1.0)
	endIf
endEvent

event OnOptionSliderAccept(int option, float value)
	if (option == attOID_S)
		def_att = value
		SetSliderOptionValue(attOID_S, def_att, "+{0}%", 0)
		DDAttValue.Value = def_att
	elseif (option == meleeOID_S)
		def_melee = value
		SetSliderOptionValue(meleeOID_S, def_melee, "+{0}%", 0)
		DDmeleeValue.Value = def_melee
	elseif (option == armorOID_S)
		def_armor = value
		SetSliderOptionValue(armorOID_S, def_armor, "+{0}", 0)
		DDarmorValue.Value = def_armor
	elseif (option == resistOID_S)
		def_res = value
		SetSliderOptionValue(resistOID_S, def_res, "+{0}%", 0)
		DDresValue.Value = def_res
	elseif (option == timerOID_S)
		def_timer = value
		SetSliderOptionValue(timerOID_S, def_timer, "${0} hour(s)", 0)
		DEventsTimer.Value = def_timer
		RegisterForModEvent("DD_StartAssaultTimer", "OnStartAssaultTimer")
		SendModEvent("DD_StartAssaultTimer")
	elseif (option == randOID_S)
		def_rand = value
		SetSliderOptionValue(randOID_S, def_rand, "${0} hour(s)", 0)
		DEventsrnd.Value = def_rand
	elseif (option ==  converter_S)
		def_conv = value
		SetSliderOptionValue(converter_S, def_conv, "${0} souls per perk point", 0)
	elseif (option ==  dbweight_S)
		fDBSettings.Value = value
		def_db = fDBSettings.Value
		SetSliderOptionValue(dbweight_S, def_db, "{0}", 0)
		Game.getForm(0x003ADA4).SetWeight(def_db)
	elseif (option ==  dsweight_S)
		fDSSettings.Value = value
		def_ds = fDSSettings.Value
		SetSliderOptionValue(dsweight_S, def_ds, "{0}", 0)
		Game.getForm(0x003ADA3).SetWeight(def_ds)
	endIf
endEvent

event OnOptionHighlight(int option)
	if (option == attOID_S)
		SetInfoText("$DD_AttInfo")
	elseif (option == meleeOID_S)
		SetInfoText("$DD_MeleeInfo")
	elseif (option == armorOID_S)
		SetInfoText("$DD_ARInfo")
	elseif (option == resistOID_S)
		SetInfoText("$DD_ResInfo")
	elseif (option == breathOID_M)
		SetInfoText("$DD_MagInfo")
	elseif (option ==timerOID_S)
		SetInfoText("$DD_TimerInfo")
	elseif (option == randOID_S)
		SetInfoText("$DD_RandomizerInfo")
	elseif (option == sz_B)
		SetInfoText("$DD_SZInfo")
	elseif (option == un_B)
		SetInfoText("$DD_UnlvlInfo")
	elseif (option == extra_B)
		SetInfoText("$DD_XtraInfo")
	elseif (option == knock_B)
		SetInfoText("$DD_KnockInfo")
	elseif (option == stagger_B)
		SetInfoText("$DD_StagInfo")
	elseif (option == ess_b)
		SetInfoText("$DD_EssInfo")
	elseif (option == store_b)
		SetInfoText("$DD_StoreInfo")
	endIf
endEvent

event OnOptionMenuOpen(int option)
	if (option == difficultyOID_M)
		SetMenuDialogOptions(difficultyList)
		SetMenuDialogStartIndex(difficultyIndex)
		SetMenuDialogDefaultIndex(0)
	elseif (option == breathOID_M)
		SetMenuDialogOptions(breathList)
		SetMenuDialogStartIndex(breathIndex)
		SetMenuDialogDefaultIndex(2)
	elseif (option == csOID_M)
		SetMenuDialogOptions(csList)
		SetMenuDialogStartIndex(csIndex)
		SetMenuDialogDefaultIndex(1)
	endIf
endEvent


event OnOptionMenuAccept(int option, int index)
	if (option == difficultyOID_M)
		difficultyIndex = index
		SetMenuOptionValue(difficultyOID_M, difficultyList[difficultyIndex], 0)
		If difficultyIndex == 0
			DDResValue.Value = 0
			DDAttValue.Value = 0
			DDMeleeValue.Value = 0
			DDBreathValue.Value = 0
			DDArmorValue.Value = 0
		Elseif difficultyIndex == 1
			DDResValue.Value = 20
			DDAttValue.Value = 75
			DDMeleeValue.Value = 75
			DDBreathValue.Value = 3
			DDArmorValue.Value = 250
		Elseif difficultyIndex == 2
			DDResValue.Value = 50
			DDAttValue.Value = 150
			DDMeleeValue.Value = 150
			DDBreathValue.Value = 6
			DDArmorValue.Value = 500
		Endif
			def_att = DDAttValue.Value
			def_melee=DDMeleeValue.Value
			def_armor=DDArmorValue.Value
			def_res=DDResValue.Value
			breathIndex = DDBreathValue.GetValueInt()
			SetSliderOptionValue(attOID_S, def_att, "+{0}%", 0)
			SetSliderOptionValue(meleeOID_S, def_melee, "+{0}%", 0)
			SetSliderOptionValue(armorOID_S, def_armor, "+{0}", 0)
			SetSliderOptionValue(resistOID_S, def_res, "+{0}%", 0)
			SetMenuOptionValue(breathOID_M, breathList[breathIndex], 0)
	elseif (option == breathOID_M)
		breathIndex = index
		SetMenuOptionValue(breathOID_M, breathList[breathIndex], 0)
		DDBreathValue.Value = breathIndex
	elseif (option == csOID_M)
		csIndex = index
		SetMenuOptionValue(csOID_M, csList[csIndex], 0)
		nCS.Value = csIndex
	endIf
endEvent

event OnStartAssaultTimer(string eventName, string strArg, float numArg, form sender)
        if (startAssaultTimerRequested)
                return
        endIf
        startAssaultTimerRequested = true
        nAssaultQst00.Start()
        startAssaultTimerRequested = false
endEvent

function ToggleProtection()
	(Game.GetForm(0x0001D4B7) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C3AB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013614) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001361E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001361F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001361D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013621) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013655) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0003A19A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013652) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001364D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013650) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000133A5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000133A2) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0009A7A8) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001338F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0003F21E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000133AD) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001338E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001339A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00055A5E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000133B2) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000133A3) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001E765) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000D6703) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013395) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001338B) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000135E9) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000135EF) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000135ED) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013365) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013373) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B072) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013357) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013360) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013349) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019DEF) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001334D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013354) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001CB78) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013351) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013371) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019DF2) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001334C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00029DAD) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00029DAE) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001336D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013380) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001CD90) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001CD91) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00029DAA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00029DAF) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001CD8F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001334F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000136C5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001335F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001337E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B8827) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013255) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013260) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000132AE) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001329A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013274) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000132AA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013299) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013273) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013275) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001328C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013261) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001327D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0009B7A6) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013266) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000132A7) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000132AB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013284) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BAA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BA4) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BA3) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BA2) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BA1) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B99) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B97) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B9E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0002BA8C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001328C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B9D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B9C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A696) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A6D5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A692) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A6D9) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A694) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BA5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BBB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BBA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BB9) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B9F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013669) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BB7) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013BAB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0002BA8E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014140) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014142) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014121) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014135) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014146) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001411F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001413A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001413F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001412A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001413E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014148) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00014141) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0009B7AB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C187) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C193) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C19C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C19E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C19A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C198) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C197) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C199) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C23E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001E7D5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C183) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019A28) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000136BB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013475) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013480) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001347B) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001347A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013478) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013479) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000136B6) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000136C3) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B79) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B7C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B7A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019E18) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019951) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019953) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019957) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B076) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B079) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1DB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1D9) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1D6) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1CF) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1D1) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1D5) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B9981) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00065657) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000350A7) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B9982) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B9980) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B9983) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000B997F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C8C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C90) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C91) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C8F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C8E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000A2C8C) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A6D7) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001A6DB) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C196) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C195) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001C194) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0009BCAF) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00015CFA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00015CFE) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001411D) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001325F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013666) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00028AD0) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000135E8) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019959) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013390) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001403E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001990F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00013B81) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001B1D2) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019E1E) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001336B) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019E22) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001403F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0001347F) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00019E1A) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x000D95E9) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x0009A7AA) as ActorBase).SetEssential(essVal)
	(Game.GetForm(0x00109487) as ActorBase).SetEssential(essVal)
endfunction

Function LoadPreset()
	DDAttValue.Value = def_att
	DDmeleeValue.Value = def_melee
	DDarmorValue.Value = def_armor
	DDresValue.Value = def_res
	DDBreathValue.Value = breathIndex
EndFunction