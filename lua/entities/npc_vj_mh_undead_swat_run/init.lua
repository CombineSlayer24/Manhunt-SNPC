AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.AnimTbl_Walk = {ACT_RUN}
ENT.AnimTbl_Run = {ACT_RUN}
ENT.LNR_AllowedToStumble = true
ENT.LNR_Gib = false
ENT.LNR_Dismember = false
ENT.LNR_CanBeHeadshot = true 
ENT.LNR_VirusInfection = true
ENT.LNR_Infected = true
ENT.LNR_SuperSprinter = false
ENT.LNR_Crawler = false
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.CustomBlood_Decal = {"VJ_Manhunt_Blood_DarkRed"} -- Decals to spawn when it's damaged
ENT.BloodDecalUseGMod = false -- Should use the current default decals defined by Garry's Mod? (This only applies for certain blood types only!)
ENT.Model = {"models/manhunt/npc/undead/swat1_undead.mdl","models/manhunt/npc/undead/swat2_undead.mdl"}
ENT.LNR_Gibbed = false
ENT.CrawlerVocals = nil

function ENT:CustomOnInitialize()

	self:Zombie_Difficulty()

	self:SetSkin(math.random(3,5))

	if GetConVarNumber("vj_manhunt_hunters_zmb_eyeglow") == 1 then
        local color
        local c_string
        local cmd_enable = GetConVarNumber("vj_manhunt_hunters_zmb_eyeglow") // sets eye color

        if cmd_enable == 1 then // red
            color = Color(255,0,0,255)
            c_string = "255 0 0 255"
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

	if GetConVar("VJ_LNR_Crawl"):GetInt() == 1 then
		if math.random(1,5) == 1 then 
		   self.LNR_Crawler = true
		   self:SetCrawler()
	   end
	end

	if GetConVar("VJ_LNR_MeleeWeapons"):GetInt() == 1 then
		if math.random(1,5) == 1 && !self.LNR_Crawler then 
		   self.LNR_CanUseWeapon = true
		   self:ZombieWeapons()
	   end
	end

	if GetConVar("VJ_LNR_DeathAnimations"):GetInt() == 0 then 
		self.HasDeathAnimation = false	
	end
	if GetConVar("VJ_LNR_Alert"):GetInt() == 0 then 
		self.CallForHelp = false
	end
	if GetConVar("VJ_LNR_BreakDoors"):GetInt() == 1 then
		self.LNR_CanBreakDoors = true	 
		self.CanOpenDoors = false
	end

	if GetConVarNumber("vj_manhunt_hunters_zmb_faster") == 0 then 
		local random_supersprint = math.random(0,24)
		if random_supersprint == 0 && !self.LNR_Crawler then // Random super sprinter
			self.AnimTbl_Run = {ACT_RUN}
		elseif random_supersprint == 8 && !self.LNR_Crawler then // supe sprint
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif random_supersprint == 24 && !self.LNR_Crawler then // super sonic sprint
			self.LNR_SuperSprinter = true
			self.AnimTbl_Run = {ACT_RUN_AIM}
		end
	end	

	if GetConVarNumber("vj_manhunt_hunters_zmb_faster") == 1 then 
		local sprint_anim = math.random(1,8)
		if sprint_anim == 1 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 2 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 3 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 4 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 5 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 6 && !self.LNR_Crawler then
			self.AnimTbl_Run = {ACT_SPRINT}
		elseif sprint_anim == 7 && !self.LNR_Crawler then
			self.LNR_SuperSprinter = true
			self.AnimTbl_Run = {ACT_RUN_AIM}
		elseif sprint_anim == 8 && !self.LNR_Crawler then // super sonic sprint
			self.LNR_SuperSprinter = true
			self.AnimTbl_Run = {ACT_RUN_AIM}
		end
	end
	
	if GetConVarNumber("vj_manhunt_hunters_zmb_riser") == 1 then // If ZMB Riser cmd is on, undead will use the Rising out of dirt animation
		local random_riser = math.random(1,5)
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

		elseif random_riser == 5 then
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

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "infection_step" && self:IsOnGround() then
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	end
    if key == "step" then
		VJ_EmitSound(self,"npc/zombie/foot"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))			
	end	
	if key == "slide" then
		VJ_EmitSound(self,"vj_manhunt/vocals/zmb_vocals/extras/foot_Slide_00.wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if key == "crawl" then
		VJ_EmitSound(self,"vj_manhunt/vocals/zmb_vocals/extras/crawl_0"..math.random(3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if key == "crawl" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if key == "climb" then
		VJ_EmitSound(self,"player/footsteps/ladder"..math.random(1,4)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end		
	if key == "attack" then
		self:MeleeAttackCode()		
	end		
	if key == "death" then
		VJ_EmitSound(self,"physics/body/body_medium_impact_soft"..math.random(1,7)..".wav",75,100)
	end
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self,"ambient/water/water_splash"..math.random(1,3)..".wav",75,100)
	end	
	if key == "break_door" then
		if IsValid(self.LNR_DoorToBreak) then
		//VJ_CreateSound(self,self.SoundTbl_BeforeMeleeAttack,self.BeforeMeleeAttackSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a, self.BeforeMeleeAttackSoundPitch.b))
		VJ_EmitSound(self,"vj_manhunt/vocals/zmb_vocals/extras/snap_0"..math.random(5)..".wav",85,100)
		local doorDmg = self.MeleeAttackDamage
		local door = self.LNR_DoorToBreak
		if door.DoorHealth == nil then
			door.DoorHealth = 200 - doorDmg
		else
			door.DoorHealth = door.DoorHealth - doorDmg
		end
		if door.DoorHealth <= 0 then
			//door:EmitSound("physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
			door:EmitSound("vj_manhunt/vocals/zmb_vocals/extras/slam_0"..math.random(5)..".wav",90,100)
			ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)
			ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
			door:Remove()
            local doorgibs = ents.Create("prop_dynamic")
            doorgibs:SetPos(door:GetPos())
            doorgibs:SetModel("models/props_c17/FurnitureDresser001a.mdl")
            doorgibs:Spawn()
            doorgibs:TakeDamage(9999)
            doorgibs:Fire("break")
			end
		end
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Difficulty()
	if GetConVar("VJ_LNR_Difficulty"):GetInt() == 1 then // Easy
	   self.StartHealth = 175
	   self.MeleeAttackDamage = math.Rand(5,10) 
	if self.LNR_CanUseWeapon then self.MeleeAttackDamage = math.Rand(10,15) end		
end
	if GetConVar("VJ_LNR_Difficulty"):GetInt() == 2 then // Normal
	   self.StartHealth = 225		
	   self.MeleeAttackDamage = math.Rand(10,15)
	if self.LNR_CanUseWeapon then self.MeleeAttackDamage = math.Rand(15,20) end
end		
	if GetConVar("VJ_LNR_Difficulty"):GetInt() == 3 then // Hard
	   self.StartHealth = 275	
	   self.MeleeAttackDamage = math.Rand(15,20)
	if self.LNR_CanUseWeapon then self.MeleeAttackDamage = math.Rand(20,25) end
end
	if GetConVar("VJ_LNR_Difficulty"):GetInt() == 4 then // Nightmare
	   self.StartHealth = 325
	   self.MeleeAttackDamage = math.Rand(20,25)
	if self.LNR_CanUseWeapon then self.MeleeAttackDamage = math.Rand(25,30) end
end
	if GetConVar("VJ_LNR_Difficulty"):GetInt() == 5 then // Apocalypse
	   self.StartHealth = 350
	   self.MeleeAttackDamage = math.Rand(25,30) 
	if self.LNR_CanUseWeapon then self.MeleeAttackDamage = math.Rand(30,35) end		
end	
	   self:SetHealth(self.StartHealth)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetCrawler()
	self.CrawlerVocals = 1
	self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	self.AnimTbl_Walk = {ACT_WALK_AGITATED}
	self.AnimTbl_Run = {ACT_WALK_AGITATED}
	self.NextSoundTime_Suppressing = VJ_Set(7, 9)
	self.SuppressingSoundChance = 1
	self.SoundTbl_Alert = 
	{
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl1.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl2.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl3.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl4.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl5.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl6.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl7.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl8.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl9.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl10.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl11.wav"
	}
	self.SoundTbl_Idle = 
	{
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl1.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl2.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl3.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl4.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl5.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl6.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl7.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl8.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl9.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl10.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl11.wav"
	}
	self.SoundTbl_CombatIdle = 
	{
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl1.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl2.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl3.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl4.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl5.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl6.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl7.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl8.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl9.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl10.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl11.wav"
	}
	self.SoundTbl_Suppressing = 
	{
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl1.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl2.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl3.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl4.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl5.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl6.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl7.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl8.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl9.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl10.wav",
		"vj_manhunt/vocals/zmb_vocals/classic/crawl/crawl11.wav"
	}
    self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))	
    self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -10), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(5, 0, -1), 
}
    self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))
end	
---------------------------------------------------------------------------------------------------------------------------------------------
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
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint17.wav"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint1.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint2.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint3.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint4.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint5.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint6.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint7.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint8.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint9.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint10.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint11.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint12.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint13.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint14.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint15.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint16.wav",
			"vj_manhunt/vocals/zmb_vocals/classic/sprint/sprint17.wav"
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
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_84.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_85.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_86.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_87.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_88.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_89.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_90.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_91.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_92.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_93.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_94.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_95.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_96.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_97.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_98.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_99.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_100.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_101.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_102.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_103.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_104.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_105.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_106.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_107.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_108.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_109.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_110.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_111.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_84.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_85.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_86.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_87.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_88.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_89.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_90.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_91.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_92.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_93.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_94.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_95.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_96.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_97.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_98.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_99.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_100.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_101.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_102.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_103.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_104.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_105.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_106.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_107.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_108.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_109.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_110.mp3",
			"vj_manhunt/vocals/zmb_vocals/modern/sprint/zm_mod.all_111.mp3"
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
    if GetConVar("VJ_LNR_MeleeWeapons"):GetInt() == 0 or self.LNR_Crawler then self.LNR_CanUseWeapon = false return end
    if self.LNR_CanUseWeapon then
		local Weapon = math.random(1,5)
		self.WeaponModel = ents.Create("prop_physics")	
		if Weapon == 1 then
			self.WeaponModel:SetModel("models/Manhunt/weapons/w_deagle.mdl")
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
		elseif Weapon == 2 then
			self.WeaponModel:SetModel("models/Manhunt/weapons/w_nightstick.mdl")
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
		elseif Weapon == 3 then
			self.WeaponModel:SetModel("models/Manhunt/weapons/w_uzi.mdl")
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
		elseif Weapon == 4 then
			self.WeaponModel:SetModel("models/Manhunt/weapons/w_shotgun.mdl")
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
		elseif Weapon == 5 then
			self.WeaponModel:SetModel("models/Manhunt/weapons/w_deagle.mdl")
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
		end
		self.WeaponModel:SetLocalPos(self:GetPos())
		self.WeaponModel:SetLocalAngles(self:GetAngles())			
		self.WeaponModel:SetOwner(self)
		self.WeaponModel:SetParent(self)
		self.WeaponModel:Fire("SetParentAttachmentMaintainOffset","LHand")
		self.WeaponModel:Fire("SetParentAttachment","RHand")
		self.WeaponModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self.WeaponModel:Spawn()
		self.WeaponModel:Activate()
		self.WeaponModel:SetSolid(SOLID_NONE)
		self.WeaponModel:AddEffects(EF_BONEMERGE)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)		
	if self:GetActivity() == ACT_GLIDE or self.LNR_Crawler or self.LNR_Crippled or self.Flinching or self:GetSequence() == self:LookupSequence("nz_spawn_climbout_fast") or self:GetSequence() == self:LookupSequence("nz_spawn_jump") or self:GetSequence() == self:LookupSequence("shove_forward_01") or self:GetSequence() == self:LookupSequence("infectionrise") or self:GetSequence() == self:LookupSequence("infectionrise2") or self:GetSequence() == self:LookupSequence("slumprise_a") or self:GetSequence() == self:LookupSequence("slumprise_a2") then self.HasDeathAnimation = false end
	if IsValid(self.WeaponModel) && self.LNR_CanUseWeapon then
	   self:CreateGibEntity("prop_physics",self.WeaponModel:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("RHand")).Pos,Ang=self:GetAngles(),Vel="UseDamageForce"})
	   self.WeaponModel:SetMaterial("lnr/bonemerge") 
	   self.WeaponModel:DrawShadow(false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/undead/swat1_undead.mdl" then
			self:SetBodygroup(1,math.random(1,4))
		end
		if self:GetModel() == "models/manhunt/npc/undead/swat2_undead.mdl" then
			self:SetBodygroup(1,math.random(1,4))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Since a SWAT officer uses a helmet, take half damage.
	if hitgroup == HITGROUP_HEAD then
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self, "vj_manhunt/vocals/zmb_vocals/zomb_hel_headgush"..math.random(1,12)..".wav", 70) end
		if self:GetModel() == "models/manhunt/npc/undead/swat1_undead.mdl" then
			dmginfo:ScaleDamage(1.2) -- Face is exposed, deal %20 more damage
		elseif self:GetModel() == "models/manhunt/npc/undead/swat2_undead.mdl" then
			dmginfo:ScaleDamage(0.5) -- Face is covered, deal %50 less damage
		end	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
	if GetConVar("VJ_LNR_Crawl"):GetInt() == 0 then return end

	local crawlerchance = math.random(1,15)

	if hitgroup == HITGROUP_LEFTLEG && HITGROUP_RIGHTLEG && !self.LNR_Crawler then
		if crawlerchance == 1 then
			self:VJ_ACT_PLAYACTIVITY({"vjseq_nz_death_f_12","vjseq_nz_death_f_11"},true,false,false)
			self.LNR_Crawler = true
			self:SetCrawler()
			self:PlaySoundSystem("Alert")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	if self:IsDefaultGibDamageType(dmginfo:GetDamageType()) then end
	
	if self.LNR_Crawler then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(32)
		util.Effect("VJ_Blood1",bloodeffect)
			
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
		bloodspray:SetScale(5)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
	else -- IF NOT CRAWLER
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
	end

	local gibchance = math.random(1,4)

	if hitgroup == HITGROUP_HEAD && !self.LNR_Crawler then
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

			self.LNR_Gibbed = true
			ParticleEffect("lnr_blood_impact_boom",self:GetAttachment(self:LookupAttachment("eyes")).Pos,self:GetAngles())
			VJ_EmitSound(self,"vj_lnrhl2/shared/zombie_neck_drain_0"..math.random(1,3)..".wav",60,100)	
			local BleedOut = ents.Create("info_particle_system")
			BleedOut:SetKeyValue("effect_name","lnr_headshot_blood_splats")
			BleedOut:SetPos(self:GetAttachment(self:LookupAttachment("LeftEye")).Pos)
			BleedOut:SetAngles(self:GetAttachment(self:LookupAttachment("LeftEye")).Ang)
			BleedOut:SetParent(self)
			BleedOut:Fire("SetParentAttachment","LeftEye")
			BleedOut:Spawn()
			BleedOut:Activate()
			BleedOut:Fire("Start","",0)
			BleedOut:Fire("Kill","",8)		
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    VJ_LNR_ApplyCorpseEffects(self,corpseEnt)	
    if GetConVar("VJ_LNR_Gib"):GetInt() == 1 then
		if self.LNR_Gibbed then
			VJ_EmitSound(corpseEnt,"vj_lnrhl2/shared/zombie_neck_drain_0"..math.random(1,3)..".wav",60,100)
			local BleedOut = ents.Create("info_particle_system")	
			if hitgroup == HITGROUP_HEAD then
				BleedOut:SetPos(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("LeftEye")).Pos)
				BleedOut:SetAngles(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("LeftEye")).Ang)
				BleedOut:Fire("SetParentAttachment","LeftEye")
				BleedOut:SetKeyValue("effect_name","lnr_head_s")
				BleedOut:SetParent(corpseEnt)
				BleedOut:Spawn()
				BleedOut:Activate()
				BleedOut:Fire("Start","",0)
				BleedOut:Fire("Kill","",8)
			end	
		end
	end
end