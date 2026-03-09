Scriptname USKP_DB05LodiAliasScript extends ReferenceAlias  

Quest Property BardSongs  Auto

Event OnLoad()
	(BardSongs as BardSongsScript).Bard2PlaySong(GetActorReference(),"Flute")
EndEvent
