if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Manhunt Hammer"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"
SWEP.MadeForNPCsOnly = true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.48 -- How much time until the bullet/projectile is fired?
SWEP.MeleeWeaponSound_Hit = {"weapons/melee/hammer_hit.wav"}
SWEP.NPC_BeforeFireSound = {"weapons/melee/mh_melee_miss.wav"}
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/Manhunt/weapons/w_hammer.mdl"
SWEP.HoldType = "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 12 -- Damage
SWEP.IsMeleeWeapon  = true -- Should this weapon be a melee weapon? 
SWEP.Primary.Force = 9 -- Force applied on the object the bullet hits
SWEP.Primary.Ammo	= "Null" -- Ammo type