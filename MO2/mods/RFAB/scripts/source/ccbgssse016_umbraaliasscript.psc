;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE016_UmbraAliasScript.psc
Modified : 2019-02-15 23:48:17
Compiled : 2019-03-07 22:30:00
User     : builds
Computer : RKVBGSBUILD05
/;
scriptName ccBGSSSE016_UmbraAliasScript extends ReferenceAlias

;-- Properties --------------------------------------
actor property PlayerRef auto
message property invulnerableMessage auto
formlist property umbraExplosionSpellList auto
ccbgssse016_bosscontrollerscript property BossController auto
globalvariable property umbraIsInvulnerable auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnDeath(actor akKiller)

	BossController.OnUmbraDeath()
endFunction

function OnCellAttach()

	BossController.Initialize()
endFunction

; Skipped compiler generated GotoState

function OnSpellCast(Form akSpell)

	if umbraExplosionSpellList.HasForm(akSpell)
		BossController.OnUmbraCastExplosion()
	endIf
endFunction

function OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	if !self.GetActorRef().IsDead() && akAggressor == PlayerRef as ObjectReference && umbraIsInvulnerable.GetValueInt() == 1
		invulnerableMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction

function OnCombatStateChanged(actor akTarget, Int aeCombatState)

	if aeCombatState == 1
		BossController.OnUmbraEnterCombat()
	endIf
endFunction
