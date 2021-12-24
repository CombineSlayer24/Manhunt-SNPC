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
	halo.Add( ents.FindByClass( "sent_vj_rifle_ammo_pickup*" ), color_org, 8, 8, 5 )
end )

function ENT:SpawnFunction(ply, tr)
 
        if (!tr.Hit) then return end
       
        local SpawnPos = (tr.HitPos + tr.HitNormal * 50)
        local ent = ents.Create("sent_vj_rifle_ammo_pickup")
        
        ent:SetPos(SpawnPos)
        ent:Spawn()
        ent:Activate()
        ent.Planted = false

        
        --[[Can't get this fucking sprite to delete itself after being picked up.--]]

        -- self.CoronaOrb = ents.Create("env_sprite")
        -- self.CoronaOrb:SetKeyValue("model","sprites/manhunt/corona2.vmt")
        -- self.CoronaOrb:SetKeyValue("GlowProxySize","2.0")
        -- self.CoronaOrb:SetKeyValue("HDRColorScale","1.0")
        -- self.CoronaOrb:SetKeyValue("rendercolor","255 255 255")
        -- self.CoronaOrb:SetKeyValue("renderfx","14")
        -- self.CoronaOrb:SetKeyValue("rendermode","3")
        -- self.CoronaOrb:SetKeyValue("renderamt","255")
        -- self.CoronaOrb:SetKeyValue("disablereceiveshadows","0")
        -- self.CoronaOrb:SetKeyValue("mindxlevel","0")
        -- self.CoronaOrb:SetKeyValue("maxdxlevel","0")
        -- self.CoronaOrb:SetKeyValue("framerate","10.0")
        -- self.CoronaOrb:SetKeyValue("spawnflags","0")
        -- self.CoronaOrb:SetKeyValue("scale","0.5")
        -- self.CoronaOrb:SetPos(SpawnPos)
        -- self.CoronaOrb:Spawn()
        -- self:DeleteOnRemove(self.CoronaOrb)
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
       
        timer.Create("delay_rotating_unq"..self.Entity:GetCreationID(), 0.15, 1, function()  
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
if CLIENT then -- Light glow code
		function ENT:Think()
		local dlight = DynamicLight( self:EntIndex() )
		if ( dlight ) then
		dlight.Pos = self:GetPos()
		dlight.r = 255
		dlight.g = 128
		dlight.b = 0
		dlight.Brightness = 1.5
		dlight.Size = 200
		dlight.Decay = 0
		dlight.DieTime = CurTime() + 0
	   end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(activator, caller) -- Gives health upon pressing "Use" key (Figure out how to limit it's max health.)
	if activator:IsPlayer() then
        caller:GiveAmmo(32, "AR2", true)
		activator:EmitSound(Sound("weapons/weapon_pickup_mh.wav"), 70, 100)
		activator:PrintMessage(HUD_PRINTTALK, "Rifle Ammo (32)" )
		self:Remove()
	end
end