if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
AddCSLuaFile("shared.lua")
include("shared.lua")
/*--------------------------------------------------
	=============== Gib Base ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used as a base for gibs
--------------------------------------------------*/
ENT.BloodType = "Red" -- Uses the same values as a VJ NPC
ENT.Collide_Decal = "VJ_Manhunt_Blood_Red"
ENT.Collide_DecalChance = 3
ENT.CollideSound = "Default" -- Make it a table to use custom sounds!
ENT.CollideSoundLevel = 60
ENT.CollideSoundPitch = VJ_Set(90, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:PhysicsInit(MOVETYPE_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS) -- Use MOVETYPE_NONE for testing, makes the entity freeze!
	self:SetSolid(MOVETYPE_VPHYSICS)
	if GetConVar("vj_npc_gibcollidable"):GetInt() == 0 then self:SetCollisionGroup(1) end

	-- Physics Functions
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
	end

	-- Misc
	self:InitialSetup()
	if GetConVar("vj_npc_sd_gibbing"):GetInt() == 1 then self.CollideSound = "" end
	if GetConVar("vj_npc_nogibdecals"):GetInt() == 1 then self.Collide_Decal = "" end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defCollideSds = {"weapons/bloody_impact1.wav","weapons/bloody_impact2.wav","weapons/bloody_impact3.wav","weapons/bloody_impact4.wav","weapons/bloody_impact5.wav","weapons/bloody_impact6.wav","weapons/bloody_impact7.wav","weapons/bloody_impact8.wav","weapons/bloody_impact9.wav","weapons/bloody_impact10.wav","weapons/bloody_impact11.wav"}
--
function ENT:InitialSetup()
	if self.CollideSound == "Default" then
		self.CollideSound = defCollideSds
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data, phys)
	-- Effects
	local velSpeed = phys:GetVelocity():Length()
	local randCollideSd = VJ_PICK(self.CollideSound)
	if randCollideSd != false && velSpeed > 18 then
		self:EmitSound(randCollideSd, self.CollideSoundLevel, math.random(self.CollideSoundPitch.a, self.CollideSoundPitch.b))
	end
	
	if self.Collide_Decal != "" && velSpeed > 18 && !data.Entity && math.random(1, self.Collide_DecalChance) == 1 then
		self:SetLocalPos(Vector(self:GetPos().x, self:GetPos().y, self:GetPos().z + 4)) -- Because the entity is too close to the ground
		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() - (data.HitNormal*-30),
			filter = self
		})
		util.Decal(self.Collide_Decal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		//util.Decal(self.Collide_Decal,start,endpos)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce()*0.1)
end