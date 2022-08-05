if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Manhunt Assault Rifle"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Manhunt Weapons"
--if (CLIENT) then
--SWEP.Slot						= 1 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
--SWEP.SlotPos					= 2 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
--end
SWEP.MadeForNPCsOnly = true -- Is this weapon meant to be for NPCs only?
SWEP.Spawnable = false
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= false -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 3.8 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.1 -- How much time until the bullet/projectile is fired?
SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2,0.3,0.4,0.5,0.6,1.8,1.9,2.0,2.1,2.2,2.3} -- Next time it can use primary fire
--SWEP.NPC_TimeUntilFireExtraTimers = {0.15,0.3,0.45,0.6,0.75,0.9,1.05} -- Next time it can use primary fire
SWEP.NPC_UsePistolBehavior 		= true
SWEP.NPC_CustomSpread = 1.35
SWEP.NPC_AllowCustomSpread = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HoldType 					= "ar2" -- List of holdtypes are in the GMod wiki
SWEP.WorldModel					= "models/manhunt/weapons/w_m16.mdl"
--SWEP.ViewModel					= "models/manhunt/weapons/v_glock.mdl"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.ViewModelFOV				= 90
--SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
SWEP.Primary.Damage				= 15 -- Damage
SWEP.Primary.PlayerDamage		= 1 -- Put 1 to make it the same as above
SWEP.Primary.Force				= 6
SWEP.Primary.NumberOfShots		= 1 -- How many shots per attack?
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.Primary.Delay				= 0.5 -- Time until it can shoot again
SWEP.Primary.TakeAmmo			= 1 -- How much ammo should it take on each shot?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "AR2" -- Ammo type
SWEP.Primary.Sound				= {"vj_manhunt/weapons/manhunt/colt.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"vj_manhunt/weapons/manhunt/colt_distant_lg.wav","vj_manhunt/weapons/manhunt/colt_distant_sh.wav"}

SWEP.Primary.DistantSoundLevel = 100 -- Distant sound level
SWEP.Primary.DistantSoundPitch	= VJ_Set(90, 110) -- Distant sound pitch
SWEP.Primary.DistantSoundVolume	= 0.9 -- Distant sound volume

SWEP.PrimaryEffects_MuzzleAttachment = 2
SWEP.PrimaryEffects_ShellAttachment = 1
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_RifleShell1"
	-- NPC Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_HasReloadSound = true -- Should it play a sound when the base detects the SNPC playing a reload animation?
SWEP.NPC_ReloadSound = {"vj_manhunt/weapons/manhunt/reload_generic.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ReloadSoundLevel = 75 -- How far does the sound go?

SWEP.Reload_TimeUntilAmmoIsSet	= 2.1 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 2.1 -- How much time until the player can play idle animation, shoot, etc.