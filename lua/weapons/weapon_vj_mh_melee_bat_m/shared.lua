if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Manhunt Bat (Metal)"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"
SWEP.MadeForNPCsOnly = true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.48 -- How much time until the bullet/projectile is fired?
SWEP.MeleeWeaponSound_Hit = {"vj_manhunt/weapons/melee/bat_m_hit.wav","vj_manhunt/weapons/melee/bat_m_hit1.wav","vj_manhunt/weapons/melee/bat_m_hit2.wav","vj_manhunt/weapons/melee/bat_m_hit3.wav"}
SWEP.NPC_BeforeFireSound = {"vj_manhunt/weapons/melee/mh_melee_miss.wav"}
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/Manhunt/weapons/w_mbat.mdl"
SWEP.HoldType = "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 15 -- Damage
SWEP.IsMeleeWeapon  = true -- Should this weapon be a melee weapon? 
SWEP.Primary.Force = 12 -- Force applied on the object the bullet hits
SWEP.Primary.Ammo	= "Null" -- Ammo type

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