Scriptname DLC2HMDaedraDeathScript extends actor  

import utility

SPELL PROPERTY DLC2AbFXHMDaedraSpell AUTO

;BOOL PROPERTY bFade=FALSE AUTO
{makes the ghost fade out instead of explode}

; //////////
; //ASH PILE VARIABLES
; //////////
float property fDelay = 0.75 auto
{time to wait before Spawning Ash Pile}
float property fDelayEnd = 3.65 auto
{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}
Activator property DLC2HMDaedraAshPile auto
{The object we use as a pile.}
;Bool property bSetAlphaZero = True auto
;{The Effect Shader we want.}

EFFECTSHADER PROPERTY pGhostDeathFXShader AUTO
{the shader to play while dying}

; ///////////
; //ONLOAD
; ///////////
EVENT onLoad()

	; // add on the abilities
	SELF.addSpell(DLC2AbFXHMDaedraSpell)
				
ENDEVENT

; /////////
; //ONDYING: On dying play an explosion to mask the ghost vanishing and being replaced by his corpse
; /////////
EVENT onDYING(ACTOR killer)
	
			SELF.SetCriticalStage(SELF.CritStage_DisintegrateStart)

			IF(pGhostDeathFXShader != none)
				pGhostDeathFXShader.play(SELF,ShaderDuration)
			ENDIF
			;wait(0.5)
			SELF.SetAlpha (0.0,True); - UDBP 2.0.1: SetAlpha cannot be called on dead actors. OnDying events only happen for dead actors. So......
									; - UDBP 2.1.2: Reverted because it *is* working and is necessary for the death visuals to work properly, despite the script logger fussing over it.
			
			; //attach the ash pile
			IF(DLC2HMDaedraAshPile != none); - UDBP 2.1.2: != None check for the mirror seekers, as their assigned "none" value for this property suggests this was the intent despite it dropping the default ash pile.
				SELF.AttachAshPile(DLC2HMDaedraAshPile)
			ENDIF
			utility.wait(fDelayEnd)
			IF(pGhostDeathFXShader != none)
				pGhostDeathFXShader.stop(SELF)
			ENDIF
			;IF(bSetAlphaZero == True)
				;SELF.SetAlpha (0.0,True)
			;ENDIF
			SELF.SetCriticalStage(SELF.CritStage_DisintegrateEnd)
	
ENDEVENT