/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 			= "base_gmodentity"
ENT.Type 			= "anim"
ENT.PrintName 		= "Rifle Ammo (Spining)"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Gives ammos"
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

local color_org  = Color( 255, 128, 0 )

hook.Add( "PreDrawHalos", "AddRifle_Ammo_Halo", function()
    halo.Add( ents.FindByClass( "sent_vj_mh_rifle_ammo_pickup*" ), color_org, 8, 8, 5 )
end )

function ENT:SpawnFunction(ply, tr)
 
        if (!tr.Hit) then return end
       
        local SpawnPos = (tr.HitPos + tr.HitNormal * 40)
        local ent = ents.Create("sent_vj_mh_rifle_ammo_pickup")
        
        ent:SetPos(SpawnPos)
        ent:Spawn()
        ent:Activate()
        ent.Planted = false


        ent.PickupGlow = ents.Create("light_dynamic")
        ent.PickupGlow:SetKeyValue("brightness", "5")
        ent.PickupGlow:SetKeyValue("distance", "90")
        ent.PickupGlow:SetLocalPos(ent:GetPos())
        ent.PickupGlow:SetLocalAngles(ent:GetAngles())
        ent.PickupGlow:Fire("Color", "255 128 0")
        ent.PickupGlow:SetParent(ent)
        ent.PickupGlow:Spawn()
        ent.PickupGlow:Activate()
        ent.PickupGlow:SetParent(ent)
        ent.PickupGlow:Fire("TurnOn", "", 0)
        ent:DeleteOnRemove(ent.PickupGlow)

        ent.CoronaOrb = ents.Create("env_sprite")
        ent.CoronaOrb:SetKeyValue("model","sprites/manhunt/corona2.vmt")
        ent.CoronaOrb:SetKeyValue("GlowProxySize","4.0")
        ent.CoronaOrb:SetKeyValue("HDRColorScale","1.0")
        ent.CoronaOrb:SetKeyValue("rendercolor","255 128 0")
        ent.CoronaOrb:SetKeyValue("renderfx","14")
        ent.CoronaOrb:SetKeyValue("rendermode","3")
        ent.CoronaOrb:SetKeyValue("renderamt","255")
        ent.CoronaOrb:SetKeyValue("disablereceiveshadows","0")
        ent.CoronaOrb:SetKeyValue("mindxlevel","0")
        ent.CoronaOrb:SetKeyValue("maxdxlevel","0")
        ent.CoronaOrb:SetKeyValue("framerate","10.0")
        ent.CoronaOrb:SetKeyValue("spawnflags","0")
        ent.CoronaOrb:SetKeyValue("scale","0.36")
        ent.CoronaOrb:SetPos(SpawnPos)
        ent.CoronaOrb:Spawn()
        ent:DeleteOnRemove(ent.CoronaOrb)

        ent.CoronaOrb2 = ents.Create("env_sprite")
        ent.CoronaOrb2:SetKeyValue("model","sprites/manhunt/halo.vmt")
        ent.CoronaOrb2:SetKeyValue("GlowProxySize","4.0")
        ent.CoronaOrb2:SetKeyValue("HDRColorScale","1.0")
        ent.CoronaOrb2:SetKeyValue("rendercolor","255 128 0")
        ent.CoronaOrb2:SetKeyValue("renderfx","14")
        ent.CoronaOrb2:SetKeyValue("rendermode","3")
        ent.CoronaOrb2:SetKeyValue("renderamt","255")
        ent.CoronaOrb2:SetKeyValue("disablereceiveshadows","0")
        ent.CoronaOrb2:SetKeyValue("mindxlevel","0")
        ent.CoronaOrb2:SetKeyValue("maxdxlevel","0")
        ent.CoronaOrb2:SetKeyValue("framerate","10.0")
        ent.CoronaOrb2:SetKeyValue("spawnflags","0")
        ent.CoronaOrb2:SetKeyValue("scale","0.52")
        ent.CoronaOrb2:SetPos(SpawnPos)
        ent.CoronaOrb2:Spawn()
        ent:DeleteOnRemove(ent.CoronaOrb2)

        ent.CoronaOrb3 = ents.Create("env_sprite")
        ent.CoronaOrb3:SetKeyValue("model","sprites/manhunt/sphere.vmt")
        ent.CoronaOrb3:SetKeyValue("GlowProxySize","4.0")
        ent.CoronaOrb3:SetKeyValue("HDRColorScale","1.0")
        ent.CoronaOrb3:SetKeyValue("rendercolor","255 128 0")
        ent.CoronaOrb3:SetKeyValue("renderfx","14")
        ent.CoronaOrb3:SetKeyValue("rendermode","3")
        ent.CoronaOrb3:SetKeyValue("renderamt","255")
        ent.CoronaOrb3:SetKeyValue("disablereceiveshadows","0")
        ent.CoronaOrb3:SetKeyValue("mindxlevel","0")
        ent.CoronaOrb3:SetKeyValue("maxdxlevel","0")
        ent.CoronaOrb3:SetKeyValue("framerate","10.0")
        ent.CoronaOrb3:SetKeyValue("spawnflags","0")
        ent.CoronaOrb3:SetKeyValue("scale","0.36")
        ent.CoronaOrb3:SetPos(SpawnPos)
        ent.CoronaOrb3:Spawn()
        ent:DeleteOnRemove(ent.CoronaOrb3)

        return ent
    end

/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()
 
        local model = ("models/manhunt/weapons/w_rifleammo.mdl")
       
        self.Entity:SetModel(model)
       
        self.Entity:PhysicsInit(SOLID_VPHYSICS)
        self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
        self.Entity:SetSolid(SOLID_VPHYSICS)
        self.Entity:DrawShadow(false)
       
        self.Entity:SetCollisionGroup(20)
       
        local phys = self.Entity:GetPhysicsObject()
       
        if (phys:IsValid()) then
                phys:Wake()
                phys:SetMass(40)
        end
 
        self.Entity:SetUseType(SIMPLE_USE)
       
        timer.Create("delay_rotating_unq"..self.Entity:GetCreationID(), 0, 1, function()  
                self.Entity:SetMoveType(MOVETYPE_NONE)
        end)
       
end
/*---------------------------------------------------------
   Name: PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data, physobj)
                               
        if (data.Speed > 80 and data.DeltaTime > 0.2) then
                self.Entity:EmitSound(Sound(""))
        end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then -- Spinning code
        function ENT:Initialize()
                self.Spin = 0
        end
 
        function ENT:Draw()
       	local Seed1 = self:GetDTFloat( 0 )
		local Seed2 = self:GetDTFloat( 1 )
		local MyPos = self:GetPos()
		local Index = self:EntIndex()
	
		for i = 1, 180 do
			local Ang = ( Index + 1337 + CurTime() ) * i --Yeah, random math makes awesome shit!
			local Size = ( 155 - i ) / 6 
			local Forward = Angle( Ang * Seed1, Ang * Seed2, 0 ):Forward()
			local Pos = MyPos + Forward * i * 0.1
		end
                self:DrawModel()
                self.Spin = self.Spin + RealFrameTime()*-46
                if self.Spin >= 360 then
                        self.Spin = -360
                end
                self:SetAngles(Angle(90,self.Spin,0))
        end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(activator, caller) -- Gives ammo when pressing the "Use" key
	if activator:IsPlayer() then
                local ammo_random = math.random(1,13)
                if ammo_random == 1 then
                        caller:GiveAmmo(6, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (6)" )
                elseif ammo_random == 2 then
                        caller:GiveAmmo(6, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (6)" )
                elseif ammo_random == 3 then
                        caller:GiveAmmo(7, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (7)" )
                elseif ammo_random == 4 then
                        caller:GiveAmmo(7, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (7)" )
                elseif ammo_random == 5 then
                        caller:GiveAmmo(9, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (9)" )
                elseif ammo_random == 6 then
                        caller:GiveAmmo(10, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (10)" )
                elseif ammo_random == 7 then
                        caller:GiveAmmo(10, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (10)" )
                elseif ammo_random == 8 then
                        caller:GiveAmmo(12, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (12)" )
                elseif ammo_random == 9 then
                        caller:GiveAmmo(14, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (14)" )
                elseif ammo_random == 10 then
                        caller:GiveAmmo(15, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (15)" )
                elseif ammo_random == 11 then
                        caller:GiveAmmo(16, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (16)" )
                elseif ammo_random == 12 then
                        caller:GiveAmmo(22, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (22)" )
                elseif ammo_random == 13 then
                        caller:GiveAmmo(32, "AR2", true)
                        activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
                        activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (32)" )
                end
		self:Remove()
	end
end