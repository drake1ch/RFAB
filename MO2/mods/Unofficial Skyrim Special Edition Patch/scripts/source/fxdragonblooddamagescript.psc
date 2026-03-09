Scriptname FXDragonBloodDamageScript extends ActiveMagicEffect  
{This script applies blood damage geometry to the dragon and turns it on when they are hit based on the direction they are hit from}

;===============================================
; MARK'S ORIGINAL VARS & PROPERTIES
int frontBloodStepper
int backBloodStepper
int leftBloodStepper
int rightBloodStepper
int dragonHealth 
string hitDirection ;0=front 1=right 2=back 3=left
float hitAngle
Armor Property DragonBloodHeadFXArmor  Auto  
Armor Property DragonBloodTailFXArmor  Auto  
Armor Property DragonBloodWingLFXArmor  Auto  
Armor Property DragonBloodWingRFXArmor  Auto  
Actor selfRef

; JOEL'S VARS & PROPERTIES
; user can override HP percentages
float property HPpctT1 = 0.98 auto
{relative total HP at which first blood should appear DEFAULT: 0.??} 
float property HPpctT2 = 0.95 auto
{relative total HP at which second blood should appear DEFAULT: 0.??} 
float property HPpctT3 = 0.90 auto
{relative total HP at which third blood should appear DEFAULT: 0.??} 
float property HPpctT4 = 0.80 auto
{relative total HP at which final blood should appear DEFAULT: "+HPpctT4} 

float previousHP
float diffHP

; tracking values for the amount of damage each "side" has taken.
float HPFront
float HPBack
float HPLeft
float HPRight

; tracking vars for damage to each side
; 0 = no blood, 1 = tier 1 blood, etc.
int stateFront = 0
int stateBack = 0
int stateLeft = 0
int stateRight = 0

; HP tiers.  These are the threshold values below which each blood will play 
float HPt1
float HPt2
float HPt3
float HPt4

bool bDebug = FALSE

;2017-01-05 by Taka2nd ========================
;
;Nexus ver1.2
;・変数をデフォルトのものに戻す
;・不要な変数をコメントアウト
;Nexus ver1.2a
;・不要な変数をコメントアウトを外す
;Nexus ver1.2b
;・機能していない不要なイベント処理を削除
;
;
;・PlaySubAnimation()の頻繁なエラーおよびエラースタック
;↓
;PlaySubAnimation()へのコマンドが逆行および多重化を起こしていた
;→排他制御を行っていなかったのとグローバル変数で計算していたのが原因
;↓
;State文によるの排他の追加および変数の見直しにより解決、それにより多少の負荷軽減効果もあり
;
;・死亡チェックを追加
;・HP計算の不具合→GetActorValuePercentage()に変更
;
;・PlaySubAnimation()の定期的なエラー、Bleed**を順番通りに実行することで解決
;
;
;Entire script rewritten for USLEEP 3.0.10. Used with permission from Taka2nd.

Event OnEffectStart(Actor Target, Actor Caster)
	selfRef = Caster
	stateFront = 0
	stateBack = 0
	stateLeft = 0
	stateRight = 0
	PreviousHP = 1.0
	HPfront = 1.0
	HPback = 1.0
	HPleft = 1.0
	HPright = 1.0

	;USSEP 4.1.5 for Bug #13547: added this line:
	USSEP_RegisterForAnimationEvents (selfRef)
endEvent

State __Busy__
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	endEvent
endState

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	GotoState("__Busy__")

	if !selfRef
		return	;OnHit Event Finish
	endif

	if akAggressor

		float fCurrentHP = selfRef.GetActorValuePercentage("health")
		if fCurrentHP <= 0
			return	;OnHit Event Finish
		endif

		float fDiffHP = PreviousHP - fCurrentHP
		if fDiffHP > 0

			PreviousHP = fCurrentHP
			float fHitAngle = selfRef.GetHeadingAngle(akAggressor)

			;FRONT
			if fHitAngle >= -45 && fHitAngle <= 45
				HPfront -= fDiffHP
				if GetBleedState(HPfront) > stateFront
					stateFront += 1
					selfRef.PlaySubGraphAnimation("HeadBleed0" + stateFront)
				endif
			;BACK
			elseif fHitAngle >= 135 || fHitAngle <= -135
				HPback -= fDiffHP
				if GetBleedState(HPback) > stateBack
					stateBack += 1
					selfRef.PlaySubGraphAnimation("TailBleed0" + stateBack)
				endif
			;LEFT
			elseif fHitAngle < 0
				HPleft -= fDiffHP
				if GetBleedState(HPleft) > stateLeft
					stateLeft += 1
					selfRef.PlaySubGraphAnimation("WingLBleed0" + stateLeft)
				endif
			;RIGHT
			else
				HPright -= fDiffHP
				if GetBleedState(HPright) > stateRight
					stateRight += 1
					selfRef.PlaySubGraphAnimation("WingRBleed0" + stateRight)
				endif
			endif

		endif

	endif

	;Debug.Trace("OnHit : akAggressor=" + akAggressor + " : akSource=" + akSource + " (" + akSource.GetType() + ") : akProjectile=" + akProjectile)
	GotoState("")

endEVENT

int FUNCTION GetBleedState(float fHP)
	if fHP > HPpctT1
		return 0
	elseif fHP > HPpctT2
		return 1
	elseif fHP > HPpctT3
		return 2
	elseif fHP > HPpctT4
		return 3
	endif
	return 4
endFUNCTION

;-----------------------------------------------------------------
;	Added by USSEP 4.1.5 for Bug #13547:
;-----------------------------------------------------------------

Event OnAnimationEvent (ObjectReference akSource, string asEventName)
	;do nothing
EndEvent

function USSEP_RegisterForAnimationEvents (actor dragonRef)
	if dragonRef
		RegisterForAnimationEvent (dragonRef, "HeadBleed01")
		RegisterForAnimationEvent (dragonRef, "HeadBleed02")
		RegisterForAnimationEvent (dragonRef, "HeadBleed03")
		RegisterForAnimationEvent (dragonRef, "HeadBleed04")
		RegisterForAnimationEvent (dragonRef, "TailBleed01")
		RegisterForAnimationEvent (dragonRef, "TailBleed02")
		RegisterForAnimationEvent (dragonRef, "TailBleed03")
		RegisterForAnimationEvent (dragonRef, "TailBleed04")
		RegisterForAnimationEvent (dragonRef, "WingLBleed01")
		RegisterForAnimationEvent (dragonRef, "WingLBleed02")
		RegisterForAnimationEvent (dragonRef, "WingLBleed03")
		RegisterForAnimationEvent (dragonRef, "WingLBleed04")
		RegisterForAnimationEvent (dragonRef, "WingRBleed01")
		RegisterForAnimationEvent (dragonRef, "WingRBleed02")
		RegisterForAnimationEvent (dragonRef, "WingRBleed03")
		RegisterForAnimationEvent (dragonRef, "WingRBleed04")
	endif
endFunction
