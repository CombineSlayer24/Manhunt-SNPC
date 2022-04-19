/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 			= "base_gmodentity"
ENT.Type 			= "anim"
ENT.PrintName 		= "Pills Pickup"
ENT.Author 			= "Pyri"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Gives half % of health."
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

local color_white  = Color( 255, 255, 255 )

hook.Add( "PreDrawHalos", "AddPillsHalo", function()
    halo.Add( ents.FindByClass( "sent_vj_mh_pills_pickup*" ), color_white, 8, 8, 5 )
end )


function ENT:SpawnFunction(ply, tr)
    if (!tr.Hit) then return end
    
    local SpawnPos = (tr.HitPos + tr.HitNormal * 46)
    local SpawnPos_Corona = (tr.HitPos + tr.HitNormal * 48)
    local ent = ents.Create("sent_vj_mh_pills_pickup")
    
    ent:SetPos(SpawnPos)
    ent:Spawn()
    ent:Activate()
    ent:SetModelScale( ent:GetModelScale() * 1.62, 0 )
    ent.Planted = false

    ent.PickupGlow = ents.Create("light_dynamic")
    ent.PickupGlow:SetKeyValue("brightness", "5.25")
    ent.PickupGlow:SetKeyValue("distance", "105")
    ent.PickupGlow:SetLocalPos(ent:GetPos())
    ent.PickupGlow:SetLocalAngles(ent:GetAngles())
    ent.PickupGlow:Fire("Color", "255 255 255")
    ent.PickupGlow:SetParent(ent)
    ent.PickupGlow:Spawn()
    ent.PickupGlow:Activate()
    ent.PickupGlow:SetParent(ent)
    ent.PickupGlow:Fire("TurnOn", "", 0)
    ent:DeleteOnRemove(ent.PickupGlow)

    ent.CoronaOrb = ents.Create("env_sprite")
    ent.CoronaOrb:SetKeyValue("model","sprites/manhunt/corona2.vmt")
    ent.CoronaOrb:SetKeyValue("GlowProxySize","2.0")
    ent.CoronaOrb:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb:SetKeyValue("rendercolor","255 255 255")
    ent.CoronaOrb:SetKeyValue("renderfx","14")
    ent.CoronaOrb:SetKeyValue("rendermode","3")
    ent.CoronaOrb:SetKeyValue("renderamt","255")
    ent.CoronaOrb:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb:SetKeyValue("framerate","10.0")
    ent.CoronaOrb:SetKeyValue("spawnflags","0")
    ent.CoronaOrb:SetKeyValue("scale","0.5")
    ent.CoronaOrb:SetPos(SpawnPos_Corona)
    ent.CoronaOrb:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb)

    ent.CoronaOrb2 = ents.Create("env_sprite")
    ent.CoronaOrb2:SetKeyValue("model","sprites/manhunt/halo.vmt")
    ent.CoronaOrb2:SetKeyValue("GlowProxySize","2.0")
    ent.CoronaOrb2:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb2:SetKeyValue("rendercolor","255 255 255")
    ent.CoronaOrb2:SetKeyValue("renderfx","0")
    ent.CoronaOrb2:SetKeyValue("rendermode","5")
    ent.CoronaOrb2:SetKeyValue("renderamt","255")
    ent.CoronaOrb2:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb2:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb2:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb2:SetKeyValue("framerate","10.0")
    ent.CoronaOrb2:SetKeyValue("spawnflags","0")
    ent.CoronaOrb2:SetKeyValue("scale","0.52")
    ent.CoronaOrb2:SetPos(SpawnPos_Corona)
    ent.CoronaOrb2:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb2)

    ent.CoronaOrb3 = ents.Create("env_sprite")
    ent.CoronaOrb3:SetKeyValue("model","sprites/manhunt/sphere.vmt")
    ent.CoronaOrb3:SetKeyValue("GlowProxySize","2.0")
    ent.CoronaOrb3:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb3:SetKeyValue("rendercolor","255 255 255")
    ent.CoronaOrb3:SetKeyValue("renderfx","14")
    ent.CoronaOrb3:SetKeyValue("rendermode","3")
    ent.CoronaOrb3:SetKeyValue("renderamt","255")
    ent.CoronaOrb3:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb3:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb3:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb3:SetKeyValue("framerate","10.0")
    ent.CoronaOrb3:SetKeyValue("spawnflags","0")
    ent.CoronaOrb3:SetKeyValue("scale","0.5")
    ent.CoronaOrb3:SetPos(SpawnPos_Corona)
    ent.CoronaOrb3:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb3)

    return ent
end
/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()
 
    local model = "models/manhunt/weapons/w_pills.mdl"

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
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then -- Spinning code
    function ENT:Initialize()
        self.Spin = 0
    end

    function ENT:Draw()
        self:DrawModel()
        self.Spin = self.Spin + FrameTime()*-60
        self:SetAngles(Angle(125,self.Spin,0))
        if self.Spin >= 360 then
            self.Spin = -360
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(activator) -- Gives health upon pressing "Use" key
    if (activator:Health() < activator:GetMaxHealth()) then
        activator:SetHealth(math.Clamp( activator:Health() + 50, 0, activator:GetMaxHealth())) // if our health is < than 100, we can take health and be capped at our max health.
        activator:PrintMessage(HUD_PRINTCENTER, "Painkillers (50% health restored)")
        activator:EmitSound(Sound("weapons/pickup_hel.wav"), 70, 100)
        self:Remove()
    else
        if (activator:Health() + activator:GetMaxHealth()) then // if our health is max, we show a message why we can't pick it up
            activator:PrintMessage(HUD_PRINTCENTER, "Health full!" )
            activator:EmitSound(Sound("weapons/pickup_deny.wav"), 100, 100)
        end
    end
end