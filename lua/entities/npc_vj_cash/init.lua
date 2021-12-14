AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/cash.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 500 -- The starting health of the NPC
ENT.HullType = HULL_HUMAN
	-- ====== Sight & Speed Variables ====== --
--ENT.SightDistance = 6000 -- How far it can see
--ENT.SightAngle = 90 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ AI / Relationship Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = true -- Can it open doors?
ENT.VJ_NPC_Class = {"CLASS_MANHUNT_CASH_FRIENDLY"} -- NPCs with the same class with be allied to each other
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it?
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by it or it witnesses another ally killed by it
ENT.BecomeEnemyToPlayerLevel = 2 -- Any time the player does something bad, the NPC's anger level raises by 1, if it surpasses this, it will become enemy!
ENT.PlayerFriendly = true -- Makes the SNPC friendly to the player and HL2 Resistance
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

ENT.DeathSoundPitch = VJ_Set(100,100)
ENT.PainSoundPitch = VJ_Set(100,100)
ENT.IdleSoundChance = 4
ENT.OnPlayerSightSoundChance = 4
ENT.NextSoundTime_Idle = VJ_Set(8, 20)
ENT.OnPlayerSightNextTime = VJ_Set(15, 20)
-----------------GLOBAL SOUNDS-------------------
ENT.SoundTbl_FootStep = {"shared_sfx_hunters/footstep1.wav","shared_sfx_hunters/footstep2.wav","shared_sfx_hunters/footstep3.wav","shared_sfx_hunters/footstep4.wav","shared_sfx_hunters/footstep5.wav"}
ENT.SoundTbl_Death = {"characters/cash/death1.wav","characters/cash/death2.wav","characters/cash/death3.wav","characters/cash/death4.wav","characters/cash/death5.wav","characters/cash/death6.wav","characters/cash/death7.wav","characters/cash/death8.wav","characters/cash/death9.wav","characters/cash/death10.wav","characters/cash/death11.wav","characters/cash/death12.wav","characters/cash/death13.wav","characters/cash/death14.wav","characters/cash/death15.wav","characters/cash/death16.wav","characters/cash/death17.wav"}
ENT.SoundTbl_Pain = {"characters/cash/pain1.wav","characters/cash/pain2.wav","characters/cash/pain3.wav","characters/cash/pain4.wav","characters/cash/pain5.wav","characters/cash/pain6.wav","characters/cash/pain7.wav","characters/cash/pain8.wav","characters/cash/pain9.wav","characters/cash/pain10.wav","characters/cash/pain11.wav","characters/cash/pain12.wav","characters/cash/pain13.wav","characters/cash/pain14.wav","characters/cash/pain15.wav","characters/cash/pain16.wav","characters/cash/pain17.wav","characters/cash/pain18.wav","characters/cash/pain19.wav","characters/cash/pain20.wav","characters/cash/pain21.wav","characters/cash/pain22.wav","characters/cash/pain23.wav","characters/cash/pain24.wav","characters/cash/pain24.wav","characters/cash/pain25.wav","characters/cash/pain26.wav","characters/cash/pain27.wav","characters/cash/pain28.wav","characters/cash/pain29.wav","characters/cash/pain30.wav","characters/cash/pain31.wav","characters/cash/pain32.wav","characters/cash/pain33.wav","characters/cash/pain34.wav","characters/cash/pain35.wav","characters/cash/pain36.wav","characters/cash/pain37.wav","characters/cash/pain38.wav","characters/cash/pain39.wav","characters/cash/pain40.wav","characters/cash/pain41.wav","characters/cash/pain42.wav","characters/cash/pain43.wav","characters/cash/pain44.wav","characters/cash/pain45.wav"}

ENT.SoundTbl_MoveOutOfPlayersWay = 
{
	"characters/cash/player_follow2.wav",
	"characters/cash/fight3.wav"
}
ENT.SoundTbl_CombatIdle = 
{
	"characters/cash/fight1.wav",
	"characters/cash/fight2.wav",
	"characters/cash/fight3.wav",
	"characters/cash/fight4.wav",
	"characters/cash/fight5.wav"
}
ENT.SoundTbl_IdleDialogueAnswer = 
{
	"characters/cash/idle_answer1.wav"
}
ENT.SoundTbl_Idle = 
{
	"characters/cash/idle1.wav",
	"characters/cash/idle2.wav",
	"characters/cash/idle3.wav",
	"characters/cash/idle4.wav"
}
ENT.SoundTbl_OnKilledEnemy = 
{
	"characters/cash/kill1.wav"
}
ENT.SoundTbl_FollowPlayer = 
{
	"characters/cash/player_follow1.wav",
	"characters/cash/player_follow2.wav",
	"characters/cash/player_follow3.wav",
	"characters/cash/player_follow4.wav",
	"characters/cash/player_follow5.wav",
	"characters/cash/player_follow6.wav",
	"characters/cash/player_follow7.wav"
}
ENT.SoundTbl_OnPlayerSight = 
{
	"characters/cash/player_follow4.wav"
}
ENT.SoundTbl_UnFollowPlayer = 
{
	"characters/cash/player_unfollow1.wav",
	"characters/cash/player_unfollow2.wav",
	"characters/cash/player_unfollow3.wav",
	"characters/cash/player_unfollow4.wav",
	"characters/cash/player_unfollow5.wav",
	"characters/cash/player_unfollow6.wav",
	"characters/cash/player_unfollow7.wav",
	"characters/cash/player_unfollow8.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetSkin(math.random(0,1))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	if self:IsDefaultGibDamageType(dmginfo:GetDamageType()) then return end
	if dmginfo:GetDamageForce():Length() < (math.random(600,900)) then return false end
		
	local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:LocalToWorld(Vector(0,0,50)))
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(32)
		util.Effect("VJ_Blood1",bloodeffect)
		
	local bloodspray = EffectData()
		bloodspray:SetOrigin(self:LocalToWorld(Vector(0,0,50)))
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)

	if hitgroup == HITGROUP_HEAD then
		self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/1.mdl",{Pos=self:LocalToWorld(Vector(0,0,68)),Ang=self:GetAngles()+Angle(0,-90,0)})
		self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/2.mdl",{Pos=self:LocalToWorld(Vector(0,4,60)),Ang=self:GetAngles()+Angle(0,-90,0)})
		self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/3.mdl",{Pos=self:LocalToWorld(Vector(0,0,63)),Ang=self:GetAngles()+Angle(0,-90,0)})
		self:CreateGibEntity("obj_vj_gib_manhunt","models/manhunt/gibs/4.mdl",{Pos=self:LocalToWorld(Vector(0,3,65)),Ang=self:GetAngles()+Angle(0,-90,0)})
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------