AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/monkey.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 325 -- The starting health of the NPC
ENT.HullType = HULL_HUMAN
	-- ====== Sight & Speed Variables ====== --
ENT.SightDistance = 7500 -- How far it can see
ENT.SightAngle = 80 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ AI / Relationship Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = true -- Can it open doors?
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
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
ENT.NextSoundTime_Idle = VJ_Set(8, 20)
ENT.OnPlayerSightNextTime = VJ_Set(15, 20)
-----------------GLOBAL SOUNDS-------------------
ENT.SoundTbl_FootStep = {"vocals/shared_sfx_hunters/footstep1.wav","vocals/shared_sfx_hunters/footstep2.wav","vocals/shared_sfx_hunters/footstep3.wav","vocals/shared_sfx_hunters/footstep4.wav","vocals/shared_sfx_hunters/footstep5.wav"}
ENT.SoundTbl_Death = {"vocals/shared_sfx_hunters/death1.wav","vocals/shared_sfx_hunters/death2.wav","vocals/shared_sfx_hunters/death3.wav","vocals/shared_sfx_hunters/death4.wav","vocals/shared_sfx_hunters/death5.wav","vocals/shared_sfx_hunters/death6.wav","vocals/shared_sfx_hunters/death7.wav","vocals/shared_sfx_hunters/death8.wav","vocals/shared_sfx_hunters/death9.wav","vocals/shared_sfx_hunters/death10.wav","vocals/shared_sfx_hunters/death11.wav","vocals/shared_sfx_hunters/death12.wav","vocals/shared_sfx_hunters/death13.wav","vocals/shared_sfx_hunters/death14.wav","vocals/shared_sfx_hunters/death15.wav","vocals/shared_sfx_hunters/death16.wav","vocals/shared_sfx_hunters/death17.wav","vocals/shared_sfx_hunters/death18.wav","vocals/shared_sfx_hunters/death19.wav","vocals/shared_sfx_hunters/death20.wav","vocals/shared_sfx_hunters/death21.wav","vocals/shared_sfx_hunters/death22.wav","vocals/shared_sfx_hunters/death23.wav","vocals/shared_sfx_hunters/death24.wav","vocals/shared_sfx_hunters/death25.wav","vocals/shared_sfx_hunters/death26.wav","vocals/shared_sfx_hunters/death27.wav","vocals/shared_sfx_hunters/death28.wav","vocals/shared_sfx_hunters/death29.wav","vocals/shared_sfx_hunters/death30.wav","vocals/shared_sfx_hunters/death31.wav","vocals/shared_sfx_hunters/death32.wav","vocals/shared_sfx_hunters/death33.wav","vocals/shared_sfx_hunters/death34.wav","vocals/shared_sfx_hunters/death35.wav","vocals/shared_sfx_hunters/death36.wav","vocals/shared_sfx_hunters/death37.wav","vocals/shared_sfx_hunters/death38.wav"}
ENT.SoundTbl_Pain = {"vocals/shared_sfx_hunters/pain1.wav","vocals/shared_sfx_hunters/pain2.wav","vocals/shared_sfx_hunters/pain3.wav","vocals/shared_sfx_hunters/pain4.wav","vocals/shared_sfx_hunters/pain5.wav","vocals/shared_sfx_hunters/pain6.wav","vocals/shared_sfx_hunters/pain7.wav","vocals/shared_sfx_hunters/pain8.wav","vocals/shared_sfx_hunters/pain9.wav","vocals/shared_sfx_hunters/pain10.wav","vocals/shared_sfx_hunters/pain11.wav","vocals/shared_sfx_hunters/pain12.wav","vocals/shared_sfx_hunters/pain13.wav","vocals/shared_sfx_hunters/pain14.wav","vocals/shared_sfx_hunters/pain15.wav","vocals/shared_sfx_hunters/pain16.wav","vocals/shared_sfx_hunters/pain17.wav","vocals/shared_sfx_hunters/pain18.wav","vocals/shared_sfx_hunters/pain19.wav","vocals/shared_sfx_hunters/pain20.wav","vocals/shared_sfx_hunters/pain21.wav","vocals/shared_sfx_hunters/pain22.wav","vocals/shared_sfx_hunters/pain23.wav","vocals/shared_sfx_hunters/pain24.wav","vocals/shared_sfx_hunters/pain_low1.wav","vocals/shared_sfx_hunters/pain_low2.wav","vocals/shared_sfx_hunters/pain_low3.wav","vocals/shared_sfx_hunters/pain_low4.wav","vocals/shared_sfx_hunters/pain_low5.wav","vocals/shared_sfx_hunters/pain_low6.wav","vocals/shared_sfx_hunters/pain_low7.wav","vocals/shared_sfx_hunters/pain_low8.wav","vocals/shared_sfx_hunters/pain_low9.wav","vocals/shared_sfx_hunters/pain_low10.wav","vocals/shared_sfx_hunters/pain_low11.wav","vocals/shared_sfx_hunters/pain_low12.wav","vocals/shared_sfx_hunters/pain_low13.wav","vocals/shared_sfx_hunters/pain_low14.wav","vocals/shared_sfx_hunters/pain_low15.wav","vocals/shared_sfx_hunters/pain_low16.wav","vocals/shared_sfx_hunters/pain_low17.wav","vocals/shared_sfx_hunters/pain_low18.wav","vocals/shared_sfx_hunters/pain_low19.wav","vocals/shared_sfx_hunters/pain_low20.wav","vocals/shared_sfx_hunters/pain_low21.wav","vocals/shared_sfx_hunters/pain_low22.wav","vocals/shared_sfx_hunters/pain_low23.wav","vocals/shared_sfx_hunters/pain_low24.wav","vocals/shared_sfx_hunters/pain_low25.wav","vocals/shared_sfx_hunters/pain_low26.wav","vocals/shared_sfx_hunters/pain_low27.wav","vocals/shared_sfx_hunters/pain_low28.wav","vocals/shared_sfx_hunters/pain_low29.wav","vocals/shared_sfx_hunters/pain_low30.wav","vocals/shared_sfx_hunters/pain_low31.wav"}

local SoundTbl_DeathGib =
{
	"weapons/head_explode1.wav",
	"weapons/head_explode2.wav",
	"weapons/head_explode3.wav",
	"weapons/head_explode4.wav",
	"weapons/head_explode5.wav",
	"weapons/head_explode6.wav",
	"weapons/head_explode7.wav",
	"weapons/head_explode8.wav",
	"weapons/head_explode9.wav",
	"weapons/head_explode10.wav"
} -- When the npc gibs, play a dramatic death sound instead of a generic death 

function ENT:CustomOnInitialize()
	if math.random(1,15) == 1 then self.IsMedicSNPC = true end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 0 then
		self.VJ_NPC_Class = {"CLASS_MANHUNT_MONKEY"}
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
	"vocals/characters/monkey/monkey1.mp3",
	"vocals/characters/monkey/monkey2.mp3",
	"vocals/characters/monkey/monkey3.mp3",
	"vocals/characters/monkey/monkey4.mp3",
	"vocals/characters/monkey/monkey5.mp3",
	"vocals/characters/monkey/monkey6.mp3",
	"vocals/characters/monkey/monkey7.mp3",
	"vocals/characters/monkey/monkey8.mp3",
	"vocals/characters/monkey/monkey9.mp3",
	"vocals/characters/monkey/monkey10.mp3"
}
ENT.SoundTbl_MoveOutOfPlayersWay = 
{
	"vocals/characters/monkey/monkey1.mp3",
	"vocals/characters/monkey/monkey5.mp3",
	"vocals/characters/monkey/monkey6.mp3",
	"vocals/characters/monkey/monkey7.mp3",
	"vocals/characters/monkey/monkey14.mp3",
}
ENT.SoundTbl_CombatIdle = 
{
	"vocals/characters/monkey/monkey1.mp3",
	"vocals/characters/monkey/monkey2.mp3",
	"vocals/characters/monkey/monkey3.mp3",
	"vocals/characters/monkey/monkey4.mp3",
	"vocals/characters/monkey/monkey5.mp3",
	"vocals/characters/monkey/monkey6.mp3",
	"vocals/characters/monkey/monkey7.mp3",
	"vocals/characters/monkey/monkey8.mp3",
	"vocals/characters/monkey/monkey9.mp3",
	"vocals/characters/monkey/monkey10.mp3",
	"vocals/characters/monkey/monkey11.mp3",
	"vocals/characters/monkey/monkey12.mp3",
	"vocals/characters/monkey/monkey13.mp3",
	"vocals/characters/monkey/monkey14.mp3",
	"vocals/characters/monkey/monkey15.mp3",
	"vocals/characters/monkey/monkey16.mp3",
	"vocals/characters/monkey/monkey17.mp3",
	"vocals/characters/monkey/monkey18.mp3",
	"vocals/characters/monkey/monkey19.mp3",
	"vocals/characters/monkey/monkey20.mp3",
	"vocals/characters/monkey/monkey21.mp3",
	"vocals/characters/monkey/monkey22.mp3",
	"vocals/characters/monkey/monkey23.mp3",
	"vocals/characters/monkey/monkey24.mp3"
}
ENT.SoundTbl_Idle = 
{
	"vocals/shared_sfx_hunters/whistle1.wav",
	"vocals/shared_sfx_hunters/whistle2.wav",
	"vocals/shared_sfx_hunters/whistle3.wav",
	"vocals/shared_sfx_hunters/whistle4.wav",
	"vocals/shared_sfx_hunters/whistle5.wav",
	"vocals/shared_sfx_hunters/whistle6.wav",
	"vocals/shared_sfx_hunters/whistle7.wav",
	"vocals/shared_sfx_hunters/whistle8.wav",
	"vocals/shared_sfx_hunters/whistle9.wav",
	"vocals/shared_sfx_hunters/whistle10.wav",
	"vocals/shared_sfx_hunters/whistle11.wav",
	"vocals/shared_sfx_hunters/whistle12.wav"
}
ENT.SoundTbl_OnKilledEnemy = 
{
	"vocals/characters/monkey/monkey7.mp3",
}

function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/monkey.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
	end
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
		bloodspray:SetScale(5)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)

	if hitgroup == HITGROUP_HEAD then
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
---------------------------------------------------------------------------------------------------------------------------------------------