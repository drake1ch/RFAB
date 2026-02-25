scriptName REQ_QuestRestarter extends Quest
{script state manager for player-ref scripts quest}

;-- Properties --------------------------------------
message property SkyProcMissing auto
{message if Requiem for the Indifferent is missing and the data is therefore garbage}
message property SKSE_missing auto
{message to display if SKSE is missing at all or too old}
globalvariable property VersionIndifferent auto
{GV indicating the Requiem version the SkyProc patch is based on}
sound property InstallationSoundEffect auto
{the effect used in the blackout effect as described in the init/update messages}
message property MehPluginsNotLoaded auto
{message if Meh123's Perk Reload bugfix or the Requiem SKSE plugin are missing}
message property UpgradeForbidden auto
{message if an unsupported upgrade is attempted (major version change)}
globalvariable property VersionActive auto
{GV indicating the currently active Requiem version (in savegame}
message property NoNewGame auto
{message if Requiem was installed into an existing non-Requiem save game}
message property SkyProcOutdated auto
{message if Requiem for the Indifferent is based on an older Requiem version than installed}
imagespacemodifier property Fadeout auto
{the blackout effect during initialization or update}
globalvariable property VersionInstalled auto
{GV indicating the currently installed Requiem version (static in esp)}
message property BashedPatchFailed auto
{message if (most likely) a bashed patch has broken the SkyProc-processed levelled lists}
globalvariable property KillSwitchOverride auto
{constnat GV to temporarily override the killswitch in the update checks, for debug intended only}
message property InstallationBegins auto
referencealias property AutoUpdater auto
{ref alias with AutoUpdater script attached}
message property DoubleUpdate auto
{message if Requiem tries to start a second script update in parallel}
message property DowngradeForbidden auto
{message if the current plugin version is older than the one used by the savegame}
message property RaceWarning auto
{message if Requiem for the Indifferent is based on an older Requiem version than installed}
globalvariable property NonCriticalWarnOverride auto
{GV indicating that non-critical warnings, such as races or plugins, should not be displayed}
spell property HealthRegenStop auto
{Magic ability on all playable races that should stop natural health regeneration}
leveleditem property TestList auto
{a skyproc-processed list, if a bashed patch has the wrong tags, it will have only 1 entry}
Quest property NewGameCheck auto
{Update.esm quest 1.4 is used for new game check; if Requiem has just started but this quest was stopped, it means this isn't a new game}
message property PCEApatchinvalid auto
{message if Requiem finds the broken PCEA "patch" (clone, not patch) in the load order}
message property SKSE_broken auto
{message if SKSE dll and script versions differ}

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------
;/ 
Int[] function FormatVersion(Int version)

	Int[] subVersions = new Int[3]
	subVersions[0] = version / 10000
	if subVersions[0] >= 2
		subVersions[1] = version % 10000 / 100
		subVersions[2] = version % 10000 % 100
	else
		subVersions[1] = version % 10000 / 1000
		subVersions[2] = version % 10000 % 1000 / 100
	endIf
	return subVersions
endFunction

; Skipped compiler generated GetState

function OnUpdate()

	(AutoUpdater as req_autoupdater).CheckKillswitch()
endFunction

function Restart()

	self.Stop()
	self.SetupCheck()
	utility.Wait(1 as Float)
	self.Start()
	utility.Wait(1 as Float)
	(AutoUpdater as req_autoupdater).InitScripts()
endFunction

function CompleteInit(message ClosingMessage)

	self.CompleteAllObjectives()
	self.CompleteQuest()
	self.UnregisterForAllMenus()
	Int[] subVersions = self.FormatVersion(VersionActive.GetValueInt())
	String ver = subVersions[0] as String + "." + subVersions[1] as String + "." + subVersions[2] as String
	ver += " - " + game.GetPlayer().GetDisplayName()
	game.SetInChargen(false, false, false)
	imagespacemodifier.RemoveCrossFade(1.00000)
	debug.Notification("Requiem инициализирован")
	utility.Wait(1 as Float)
	game.SaveGame("Requiem " + ver)
endFunction

; Skipped compiler generated GotoState

Bool function CheckSKSEplugins()

	if skse.GetPluginVersion("CrashFixPlugin") == -1 || skse.GetPluginVersion("BugFixPlugin") == -1
		if NonCriticalWarnOverride.GetValueInt() != 1
			MehPluginsNotLoaded.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
		return false
	else
		return true
	endIf
endFunction

Bool function SetupCheck()
	return true

	Bool valid = true
	Int version_skse = skse.GetVersionRelease()
	Int version_script = skse.GetScriptVersionRelease()
	Int count = 0
	Int req_index = game.GetModByName("Requiem.esp")
	Int pcea_clone = game.GetModByName("Requiem plus PCEA 3-5.esp")
	Int[] subVersionsPlugin = self.FormatVersion(VersionInstalled.GetValueInt())
	Int[] subVersionsSave = self.FormatVersion(VersionActive.GetValueInt())
	Bool dependent = false
	if version_script < 46
		SKSE_missing.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf version_skse != version_script || version_script == 0
		SKSE_broken.Show(version_skse as Float, version_script as Float, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf VersionActive.GetValueInt() == -2
		NoNewGame.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf subVersionsSave[0] > 0 && subVersionsSave[0] != subVersionsPlugin[0]
		UpgradeForbidden.Show(subVersionsPlugin[0] as Float, subVersionsPlugin[1] as Float, subVersionsPlugin[2] as Float, subVersionsSave[0] as Float, subVersionsSave[1] as Float, subVersionsSave[2] as Float, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf VersionInstalled.GetValueInt() < VersionActive.GetValueInt()
		DowngradeForbidden.Show(subVersionsPlugin[0] as Float, subVersionsPlugin[1] as Float, subVersionsPlugin[2] as Float, subVersionsSave[0] as Float, subVersionsSave[1] as Float, subVersionsSave[2] as Float, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf game.GetModByName("Requiem for the Indifferent.esp") == 255
		SkyProcMissing.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf VersionInstalled.GetValueInt() != VersionIndifferent.GetValueInt()
		SkyProcOutdated.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	elseIf pcea_clone != 255
		count = game.GetModDependencyCount(pcea_clone)
		while count > 0 && !dependent
			count -= 1
			dependent = req_index == game.GetNthModDependency(pcea_clone, count)
		endWhile
		if !dependent
			valid = false
			PCEApatchinvalid.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf TestList.GetNumForms() == 1
		BashedPatchFailed.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		valid = false
	endIf
	if valid
		self.CheckRaces()
		self.CheckSKSEplugins()
	endIf
	if valid
		self.RegisterForSingleUpdate(40 as Float)
		return true
	elseIf KillSwitchOverride.GetValueInt() != 1
		utility.Wait(2 as Float)
		game.QuitToMainMenu()
	else
		return false
	endIf
endFunction

function OnInit()
	return
	if VersionActive.value == -1 as Float
		if !NewGameCheck.IsStopped()
			VersionActive.SetValue(0 as Float)
		else
			VersionActive.SetValue(-2 as Float)
		endIf
		self.SetupCheck()
		self.UnregisterForUpdate()
	endIf
endFunction

function OnMenuClose(String Menu)

	if !self.IsRunning() && VersionActive.GetValueInt() == 0
		self.UnregisterForAllMenus()
		self.Blackout(1.00000)
		self.SetupCheck()
		self.Start()
		utility.Wait(1 as Float)
		(AutoUpdater as req_autoupdater).InitScripts()
	endIf
endFunction

Bool function CheckRaces()

	String unbalanced_races
	Int count_r = race.GetNumPlayableRaces()
	race.GetRace(0 as String)
	Int count_s = 0
	Bool valid = false
	while count_r > 0
		count_r += -1
		race currentrace = race.GetNthPlayableRace(count_r)
		valid = false
		count_s = currentrace.GetSpellCount()
		while count_s > 0 && !valid
			count_s += -1
			if currentrace.GetNthSpell(count_s) == HealthRegenStop
				valid = true
			endIf
		endWhile
		if !valid
			String racename = currentrace.GetName()
			if stringutil.GetLength(unbalanced_races) == 0
				debug.Trace("[REQ] ERROR: Incorrect playable races found! Dumping list of incorrect races!", 0)
				unbalanced_races = racename
			elseIf stringutil.GetLength(unbalanced_races + racename) < 100
				unbalanced_races += ", " + racename
			endIf
			debug.Trace("[REQ] INFO: " + racename + " doesn't have the natural health regeneration suppression", 0)
		endIf
	endWhile
	if stringutil.GetLength(unbalanced_races)
		if NonCriticalWarnOverride.GetValueInt() != 1
			debug.Messagebox(self.StringReplace(RaceWarning.GetName(), "<racenames>", unbalanced_races))
		endIf
		return false
	else
		return true
	endIf
endFunction

function Blackout(Float volume)

	game.SetInChargen(true, true, false)
	Fadeout.ApplyCrossFade(1.00000)
	Int SoundInstance = InstallationSoundEffect.Play(game.GetPlayer() as objectreference)
	sound.SetInstanceVolume(SoundInstance, volume)
endFunction

String function StringReplace(String text, String spot, String substitute)

	String result = ""
	Int Start = stringutil.Find(text, spot, 0)
	Int end = Start + stringutil.GetLength(spot)
	if Start == -1
		result = text
	else
		if Start > 0
			result = stringutil.Substring(text, 0, Start)
		endIf
		result += substitute
		result += stringutil.Substring(text, end, stringutil.GetLength(text))
	endIf
	return result
endFunction
 /;