AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/cerberusleader.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 500 -- The starting health of the NPC
ENT.HullType = HULL_HUMAN
	-- ====== Sight & Speed Variables ====== --
ENT.SightDistance = 6000 -- How far it can see
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ AI / Relationship Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = true -- Can it open doors?
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base?
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it?
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by it or it witnesses another ally killed by it
ENT.BecomeEnemyToPlayerLevel = 2 -- Any time the player does something bad, the NPC's anger level raises by 1, if it surpasses this, it will become enemy!
ENT.PlayerFriendly = false -- Makes the SNPC friendly to the player and HL2 Resistance
	-- ====== On Player Sight Variables ====== --
ENT.HasOnPlayerSight = false -- Should do something when it sees the enemy? Example: Play a sound
ENT.OnPlayerSightDistance = 200 -- How close should the player be until it runs the code?
ENT.OnPlayerSightDispositionLevel = 1 -- 0 = Run it every time | 1 = Run it only when friendly to player | 2 = Run it only when enemy to player
ENT.OnPlayerSightOnlyOnce = true -- If true, it will only run the code once | Sets self.HasOnPlayerSight to false once it runs!
	-- ====== Call For Help Variables ====== --
ENT.CallForHelp = true -- Does the SNPC call for help?
ENT.CallForHelpDistance = 2000 -- -- How far away the SNPC's call for help goes | Counted in World Units
ENT.NextCallForHelpTime = 4 -- Time until it calls for help again
ENT.HasCallForHelpAnimation = true -- if true, it will play the call for help animation
ENT.AnimTbl_CallForHelp = {ACT_SIGNAL_ADVANCE, ACT_SIGNAL_FORWARD} -- Call For Help Animations
ENT.CallForHelpAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.CallForHelpAnimationPlayBackRate = 1 -- How fast should the animation play? | Currently only for gestures!
ENT.CallForHelpStopAnimations = true -- Should it stop attacks for a certain amount of time?
	-- ====== Sound Detection Variables ====== --
ENT.InvestigateSoundDistance = 18 -- How far away can the SNPC hear sounds? | This number is timed by the calculated volume of the detectable sound.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Damaged / Injured Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
	-- Leave custom blood tables empty to let the base decide depending on the blood type
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.BloodPoolSize = "Normal" -- What's the size of the blood pool? | Sizes: "Normal" || "Small" || "Tiny"
ENT.HasBloodDecal = true -- Does it spawn a decal when damaged?
ENT.CustomBlood_Decal = {"VJ_Manhunt_Blood_Red"} -- Decals to spawn when it's damaged
ENT.BloodDecalUseGMod = false -- Should use the current default decals defined by Garry's Mod? (This only applies for certain blood types only!)
	-- ====== Call For Back On Damage Variables ====== --
ENT.CallForBackUpOnDamage = true -- Should the SNPC call for help when damaged? (Only happens if the SNPC hasn't seen a enemy)
ENT.CallForBackUpOnDamageDistance = 800 -- How far away the SNPC's call for help goes | Counted in World Units
ENT.CallForBackUpOnDamageLimit = 4 -- How many people should it call? | 0 = Unlimited
ENT.CallForBackUpOnDamageAnimation = {ACT_SIGNAL_GROUP} -- Animation used if the SNPC does the CallForBackUpOnDamage function
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
ENT.FootStepTimeRun = 0.3-- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
	-- ====== Medic Variables ====== --
ENT.AnimTbl_Medic_GiveHealth = {"ThrowItem"}
ENT.Medic_CheckDistance = 600 -- How far does it check for allies that are hurt? | World units
ENT.Medic_HealDistance = 100 -- How close does it have to be until it stops moving and heals its ally?
ENT.Medic_HealthAmount = 50 -- How health does it give?
ENT.Medic_NextHealTime = VJ_Set(10, 15) -- How much time until it can give health to an ally again
ENT.Medic_SpawnPropOnHeal = true -- Should it spawn a prop, such as small health vial at a attachment when healing an ally?

ENT.DeathSoundPitch = VJ_Set(100,100)
ENT.PainSoundPitch = VJ_Set(100,100)
ENT.IdleSoundChance = 2
ENT.OnPlayerSightSoundChance = 4
ENT.SuppressingSoundChance = 4 -- to prevent suppressing quotes overlapping fight quotes
ENT.NextSoundTime_Idle = VJ_Set(8, 20)
ENT.OnPlayerSightNextTime = VJ_Set(15, 20)
-----------------GLOBAL SOUNDS-------------------
ENT.SoundTbl_Death = {"vj_manhunt/vocals/shared_sfx_hunters/cerb/death1.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death2.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death3.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death4.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death5.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death6.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death7.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death8.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death9.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death10.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death11.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death12.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death13.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death14.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death15.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death16.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death17.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death18.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death19.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death20.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death21.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death22.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death23.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death24.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death25.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death26.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death27.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death28.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death29.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death30.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death31.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death32.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death33.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death34.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death35.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death36.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death37.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/death38.wav"}
ENT.SoundTbl_Pain = {"vj_manhunt/vocals/shared_sfx_hunters/cerb/pain1.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain2.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain3.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain4.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain5.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain6.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain7.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain8.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain9.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain10.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain11.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain12.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain13.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain14.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain15.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain16.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain17.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain18.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain19.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain20.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain21.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain22.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain23.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain24.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low1.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low2.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low3.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low4.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low5.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low6.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low7.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low8.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low9.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low10.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low11.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low12.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low13.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low14.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low15.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low16.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low17.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low18.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low19.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low20.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low21.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low22.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low23.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low24.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low25.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low26.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low27.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low28.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low29.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low30.wav","vj_manhunt/vocals/shared_sfx_hunters/cerb/pain_low31.wav"}

local SoundTbl_DeathGib =
{
	"vj_manhunt/weapons/head_explode_cerb1.wav",
	"vj_manhunt/weapons/head_explode_cerb2.wav",
	"vj_manhunt/weapons/head_explode_cerb3.wav",
	"vj_manhunt/weapons/head_explode_cerb4.wav",
	"vj_manhunt/weapons/head_explode_cerb5.wav",
	"vj_manhunt/weapons/head_explode_cerb6.wav",
	"vj_manhunt/weapons/head_explode_cerb7.wav",
	"vj_manhunt/weapons/head_explode_cerb8.wav",
	"vj_manhunt/weapons/head_explode_cerb9.wav",
	"vj_manhunt/weapons/head_explode_cerb10.wav"
} -- When the npc gibs, play a dramatic death sound instead of a generic death 

function ENT:CustomOnInitialize()
	self:SetSkin(math.random(0,3))
	if math.random(1,15) == 1 then self.IsMedicSNPC = true end
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 0 then
		self.WaitForEnemyToComeOut = true
		self.MoveOrHideOnDamageByEnemy = true
	end
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 1 then
		self.WaitForEnemyToComeOut = false
		self.MoveOrHideOnDamageByEnemy = false
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 0 then
		self.VJ_NPC_Class = {"CLASS_MANHUNT_CERBERUS","CLASS_MANHUNT_SMILIES","CLASS_MANHUNT_WARDOGS"}
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 1 then
		self.VJ_NPC_Class = 
		{
			"CLASS_MANHUNT_HOODS",
			"CLASS_MANHUNT_SKINZ",
			"CLASS_MANHUNT_WARDOGS",
			"CLASS_MANHUNT_INNOCENTZ",
			"CLASS_MANHUNT_SMILIES",
			"CLASS_MANHUNT_CERBERUS",
			"CLASS_MANHUNT_CCPD",
			"CLASS_MANHUNT_MONKEY"
		}
	end
end


ENT.SoundTbl_Alert = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1ds1.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1ds2.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1ds3.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1ds4.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1ds5.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1ds6.mp3"
}
ENT.SoundTbl_CombatIdle = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa1.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa2.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa3.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa4.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa5.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa6.mp3"
}
ENT.SoundTbl_IdleDialogueAnswer = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1gic1.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic3.mp3"
}
ENT.SoundTbl_Idle = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1gic1.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic2.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic3.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic4.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic5.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic6.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic7.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic8.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic9.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic10.mp3"
}
ENT.SoundTbl_Investigate = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa1.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa2.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa3.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa4.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa5.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa6.mp3"
}
ENT.SoundTbl_OnKilledEnemy = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1cfa5.mp3"
}
ENT.SoundTbl_FollowPlayer = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1gic6.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic8.mp3"
}
ENT.SoundTbl_UnFollowPlayer = 
{
	"vj_manhunt/vocals/characters/cerberus/y1v1gic3.mp3",
	"vj_manhunt/vocals/characters/cerberus/y1v1gic5.mp3"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/cerberusleader.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Reduce melee damage
	if dmginfo:IsDamageType(128) then
		dmginfo:ScaleDamage(0.50) // if damaged by melee, reduce dmg taken by 50%
	end
	-- Reduce bullet damage
	if dmginfo:IsBulletDamage() then
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self, "vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav", 70) end
		dmginfo:ScaleDamage(0.80) // if damaged by firearms, reduce dmg taken by 20%
		local spark = ents.Create("env_spark")
		spark:SetKeyValue("Magnitude","1")
		spark:SetKeyValue("Spark Trail Length","1")
		spark:SetPos(dmginfo:GetDamagePosition())
		spark:SetAngles(self:GetAngles())
		spark:SetParent(self)
		spark:Spawn()
		spark:Activate()
		spark:Fire("StartSpark", "", 0)
		spark:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(spark)
	end
	-- Reduce slash damage
	if dmginfo:IsDamageType(4) then
		dmginfo:ScaleDamage(0.65) // if damaged by slashing weapons, reduce dmg taken by 35%
	end
	-- Increase head damage
	if dmginfo:IsBulletDamage() and hitgroup == HITGROUP_HEAD then
		if GetConVarNumber("vj_manhunt_hunters_headshot_sound") == 1 then VJ_EmitSound(self, "vj_manhunt/vocals/zmb_vocals/headshot_"..math.random(0,6)..".wav", 70) end
		dmginfo:ScaleDamage(1.75)
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
-- Credit to Darkborn's LNR
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
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav"
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(CustomTbl)
	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	if self:IsOnGround() && self:GetGroundEntity() != NULL then
		if self.DisableFootStepSoundTimer == true then
			self:CustomOnFootStepSound()
			return
		elseif self:IsMoving() && CurTime() > self.FootStepT then
			self:CustomOnFootStepSound()
			local CurSched = self.CurrentSchedule
			if self.DisableFootStepOnRun == false && ((VJ_HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or (CurSched != nil  && CurSched.IsMovingTask_Run == true)) /*(VJ_HasValue(VJ_RunActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomRunActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return
			elseif self.DisableFootStepOnWalk == false && (VJ_HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or (CurSched != nil  && CurSched.IsMovingTask_Walk == true)) /*(VJ_HasValue(VJ_WalkActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomWalkActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Walk()
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------