;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_defaultGhostScriptNoPile.psc
Modified : 2019-03-05 02:26:18
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_defaultGhostScriptNoPile extends Actor

;-- Properties --------------------------------------
Float property ShaderDuration = 0.000000 auto
{Duration of Effect Shader.}
formlist property pDefaultGhostWeaponFlickerList auto
spell property pGhostResistsAbility auto
formlist property pDisintegrationMainImmunityList auto
{If the target is in this list, they will not be disintegrated.}
Bool property bFade = false auto
{makes the ghost fade out instead of explode}
spell property pGhostAbilityNew auto
leveleditem property pdefaultGhostLeveledList auto
perk property pGhostHalfDamagePerk auto
Bool property bflicker = false auto
{don't use this yet}
effectshader property pGhostFXShader auto
sound property deathSound auto
effectshader property pGhostDeathFXShader auto
{the shader to play while dying}
Float property fDelay = 0.750000 auto
{time to wait before Spawning Ash Pile}
Float property fDelayEnd = 1.65000 auto
{time to wait before Removing Base Actor}
Bool property bSetAlphaZero = true auto
{The Effect Shader we want.}
explosion property pdefaultGhostDeathExplosion auto

;-- Variables ---------------------------------------
race VictimRace
Bool TargetIsImmune = true
Bool bFlash = false
Actor target

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function onLoad()

	self.addSpell(pGhostAbilityNew, true)
	self.addSpell(pGhostResistsAbility, true)
	if bflicker
		self.ghostFlash(1 as Float)
	endIf
endFunction

function onDYING(Actor killer)

	deathSound.play(self as OBJECTREFERENCE)
	if bFade
		self.blockActivation(true)
		self.disable(1 as Bool)
	else
		if pDisintegrationMainImmunityList == none
			TargetIsImmune = false
		else
			actorbase VictimBase = self.GetBaseObject() as actorbase
			VictimRace = VictimBase.GetRace()
			TargetIsImmune = pDisintegrationMainImmunityList.hasForm(VictimRace as FORM) || pDisintegrationMainImmunityList.hasForm(VictimBase as FORM)
		endIf
		if TargetIsImmune == false
			self.SetCriticalStage(self.CritStage_DisintegrateStart)
			if pGhostDeathFXShader != none
				pGhostDeathFXShader.play(self as OBJECTREFERENCE, ShaderDuration)
			endIf
			self.setAlpha(0.000000, true)
			utility.wait(fDelayEnd)
			if pGhostDeathFXShader != none
				pGhostDeathFXShader.stop(self as OBJECTREFERENCE)
			endIf
			if bSetAlphaZero == true
				self.setAlpha(0.000000, true)
			endIf
			self.SetCriticalStage(self.CritStage_DisintegrateEnd)
		endIf
	endIf
endFunction

function ghostFlash(Float time)

	pGhostFXShader.stop(self as OBJECTREFERENCE)
	self.setGhost(true)
	utility.wait(time)
	self.setGhost(false)
	self.setAlpha(0.300000, false)
	pGhostFXShader.play(self as OBJECTREFERENCE, -1.00000)
	bFlash = false
endFunction

function onHIT(OBJECTREFERENCE akAggressor, FORM akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	if bflicker as Bool && !pDefaultGhostWeaponFlickerList.hasForm(akSource) && !abHitBlocked && !bFlash
		bFlash = true
		target = akAggressor as Actor
		self.ghostFlash(3 as Float)
	endIf
endFunction

; Skipped compiler generated GetState
