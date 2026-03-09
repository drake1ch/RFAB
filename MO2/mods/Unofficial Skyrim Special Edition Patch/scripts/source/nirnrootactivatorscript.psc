Scriptname NirnrootACTIVATORScript extends ObjectReference Hidden 
{Script to only be applied to the NirnrootACTIVATOR base object.}

Ingredient Property Nirnroot Auto
Message Property HarvestNirnrootMESSAGE Auto
Activator Property NirnrootGlowACTIVATOR Auto
Activator Property NirnrootEmptyACTIVATOR Auto

ObjectReference Property NirnrootGlowReference Auto Hidden
ObjectReference Property NirnrootEmptyReference Auto Hidden
ObjectReference Property EmptyRef Auto Hidden
Bool Property HasBeenLoaded Auto Hidden

Float NirnScale

;-------------------------------------------
;	Added by USLEEP 3.0.8 for Bug #13603
;-------------------------------------------

bool USLEEP_CellAttached = false

;-------------------------------------------

EVENT OnCellAttach()

	;USLEEP 3.0.8 for Bug #13603: set tracking bool to 'true':
	USLEEP_CellAttached = true
	
	if (self.IsDisabled() == FALSE)
		NirnrootGlowReference = PlaceAtMe(NirnRootGlowACTIVATOR)
		NirnrootEmptyReference = PlaceAtMe(NirnRootEmptyACTIVATOR)
		NirnrootEmptyReference.DisableNoWait()
	endif

endEVENT



EVENT OnReset()

	if (self.IsDisabled() == TRUE)
		self.Enable()
		;USLEEP 3.0.8 Bug #13603: Added the follwoing check to make sure that OnCellAttach creates the references if it fires before OnReset (in that
		;case, it wouldn't have created anything because the reference was still disabled):
		if USLEEP_CellAttached && (NirnrootEmptyReference == none)
			OnCellAttach()
		endif
		GoToState("WaitingForHarvest")
	endif

endEVENT



Auto STATE WaitingForHarvest

	EVENT onActivate(ObjectReference TriggerRef)
		GoToState("AlreadyHarvested")
		Nirnscale = Self.GetScale()
		NirnrootEmptyReference.SetScale(Nirnscale)
		NirnrootEmptyReference.EnableNoWait()
		(TriggerRef as Actor).additem(Nirnroot, 1)
		Game.IncrementStat( "Nirnroots Found" )
		NirnRootGlowReference.DisableNoWait()
		NirnRootGlowReference.Delete()

		self.DisableNoWait()
		
	endEVENT

endSTATE



STATE AlreadyHarvested
	

endSTATE

;-------------------------------------------
;	Added by USLEEP 3.0.8 for Bug #13603
;-------------------------------------------

Event OnCellDetach()
	USLEEP_CellAttached = false
endEvent 