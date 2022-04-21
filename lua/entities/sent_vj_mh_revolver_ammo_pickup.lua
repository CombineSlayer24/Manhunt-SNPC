/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 			= "base_gmodentity"
ENT.Type 			= "anim"
ENT.PrintName 		= ".357 Ammo"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Gives ammos"
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

local color_org  = Color( 255, 128, 0 )

hook.Add( "PreDrawHalos", "AddPistol_Revolver_Ammo_Halo", function()
    halo.Add( ents.FindByClass( "sent_vj_mh_revolver_ammo_pickup*" ), color_org, 8, 8, 5 )
end )

function ENT:SpawnFunction(ply, tr)
 
    if (!tr.Hit) then return end
    
    local SpawnPos = (tr.HitPos + tr.HitNormal * 40)
    local ent = ents.Create("sent_vj_mh_revolver_ammo_pickup")
    
    ent:SetPos(SpawnPos)
    ent:Spawn()
    ent:Activate()
    ent.Planted = false


    ent.PickupGlow = ents.Create("light_dynamic")
    ent.PickupGlow:SetKeyValue("brightness", "4") -- 5 old
    ent.PickupGlow:SetKeyValue("distance", "80") -- 80 old
    ent.PickupGlow:SetLocalPos(ent:GetPos() + ent:GetRight() * -3)
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
    ent.CoronaOrb:SetKeyValue("GlowProxySize","3.0")
    ent.CoronaOrb:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb:SetKeyValue("rendercolor","255 128 0")
    ent.CoronaOrb:SetKeyValue("renderfx","14")
    ent.CoronaOrb:SetKeyValue("rendermode","3")
    ent.CoronaOrb:SetKeyValue("renderamt","200")
    ent.CoronaOrb:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb:SetKeyValue("framerate","10.0")
    ent.CoronaOrb:SetKeyValue("spawnflags","0")
    ent.CoronaOrb:SetKeyValue("scale","0.36")
    ent.CoronaOrb:SetParent(ent)
    ent.CoronaOrb:SetPos(SpawnPos)
    ent.CoronaOrb:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb)

    ent.CoronaOrb2 = ents.Create("env_sprite")
    ent.CoronaOrb2:SetKeyValue("model","sprites/manhunt/halo.vmt")
    ent.CoronaOrb2:SetKeyValue("GlowProxySize","4.0")
    ent.CoronaOrb2:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb2:SetKeyValue("rendercolor","255 128 0")
    ent.CoronaOrb2:SetKeyValue("renderfx","15")
    ent.CoronaOrb2:SetKeyValue("rendermode","9")
    ent.CoronaOrb2:SetKeyValue("renderamt","255")
    ent.CoronaOrb2:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb2:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb2:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb2:SetKeyValue("framerate","10.0")
    ent.CoronaOrb2:SetKeyValue("spawnflags","0")
    ent.CoronaOrb2:SetKeyValue("scale","0.52")
    ent.CoronaOrb2:SetParent(ent)
    ent.CoronaOrb2:SetPos(SpawnPos)
    ent.CoronaOrb2:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb2)

    ent.CoronaOrb3 = ents.Create("env_sprite")
    ent.CoronaOrb3:SetKeyValue("model","sprites/manhunt/sphere.vmt")
    ent.CoronaOrb3:SetKeyValue("GlowProxySize","3.0")
    ent.CoronaOrb3:SetKeyValue("HDRColorScale","1.0")
    ent.CoronaOrb3:SetKeyValue("rendercolor","255 128 0")
    ent.CoronaOrb3:SetKeyValue("renderfx","14")
    ent.CoronaOrb3:SetKeyValue("rendermode","3")
    ent.CoronaOrb3:SetKeyValue("renderamt","200")
    ent.CoronaOrb3:SetKeyValue("disablereceiveshadows","0")
    ent.CoronaOrb3:SetKeyValue("mindxlevel","0")
    ent.CoronaOrb3:SetKeyValue("maxdxlevel","0")
    ent.CoronaOrb3:SetKeyValue("framerate","10.0")
    ent.CoronaOrb3:SetKeyValue("spawnflags","0")
    ent.CoronaOrb3:SetKeyValue("scale","0.36")
    ent.CoronaOrb3:SetParent(ent)
    ent.CoronaOrb3:SetPos(SpawnPos)
    ent.CoronaOrb3:Spawn()
    ent:DeleteOnRemove(ent.CoronaOrb3)

    return ent
end
/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

    local model = "models/manhunt/weapons/w_pistolammo.mdl"
    self.Entity:SetModel(model)

    self.Entity:PhysicsInit(SOLID_VPHYSICS)
    self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
    self.Entity:SetSolid(SOLID_VPHYSICS)
    self.Entity:DrawShadow(false)
    self.Entity:SetCollisionGroup(1)

    self.Entity:SetTrigger(true) -- Used for ENT:Touch(ply)
    self.TouchDelay = 0 -- Used for ENT:Touch(ply)

    local phys = self.Entity:GetPhysicsObject()

    if (phys:IsValid()) then
        phys:Wake()
        phys:SetMass(40)
    end

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
        self.Spin = self.Spin + FrameTime()*-40
        self:SetAngles(Angle(90,self.Spin,0))
        if self.Spin >= 360 then
            self.Spin = -360
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Touch(ply) -- when we touch this, pick it up
    if ply:IsPlayer() and ply:GetMoveType() == MOVETYPE_NOCLIP then // if player is in noclip, deny them.
        if CurTime() <= self.TouchDelay then return end
        self.TouchDelay = CurTime() + 1.25
        ply:PrintMessage(HUD_PRINTCENTER, "You cannot pick this up while in Noclip!")
        ply:EmitSound(Sound("weapons/pickup_deny_nc.wav"), 70, 100)
        return 
    end

	if ply:IsPlayer() then
        local ammo_random = math.random(1,17)
        if ammo_random == 1 then
            ply:GiveAmmo(1, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (1)" )
        elseif ammo_random == 2 then
            ply:GiveAmmo(1, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (1)" )
        elseif ammo_random == 3 then
            ply:GiveAmmo(2, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (2)" )
        elseif ammo_random == 4 then
            ply:GiveAmmo(2, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (2)" )
        elseif ammo_random == 5 then
            ply:GiveAmmo(3, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (3)" )
        elseif ammo_random == 6 then
            ply:GiveAmmo(3, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (3)" )
        elseif ammo_random == 7 then
            ply:GiveAmmo(4, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (4)" )
        elseif ammo_random == 8 then
            ply:GiveAmmo(4, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (4)" )
        elseif ammo_random == 9 then
            ply:GiveAmmo(5, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (5)" )
        elseif ammo_random == 10 then
            ply:GiveAmmo(5, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (5)" )
        elseif ammo_random == 11 then
            ply:GiveAmmo(6, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (6)" )
        elseif ammo_random == 12 then
            ply:GiveAmmo(6, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (6)" )
        elseif ammo_random == 13 then
            ply:GiveAmmo(7, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (7)" )
        elseif ammo_random == 14 then
            ply:GiveAmmo(8, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (8)" )
        elseif ammo_random == 15 then
            ply:GiveAmmo(9, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (9)" )
        elseif ammo_random == 16 then
            ply:GiveAmmo(10, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (10)" )
        elseif ammo_random == 17 then
            ply:GiveAmmo(12, "357", true)
            ply:EmitSound(Sound("weapons/pickup_wep.wav"), 70, 100)
            ply:PrintMessage(HUD_PRINTTALK, ".357 Ammo (12)" )
        end
		self:Remove()
	end
end