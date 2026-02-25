Scriptname DLC2DBBookLevelLightTranslationSCRIPT extends ObjectReference Hidden 

Float Property fMovementSpeed = 50.0 Auto
{Speed the light will move at.  Default = 50}

Bool Property bShowDebugTraces = FALSE Auto
{(Default = FALSE)}

Int Property iMovementType = 0 Auto
{0 = Ping Pong: The light will transition back through it's linked chain once it's reached the end. (DEFAULT)
1 = Reset: The light will reset (MoveTo()) the first linked ref in the chain once it's reached the end.
2 = Looping: The light will transition to it's first linked ref from the last one in the chain.}

Int Property Distance = 3000 Auto

Bool bStartTranslation
Bool bMovingForward
Bool bPlayerCurrentlyInCell
Int iLinkChainCount
Int iCurrentLinkTarget

Actor Player
Cell SelfCell

Event OnCellAttach()
	Player = Game.GetPlayer()
	SelfCell = self.GetParentCell()
	bPlayerCurrentlyInCell = TRUE

	if GetLinkedRef() && !self.IsDisabled()
		bMovingForward = TRUE
		iLinkChainCount = CountLinkedRefChain() - 1
		bStartTranslation = TRUE
		self.MoveTo(GetLinkedRef())
		DoLightMovement()
	endif
EndEvent

Event OnLoad()
	if GetLinkedRef() && !self.IsDisabled() && bPlayerCurrentlyInCell
		HandleTransitionEnd()
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if bPlayerCurrentlyInCell
		if !self.IsDisabled()
			bMovingForward = TRUE
			iLinkChainCount = CountLinkedRefChain() - 1
			bStartTranslation = TRUE
			self.MoveTo(GetLinkedRef())
			DoLightMovement()
		endif	
	endif
EndEvent

Event OnCellDetach()
	bPlayerCurrentlyInCell = FALSE
EndEvent

Event OnTranslationComplete()
	if Player.GetDistance(self) < Distance
		Move()
	else 
		utility.wait(5)
		Move()
	endif 
EndEvent

Event OnTranslationFailed()
	if Player.GetDistance(self) < Distance
		Move()
	else 
		utility.wait(5)
		Move()
	endif 
EndEvent

Function Move()
	if Player.GetParentCell() != SelfCell
		bPlayerCurrentlyInCell = false
	elseif GetLinkedRef()
		HandleTransitionEnd()
	endif
EndFunction

Function HandleTransitionEnd()
	if bMovingForward == TRUE
		iCurrentLinkTarget = iCurrentLinkTarget + 1
		if iCurrentLinkTarget <= iLinkChainCount
			DoLightMovement()
		else
			if iMovementType == 0 ;Ping Pong
				bMovingForward = FALSE
				DoLightMovement()
			endif
			if iMovementType == 1 ;Reset
				self.MoveTo(GetLinkedRef())
				iCurrentLinkTarget = 0
				DoLightMovement()
			endif
			if iMovementType == 2 ;Looping
				iCurrentLinkTarget = 0
				DoLightMovement()
			endif
		endif
	elseif bMovingForward == FALSE
		iCurrentLinkTarget = iCurrentLinkTarget - 1
		if iCurrentLinkTarget >= 0
			DoLightMovement()
		else
			bMovingForward = TRUE
			DoLightMovement()
		endif
	endif
EndFunction

Function DoLightMovement()
	self.TranslateToRef(GetNthLinkedRef(iCurrentLinkTarget), fMovementSpeed, 0)
EndFunction