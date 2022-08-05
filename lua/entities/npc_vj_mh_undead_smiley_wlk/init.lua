AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/undead/smiley1_undead.mdl","models/manhunt/npc/undead/smiley2_undead.mdl","models/manhunt/npc/undead/smiley3_undead.mdl"}
ENT.StartHealth = 150
ENT.LNR_AllowedToStumble = true
ENT.HasLeapAttack = false
ENT.LNR_Gib = false
ENT.LNR_Dismember = false
ENT.LNR_CanBeHeadshot = true 
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.CustomBlood_Decal = {"VJ_Manhunt_Blood_DarkRed"} -- Decals to spawn when it's damaged
ENT.BloodDecalUseGMod = false -- Should use the current default decals defined by Garry's Mod? (This only applies for certain blood types only!)

function ENT:CustomOnInitialize()
	self.StartHealth = self.StartHealth * GetConVarNumber("VJ_LNR_Walker_HealthModifier")	
	self:SetHealth(self.StartHealth)
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("VJ_LNR_Walker_DamageModifier")
	self.LeapAttackDamage = self.LeapAttackDamage * GetConVarNumber("VJ_LNR_LeapDamage")

	if GetConVarNumber("VJ_LNR_Infection") == 0 then 
		self.LNR_VirusInfection = false 
	end

	if math.random(1,5) == 1 then 
        self.LNR_CanUseWeapon = true
		self:ZombieWeapons()
    end	
	
	self:SetSkin(math.random(0,2))

	if GetConVarNumber("vj_manhunt_hunters_zmb_eyeglow") == 1 then
        local color
        local c_string
        local cmd_enable = GetConVarNumber("vj_manhunt_hunters_zmb_eyeglow") // sets eye color

        if cmd_enable == 1 then // light blue
            color = Color(0,199,255,255)
            c_string = "0 199 255 255"
		end

		eyeglow1 = ents.Create("env_sprite")
		eyeglow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow1:SetKeyValue("scale","0.02")
		eyeglow1:SetKeyValue("rendermode","5")
		eyeglow1:SetKeyValue("rendercolor",c_string)
		eyeglow1:SetKeyValue("spawnflags","1") -- If animated
		eyeglow1:SetParent(self)
		eyeglow1:Fire("SetParentAttachment","RightEye",0)
		eyeglow1:Spawn()
		eyeglow1:Activate()
		util.SpriteTrail(self,2,color,true,6,6,0.125,1/(6+12)*0.5,"VJ_Base/sprites/vj_trial1.vmt")
		self:DeleteOnRemove(eyeglow1)

		eyeglow2 = ents.Create("env_sprite")
		eyeglow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow2:SetKeyValue("scale","0.02")
		eyeglow2:SetKeyValue("rendermode","5")
		eyeglow2:SetKeyValue("rendercolor",c_string)
		eyeglow2:SetKeyValue("spawnflags","1") -- If animated
		eyeglow2:SetParent(self)
		eyeglow2:Fire("SetParentAttachment","LeftEye",0)
		eyeglow2:Spawn()
		eyeglow2:Activate()
		util.SpriteTrail(self,1,color,true,6,6,0.125,1/(6+12)*0.5,"VJ_Base/sprites/vj_trial1.vmt")
		self:DeleteOnRemove(eyeglow2)
    end

	if GetConVarNumber("vj_manhunt_hunters_zmb_deathanim") == 0 then
		self.HasDeathAnimation = false
	end

	if GetConVarNumber("VJ_LNR_Alert") == 0 then 
		self.CallForHelp = false
	end

	if GetConVarNumber("vj_manhunt_hunters_zmb_faster") == 1 then 
		self.LNR_Run = true
		self.AnimTbl_Walk = {ACT_RUN}
		self.AnimTbl_Run = {ACT_RUN}
	end


	if GetConVarNumber("vj_manhunt_hunters_zmb_riser") == 1 then // If ZMB Riser cmd is on, undead will use the Rising out of dirt animation
		local random_riser = math.random(1,4)
		if random_riser == 1 then
			if self:IsDirt(self:GetPos()) then
				self:SetNoDraw(true)
				timer.Simple(0.01,function()
					self:VJ_ACT_PLAYACTIVITY("vjseq_nz_spawn_climbout_fast",true,4.55,true,0,{SequenceDuration=4.55})
					self.HasMeleeAttack = false
					timer.Simple(0.2,function()
						if self:IsValid() then
							self:SetNoDraw(false)
							self:EmitSound("vj_manhunt/vocals/zmb_vocals/spawn_dirt_0" .. math.random(0,1) .. ".wav")
							local effectdata = EffectData()
							effectdata:SetOrigin(self:GetPos())
							effectdata:SetScale(25)
							util.Effect("zombie_spawn_dirt",effectdata)
							self.HasMeleeAttack = true
						end
					end)
				end)
			end

		elseif random_riser == 2 then
			if self:IsDirt(self:GetPos()) then
				self:SetNoDraw(true)
				timer.Simple(0.01,function()
					self:VJ_ACT_PLAYACTIVITY("vjseq_nz_spawn_climbout_fast",true,4.55,true,0,{SequenceDuration=4.55})
					self.HasMeleeAttack = false
					timer.Simple(0.2,function()
						if self:IsValid() then
							self:SetNoDraw(false)
							self:EmitSound("vj_manhunt/vocals/zmb_vocals/spawn_dirt_0" .. math.random(0,1) .. ".wav")
							local effectdata = EffectData()
							effectdata:SetOrigin(self:GetPos())
							effectdata:SetScale(25)
							util.Effect("zombie_spawn_dirt",effectdata)
							self.HasMeleeAttack = true
						end
					end)
				end)
			end

		elseif random_riser == 3 then
			if self:IsDirt(self:GetPos()) then
				self:SetNoDraw(true)
				timer.Simple(0.01,function()
					self:VJ_ACT_PLAYACTIVITY("vjseq_nz_spawn_climbout_fast",true,4.55,true,0,{SequenceDuration=4.55})
					self.HasMeleeAttack = false
					timer.Simple(0.2,function()
						if self:IsValid() then
							self:SetNoDraw(false)
							self:EmitSound("vj_manhunt/vocals/zmb_vocals/spawn_dirt_0" .. math.random(0,1) .. ".wav")
							local effectdata = EffectData()
							effectdata:SetOrigin(self:GetPos())
							effectdata:SetScale(25)
							util.Effect("zombie_spawn_dirt",effectdata)
							self.HasMeleeAttack = true
						end
					end)
				end)
			end

		elseif random_riser == 4 then
			if self:IsDirt(self:GetPos()) then
				self:SetNoDraw(true)
				timer.Simple(0.01,function()
					self:VJ_ACT_PLAYACTIVITY("vjseq_nz_spawn_jump",true,1.25,true,0,{SequenceDuration=1.25})
					self.HasMeleeAttack = false
					timer.Simple(0.2,function()
						if self:IsValid() then
							self:SetNoDraw(false)
							self:EmitSound("vj_manhunt/vocals/zmb_vocals/spawn_dirt_0" .. math.random(0,1) .. ".wav")
							local effectdata = EffectData()
							effectdata:SetOrigin(self:GetPos())
							effectdata:SetScale(25)
							util.Effect("zombie_spawn_dirt",effectdata)
							self.HasMeleeAttack = true
						end
					end)
				end)
			end
		end
	end
end

function ENT:IsDirt(pos)
	local tr = util.TraceLine({
		start = pos,
		endpos = pos -Vector(0,0,40),
		filter = self,
		mask = MASK_NPCWORLDSTATIC
	})
	local mat = tr.MatType
	return tr.HitWorld && (mat == MAT_SAND || mat == MAT_DIRT || mat == MAT_FOLIAGE || mat == MAT_SLOSH || mat == MAT_GRASS || mat == 74)
end

ENT.FootSteps = {
	[MAT_ANTLION] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[MAT_BLOODYFLESH] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[MAT_CONCRETE] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fscon1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fscon2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fscon3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fscon4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fscon5.mp3"
	},
	[MAT_DIRT] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgrav1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgrav2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgrav3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgrav4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgrav5.mp3"
	},
	[MAT_FLESH] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[MAT_GRATE] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal5.mp3"
	},
	[MAT_ALIENFLESH] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[74] = { -- Snow
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud4.mp3"
	},
	[MAT_PLASTIC] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav"
	},
	[MAT_METAL] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal5.mp3"
	},
	[MAT_SAND] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmud4.mp3"
	},
	[MAT_FOLIAGE] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[MAT_COMPUTER] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav"
	},
	[MAT_SLOSH] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fswatr1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswatr2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswatr3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswatr4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswatr5.mp3"
	},
	[MAT_TILE] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fstile1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fstile2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fstile3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fstile4.mp3"
	},
	[85] = { -- Grass
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsgras5.mp3"
	},
	[MAT_VENT] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fsmetal5.mp3"
	},
	[MAT_WOOD] = {
		"vj_manhunt/vocals/shared_sfx_hunters/fswood1.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswood2.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswood3.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswood4.mp3",
		"vj_manhunt/vocals/shared_sfx_hunters/fswood5.mp3"
	},
	[MAT_GLASS] = {
		"physics/glass/glass_sheet_step1.wav",
		"physics/glass/glass_sheet_step2.wav",
		"physics/glass/glass_sheet_step3.wav",
		"physics/glass/glass_sheet_step4.wav"
	}
}

local SoundTbl_DeathGib =
{
	"vj_manhunt/vocals/zmb_vocals/headshot_0.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_1.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_2.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_3.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_4.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_5.wav",
	"vj_manhunt/vocals/zmb_vocals/headshot_6.wav"
} -- When the npc gibs, play a dramatic death sound instead of a generic death 

function ENT:CustomOnPreInitialize() -- Picks random voices once a SNPC is spawned.
    local zmb_cod_voices = math.random(1,2)
	if zmb_cod_voices == 1 then --  Classic Call Of Duty Zombie sounds
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack20.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack22.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/behind/behind1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/behind/behind2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/behind/behind3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/behind/behind4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/behind/behind5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/taunt/taunt7.wav"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient17.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient18.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient19.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient20.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient21.wav"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient17.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient18.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient19.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient20.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient21.wav"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient17.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient18.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient19.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient20.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/amb/ambient21.wav"
		}
		self.SoundTbl_BeforeMeleeAttack = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack17.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack18.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack19.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack20.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack21.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack22.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack23.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack24.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack25.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack26.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack27.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack28.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack29.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack30.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack31.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack/attack32.wav"
		}
		self.SoundTbl_Death =
		{
			"vj_manhunt/vocals/zmb_vocals/classic/death/death1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/death/death10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/elec/elec6.wav"
		}
		self.SoundTbl_MeleeAttack =
		{
			"vj_manhunt/vocals/zmb_vocals/classic/attack1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack3.wav"
		}
		self.SoundTbl_MeleeAttackMiss =
		{
			"vj_manhunt/vocals/zmb_vocals/classic/attack1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack3.wav"
		}
	elseif zmb_cod_voices == 2 then --  Modern Call Of Duty Zombie sounds
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_62.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_63.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_64.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_65.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_66.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/taunt/zm_mod.all_67.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_89.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_93.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_97.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_1.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_2.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_3.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_4.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_5.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_6.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_26.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_27.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_28.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_29.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_30.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_31.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_32.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_33.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_34.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_35.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_36.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_37.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_38.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_39.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_40.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_41.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_42.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_43.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_44.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_45.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_46.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_47.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_48.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_49.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_50.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_51.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_52.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_53.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_54.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_55.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_56.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_57.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_58.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_59.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_60.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_61.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_26.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_27.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_28.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_29.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_30.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_31.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_32.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_33.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_34.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_35.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_36.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_37.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_38.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_39.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_40.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_41.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_42.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_43.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_44.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_45.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_46.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_47.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_48.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_49.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_50.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_51.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_52.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_53.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_54.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_55.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_56.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_57.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_58.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_59.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_60.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_61.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_26.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_27.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_28.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_29.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_30.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_31.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_32.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_33.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_34.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_35.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_36.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_37.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_38.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_39.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_40.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_41.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_42.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_43.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_44.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_45.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_46.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_47.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_48.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_49.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_50.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_51.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_52.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_53.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_54.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_55.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_56.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_57.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_58.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_59.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_60.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/amb/zm_mod.all_61.mp3"
		}
		self.SoundTbl_BeforeMeleeAttack = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_1.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_2.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_3.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_4.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_5.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_6.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_7.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_8.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_9.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_10.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_11.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_12.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_13.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_14.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_15.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_16.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_17.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_18.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_19.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_20.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_21.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_22.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_23.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_24.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/attack/zm_mod.all_25.mp3"
		}
		self.SoundTbl_Death =
		{
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_68.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_69.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_70.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_71.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_72.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_73.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_74.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_75.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_76.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_77.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_78.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_79.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_80.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_81.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_82.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/death/zm_mod.all_83.mp3"
		}
		self.SoundTbl_MeleeAttack =
		{
			"vj_bmce_zmb/vocals/zm_mod.all_112.wav",
			"vj_bmce_zmb/vocals/zm_mod.all_113.wav",
			"vj_bmce_zmb/vocals/zm_mod.all_114.wav",
			"vj_bmce_zmb/vocals/zm_mod.all_115.wav",
			"vj_bmce_zmb/vocals/zm_mod.all_116.wav",
			"vj_bmce_zmb/vocals/zm_mod.all_117.wav"
		}
		self.SoundTbl_MeleeAttackMiss =
		{
			"vj_manhunt/vocals/zmb_vocals/classic/attack1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/attack3.wav"
		}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieWeapons()
    if GetConVarNumber("VJ_LNR_Weapons") == 0 then return end
    if self.LNR_CanUseWeapon == true then
	self.MeleeAttackDamage = math.Rand(10,20) * GetConVarNumber("VJ_LNR_Walker_DamageModifier")
	local Weapon = math.random(1,6)
	if Weapon == 1 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/bj_hit.wav",
				"vj_manhunt/weapons/melee/bj_hit1.wav",
				"vj_manhunt/weapons/melee/bj_hit2.wav",
				"vj_manhunt/weapons/melee/bj_hit3.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_melee_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/Manhunt/weapons/w_blackjack.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)

	elseif Weapon == 2 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/bat_w_hit.wav",
				"vj_manhunt/weapons/melee/bat_w_hit1.wav",
				"vj_manhunt/weapons/melee/bat_w_hit2.wav",
				"vj_manhunt/weapons/melee/bat_w_hit3.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_melee_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/Manhunt/weapons/w_wbat.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)

	elseif Weapon == 3 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/mh_blade_hit1.wav",
				"vj_manhunt/weapons/melee/mh_blade_hit2.wav",
				"vj_manhunt/weapons/melee/mh_blade_hit1.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_blade_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/manhunt/weapons/w_cleaver.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)
			
	elseif Weapon == 4 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/hammer_hit.wav",
				"vj_manhunt/weapons/melee/hammer_hit1.wav",
				"vj_manhunt/weapons/melee/hammer_hit2.wav",
				"vj_manhunt/weapons/melee/hammer_hit3.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_melee_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/manhunt/weapons/w_hammer.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)

		elseif Weapon == 5 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/mh_melee_hit1.wav",
				"vj_manhunt/weapons/melee/mh_melee_hit2.wav",
				"vj_manhunt/weapons/melee/mh_melee_hit1.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_melee_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/manhunt/weapons/w_sawnoff.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)

		elseif Weapon == 6 then
			self.SoundTbl_MeleeAttack = 
			{
				"vj_manhunt/weapons/melee/mh_melee_hit1.wav",
				"vj_manhunt/weapons/melee/mh_melee_hit2.wav",
				"vj_manhunt/weapons/melee/mh_melee_hit1.wav"
			}
			self.SoundTbl_MeleeAttackMiss = 
			{
				"vj_manhunt/weapons/melee/mh_melee_miss.wav"
			}
			self.ExtraGunModel1 = ents.Create("prop_physics")
			self.ExtraGunModel1:SetModel("models/manhunt/weapons/w_glock.mdl")
			self.ExtraGunModel1:SetLocalPos(self:GetPos())
			//self.ExtraGunModel1:SetPos(self:GetPos())
			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","LHand")
			self.ExtraGunModel1:Fire("SetParentAttachment","RHand")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)
		end
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/undead/smiley1_undead.mdl" then
			self:SetBodygroup(1,math.random(1,4))
		end
		if self:GetModel() == "models/manhunt/npc/undead/smiley2_undead.mdl" then
			self:SetBodygroup(1,math.random(1,4))
		end
		if self:GetModel() == "models/manhunt/npc/undead/smiley3_undead.mdl" then
			self:SetBodygroup(1,math.random(1,4))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Reduce head damage
	if hitgroup == HITGROUP_HEAD then // If the head is damaged, increase dmg by 100%
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self, "vj_manhunt/vocals/zmb_vocals/headshot_"..math.random(0,6)..".wav", 70) end
		dmginfo:ScaleDamage(2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	if self:IsDefaultGibDamageType(dmginfo:GetDamageType()) then end
		
	local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:LocalToWorld(Vector(0,0,50)))
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(32)
		util.Effect("VJ_Blood1",bloodeffect)
		
	local bloodspray = EffectData()
		bloodspray:SetOrigin(self:LocalToWorld(Vector(0,0,50)))
		bloodspray:SetScale(5)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)

	local gibchance = math.random(1,4)

	if hitgroup == HITGROUP_HEAD then
		if gibchance == 1 then
			self:PlaySoundSystem("Death", SoundTbl_DeathGib)
			self.HasDeathAnimation = false
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/1.mdl",{Pos=self:LocalToWorld(Vector(0,0,68)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/1.mdl",{Pos=self:LocalToWorld(Vector(0,0,68)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/2.mdl",{Pos=self:LocalToWorld(Vector(0,4,60)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/2.mdl",{Pos=self:LocalToWorld(Vector(0,4,60)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/3.mdl",{Pos=self:LocalToWorld(Vector(0,0,63)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/3.mdl",{Pos=self:LocalToWorld(Vector(0,0,63)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/4.mdl",{Pos=self:LocalToWorld(Vector(0,3,65)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/4.mdl",{Pos=self:LocalToWorld(Vector(0,3,65)),Ang=self:GetAngles()+Angle(0,-90,0)})
			self:CreateGibEntity("obj_vj_gib_manhunt","models/gibs/humans/eye_gib.mdl",{Pos=self:LocalToWorld(Vector(0,0,65)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(150,250)+self:GetForward()*math.Rand(-200,200)})
			self:Gibs("headgib")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------