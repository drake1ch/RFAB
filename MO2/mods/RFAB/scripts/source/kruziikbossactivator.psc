Scriptname KruziikBossActivator extends ObjectReference  

Sound Property RumbleSound auto
Sound Property FrostExplosionSound auto
Sound Property FrostExplosionAftermathSound auto
Explosion Property IceExplosion auto
Explosion Property AirExplosion auto
ObjectReference Property Blizzard auto
ObjectReference Property OutroBlizzard auto
ObjectReference Property BossLocation auto
ObjectReference Property FrostPlrLocation auto
ObjectReference Property ThawedRoom_BlackPlane auto
ObjectReference Property Icyroom_BlackPlane auto
ImageSpaceModifier Property Frost_IMOD auto
Actor Property TheBoss auto

float xOffset = 163.9024
float yOffset = -3629.0386
int RumbleSoundID
bool TriggerOnce

Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef == Game.GetPlayer() && TriggerOnce == false)
    	TriggerOnce = true
        Game.DisablePlayerControls()
    	EffectBuildUp()
    	utility.wait(3)
    	EffectClimax()
    endif
EndEvent

Function EffectBuildUp()
    RumbleSoundID = RumbleSound.Play(Game.GetPlayer())
    Sound.SetInstanceVolume(RumbleSoundID, 1.0)
    game.ShakeCamera(Game.GetPlayer(), 0.2, 3.0)
EndFunction

Function EffectClimax()
    ;Stop rumble sound, apply imagespace, spawn explosions, play explosion sound, shake camera, fade to white
    sound.StopInstance(RumbleSoundID)
    BlizzardEffect()
    Frost_IMOD.Apply()
    BossLocation.PlaceAtMe(IceExplosion)
    BossLocation.PlaceAtMe(AirExplosion)
    FrostExplosionSound.Play(Game.GetPlayer())
    game.ShakeCamera(Game.GetPlayer(), 0.7, 1.0)
    FadeToWhite()
    ;---------------------------------
EndFunction

Function BlizzardEffect()
    Blizzard.Enable()
    OutroBlizzard.Enable()
    Blizzard.PlayGamebryoAnimation("mLoop")
    OutroBlizzard.PlayGamebryoAnimation("mLoop")
EndFunction

Function FadeToWhite()
    game.FadeOutGame(true, false, 0, 1.5)
    utility.wait(0.5)
    game.FadeOutGame(false, false, 4, 0)
    utility.wait(2)
    SwitchRooms()
EndFunction

Function SwitchRooms()
    Game.GetPlayer().MoveTo(Game.GetPlayer(), xOffset, yOffset, 0, true)
    Game.FadeOutGame(false, false, 3, 7)
    int InstanceID = FrostExplosionAftermathSound.Play(Game.GetPlayer())
    Sound.SetInstanceVolume(InstanceID, 0.5)
    FinishBlizzardEffect()
EndFunction

Function FinishBlizzardEffect()
    utility.wait(3)
    Blizzard.PlayGamebryoAnimation("mEnd")
    OutroBlizzard.PlayGamebryoAnimation("mEnd")
    utility.wait(2.1)
    Blizzard.Disable()
    OutroBlizzard.Disable()
    ThawedRoom_BlackPlane.Enable()
    Icyroom_BlackPlane.Disable()
    FinishIntro()
EndFunction

Function FinishIntro()
    Game.EnablePlayerControls()
EndFunction