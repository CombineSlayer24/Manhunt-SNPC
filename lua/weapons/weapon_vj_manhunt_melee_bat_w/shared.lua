if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Manhunt Bat (Wood)"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"
SWEP.MadeForNPCsOnly = true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.48 -- How much time until the bullet/projectile is fired?
SWEP.MeleeWeaponSound_Hit = {"weapons/melee/bat_w_hit.wav"}
SWEP.NPC_BeforeFireSound = {"weapons/melee/mh_miss.wav"}
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/Manhunt/weapons/w_wbat.mdl"
SWEP.HoldType = "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 12 -- Damage
SWEP.IsMeleeWeapon  = true -- Should this weapon be a melee weapon? 
SWEP.Primary.Force = 10 -- Force applied on the object the bullet hits
SWEP.Primary.Ammo	= "Null" -- Ammo type
function SWEP:CustomOnInitialize()
	self:SetSkin(math.random(0,1))
end

--[[ Nah, default anims looks better, looks close in manhunt game
function SWEP:CustomOnThink()
self.Owner.Weapon_FiringDistanceFar = math.random(45,55)
self.Owner.Weapon_FiringDistanceClose = math.random(-100,-1000)
self.Owner.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_MELEE2}
self.Owner.AnimTbl_Walk = {ACT_HL2MP_WALK_MELEE2}
self.Owner.AnimTbl_Run = {ACT_HL2MP_RUN_MELEE2 }
self.Owner.AnimTbl_ShootWhileMovingWalk = {ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2}
self.Owner.AnimTbl_ShootWhileMovingRun = {ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2}
end--]]