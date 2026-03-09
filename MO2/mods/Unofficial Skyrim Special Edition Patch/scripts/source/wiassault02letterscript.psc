Scriptname WIAssault02LetterScript extends ReferenceAlias
{Set quest stage when player reads letter.}

; Fixed by USKP as was using an on-activate block which didn't work

Event OnRead()
       GetOwningQuest().setStage(10)
endEvent