AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/cop1.mdl","models/manhunt/npc/cop3.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 325 -- The starting health of the NPC
ENT.HullType = HULL_HUMAN
	-- ====== Sight & Speed Variables ====== --
--ENT.SightDistance = 6000 -- How far it can see
--ENT.SightAngle = 90 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ AI / Relationship Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = true -- Can it open doors?
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_MANHUNT_CCPD_FRIENDLY"} -- NPCs with the same class with be allied to each other
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.FriendsWithAllPlayerAllies = false -- Should this SNPC be friends with all other player allies that are running on VJ Base?
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
ENT.IdleSoundChance = 2
ENT.OnPlayerSightSoundChance = 4
ENT.SuppressingSoundChance = 3 -- to prevent suppressing quotes overlapping fight quotes
ENT.NextSoundTime_Idle = VJ_Set(8, 20)
ENT.OnPlayerSightNextTime = VJ_Set(15, 20)
-----------------GLOBAL SOUNDS-------------------
ENT.SoundTbl_FootStep = {"shared_sfx_hunters/footstep1.wav","shared_sfx_hunters/footstep2.wav","shared_sfx_hunters/footstep3.wav","shared_sfx_hunters/footstep4.wav","shared_sfx_hunters/footstep5.wav"}
ENT.SoundTbl_Death = {"shared_sfx_hunters/death1.wav","shared_sfx_hunters/death2.wav","shared_sfx_hunters/death3.wav","shared_sfx_hunters/death4.wav","shared_sfx_hunters/death5.wav","shared_sfx_hunters/death6.wav","shared_sfx_hunters/death7.wav","shared_sfx_hunters/death8.wav","shared_sfx_hunters/death9.wav","shared_sfx_hunters/death10.wav","shared_sfx_hunters/death11.wav","shared_sfx_hunters/death12.wav","shared_sfx_hunters/death13.wav","shared_sfx_hunters/death14.wav","shared_sfx_hunters/death15.wav","shared_sfx_hunters/death16.wav","shared_sfx_hunters/death17.wav","shared_sfx_hunters/death18.wav","shared_sfx_hunters/death19.wav","shared_sfx_hunters/death20.wav","shared_sfx_hunters/death21.wav","shared_sfx_hunters/death22.wav","shared_sfx_hunters/death23.wav","shared_sfx_hunters/death24.wav","shared_sfx_hunters/death25.wav","shared_sfx_hunters/death26.wav","shared_sfx_hunters/death27.wav","shared_sfx_hunters/death28.wav","shared_sfx_hunters/death29.wav","shared_sfx_hunters/death30.wav","shared_sfx_hunters/death31.wav","shared_sfx_hunters/death32.wav","shared_sfx_hunters/death33.wav","shared_sfx_hunters/death34.wav","shared_sfx_hunters/death35.wav","shared_sfx_hunters/death36.wav","shared_sfx_hunters/death37.wav","shared_sfx_hunters/death38.wav"}
ENT.SoundTbl_Pain = {"shared_sfx_hunters/pain1.wav","shared_sfx_hunters/pain2.wav","shared_sfx_hunters/pain3.wav","shared_sfx_hunters/pain4.wav","shared_sfx_hunters/pain5.wav","shared_sfx_hunters/pain6.wav","shared_sfx_hunters/pain7.wav","shared_sfx_hunters/pain8.wav","shared_sfx_hunters/pain9.wav","shared_sfx_hunters/pain10.wav","shared_sfx_hunters/pain11.wav","shared_sfx_hunters/pain12.wav","shared_sfx_hunters/pain13.wav","shared_sfx_hunters/pain14.wav","shared_sfx_hunters/pain15.wav","shared_sfx_hunters/pain16.wav","shared_sfx_hunters/pain17.wav","shared_sfx_hunters/pain18.wav","shared_sfx_hunters/pain19.wav","shared_sfx_hunters/pain20.wav","shared_sfx_hunters/pain21.wav","shared_sfx_hunters/pain22.wav","shared_sfx_hunters/pain23.wav","shared_sfx_hunters/pain24.wav","shared_sfx_hunters/pain_low1.wav","shared_sfx_hunters/pain_low2.wav","shared_sfx_hunters/pain_low3.wav","shared_sfx_hunters/pain_low4.wav","shared_sfx_hunters/pain_low5.wav","shared_sfx_hunters/pain_low6.wav","shared_sfx_hunters/pain_low7.wav","shared_sfx_hunters/pain_low8.wav","shared_sfx_hunters/pain_low9.wav","shared_sfx_hunters/pain_low10.wav","shared_sfx_hunters/pain_low11.wav","shared_sfx_hunters/pain_low12.wav","shared_sfx_hunters/pain_low13.wav","shared_sfx_hunters/pain_low14.wav","shared_sfx_hunters/pain_low15.wav","shared_sfx_hunters/pain_low16.wav","shared_sfx_hunters/pain_low17.wav","shared_sfx_hunters/pain_low18.wav","shared_sfx_hunters/pain_low19.wav","shared_sfx_hunters/pain_low20.wav","shared_sfx_hunters/pain_low21.wav","shared_sfx_hunters/pain_low22.wav","shared_sfx_hunters/pain_low23.wav","shared_sfx_hunters/pain_low24.wav","shared_sfx_hunters/pain_low25.wav","shared_sfx_hunters/pain_low26.wav","shared_sfx_hunters/pain_low27.wav","shared_sfx_hunters/pain_low28.wav","shared_sfx_hunters/pain_low29.wav","shared_sfx_hunters/pain_low30.wav","shared_sfx_hunters/pain_low31.wav"}

-- ^^ ARE SHARED ^^ // Down below isnt --
function ENT:CustomOnPreInitialize() -- Picks random voices once a SNPC is spawned, however, they will all have Footsteps, Pained and Death sounds.
self.CCPD_ChatterT = CurTime() + math.Rand(1, 30)
    local voices = math.random(1,1)
        if voices == 1 then -- Cop 1 voices
		self.SoundTbl_Alert = 
		{
			"characters/cops/cop1_alert1.wav",
			"characters/cops/cop1_alert2.wav",
			"characters/cops/cop1_alert3.wav",
			"characters/cops/cop1_alert4.wav",
			"characters/cops/cop1_alert5.wav",
			"characters/cops/cop1_alert6.wav",
			"characters/cops/cop1_alert7.wav",
			"characters/cops/cop1_alert8.wav",
			"characters/cops/cop1_alert9.wav",
			"characters/cops/cop1_alert10.wav",
			"characters/cops/cop1_alert11.wav",
			"characters/cops/cop1_alert12.wav",
			"characters/cops/cop1_alert13.wav",
			"characters/cops/cop1_alert14.wav",
			"characters/cops/cop1_alert15.wav"
		}
		self.SoundTbl_AllyDeath = 
		{
			"characters/cops/cop1_ally_death1.wav",
			"characters/cops/cop1_ally_death2.wav",
			"characters/cops/cop1_ally_death3.wav",
			"characters/cops/cop1_ally_death4.wav",
			"characters/cops/cop1_ally_death5.wav",
			"characters/cops/cop1_ally_death6.wav",
			"characters/cops/cop1_ally_death7.wav",
			"characters/cops/cop1_ally_death8.wav",
			"characters/cops/cop1_ally_death9.wav",
			"characters/cops/cop1_ally_death10.wav"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"characters/cops/cop1_alert8.wav",
			"characters/cops/cop1_suppressing10.wav",
			"characters/cops/cop1_suppressing16.wav",
			"characters/cops/cop1_suppressing17.wav",
			"characters/cops/cop1_suppressing18.wav"
		}
		self.SoundTbl_CombatIdle = 
		{
			"characters/cops/cop1_fight1.wav",
			"characters/cops/cop1_fight2.wav",
			"characters/cops/cop1_fight3.wav",
			"characters/cops/cop1_fight4.wav",
			"characters/cops/cop1_fight5.wav",
			"characters/cops/cop1_fight6.wav",
			"characters/cops/cop1_fight7.wav",
			"characters/cops/cop1_fight8.wav",
			"characters/cops/cop1_fight9.wav",
			"characters/cops/cop1_fight10.wav",
			"characters/cops/cop1_fight11.wav",
			"characters/cops/cop1_fight12.wav",
			"characters/cops/cop1_fight13.wav",
			"characters/cops/cop1_fight14.wav",
			"characters/cops/cop1_fight15.wav",
			"characters/cops/cop1_fight16.wav"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"characters/cops/cop1_death1.wav",
			"characters/cops/cop1_death2.wav",
			"characters/cops/cop1_death3.wav"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"characters/cops/cop1_idle_answer1.wav",
			"characters/cops/cop1_idle_answer2.wav",
			"characters/cops/cop1_idle_answer3.wav",
			"characters/cops/cop1_idle_answer4.wav",
			"characters/cops/cop1_idle_answer5.wav",
			"characters/cops/cop1_idle_answer6.wav",
			"characters/cops/cop1_idle_answer7.wav",
			"characters/cops/cop1_idle_answer8.wav"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"characters/cops/cop1_idle_question1.wav",
			"characters/cops/cop1_idle_question2.wav",
			"characters/cops/cop1_idle_question3.wav",
			"characters/cops/cop1_idle_question4.wav",
			"characters/cops/cop1_idle_question5.wav",
			"characters/cops/cop1_idle_question6.wav",
			"characters/cops/cop1_idle_question7.wav"
		}
		self.SoundTbl_Idle = 
		{
			"characters/cops/cop1_idle1.wav",
			"characters/cops/cop1_idle2.wav",
			"characters/cops/cop1_idle3.wav",
			"characters/cops/cop1_idle4.wav",
			"characters/cops/cop1_idle5.wav",
			"characters/cops/cop1_idle6.wav",
			"characters/cops/cop1_idle7.wav",
			"characters/cops/cop1_idle8.wav",
			"characters/cops/cop1_idle9.wav",
			"characters/cops/cop1_idle10.wav",
			"characters/cops/cop1_idle11.wav",
			"characters/cops/cop1_idle12.wav",
			"characters/cops/cop1_idle13.wav",
			"characters/cops/cop1_idle14.wav",
			"characters/cops/cop1_idle15.wav",
			"characters/cops/cop1_idle16.wav",
			"characters/cops/cop1_idle17.wav",
			"characters/cops/cop1_idle18.wav",
			"characters/cops/cop1_idle19.wav",
			"characters/cops/cop1_idle20.wav",
			"characters/cops/cop1_idle21.wav",
			"characters/cops/cop1_idle22.wav",
			"characters/cops/cop1_idle23.wav",
			"characters/cops/cop1_idle24.wav",
			"characters/cops/cop1_idle25.wav",
			"characters/cops/cop1_idle26.wav",
			"characters/cops/cop1_idle27.wav",
			"characters/cops/cop1_idle28.wav",
			"characters/cops/cop1_idle29.wav",
			"characters/cops/cop1_idle30.wav",
			"characters/cops/cop1_idle31.wav"
		}
		self.SoundTbl_Investigate = 
		{
			"characters/cops/cop1_investigate1.wav",
			"characters/cops/cop1_investigate2.wav",
			"characters/cops/cop1_investigate3.wav",
			"characters/cops/cop1_investigate4.wav",
			"characters/cops/cop1_investigate5.wav",
			"characters/cops/cop1_investigate6.wav",
			"characters/cops/cop1_investigate7.wav",
			"characters/cops/cop1_investigate8.wav",
			"characters/cops/cop1_investigate9.wav",
			"characters/cops/cop1_investigate10.wav",
			"characters/cops/cop1_investigate11.wav",
			"characters/cops/cop1_investigate12.wav",
			"characters/cops/cop1_investigate13.wav",
			"characters/cops/cop1_investigate14.wav",
			"characters/cops/cop1_investigate15.wav",
			"characters/cops/cop1_investigate16.wav",
			"characters/cops/cop1_investigate17.wav",
			"characters/cops/cop1_investigate18.wav",
			"characters/cops/cop1_investigate19.wav",
			"characters/cops/cop1_investigate20.wav"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"characters/cops/cop1_kill1.wav",
			"characters/cops/cop1_kill2.wav",
			"characters/cops/cop1_kill3.wav",
			"characters/cops/cop1_kill4.wav",
			"characters/cops/cop1_kill5.wav",
			"characters/cops/cop1_kill6.wav",
			"characters/cops/cop1_kill7.wav",
			"characters/cops/cop1_kill8.wav",
			"characters/cops/cop1_kill9.wav",
			"characters/cops/cop1_kill10.wav",
			"characters/cops/cop1_kill11.wav",
			"characters/cops/cop1_kill12.wav"
		}
		self.SoundTbl_LostEnemy = 
		{
			"characters/cops/cop1_lost_enemy1.wav",
			"characters/cops/cop1_lost_enemy2.wav",
			"characters/cops/cop1_lost_enemy4.wav",
			"characters/cops/cop1_lost_enemy5.wav",
			"characters/cops/cop1_lost_enemy6.wav",
			"characters/cops/cop1_lost_enemy7.wav",
			"characters/cops/cop1_lost_enemy8.wav",
			"characters/cops/cop1_lost_enemy9.wav"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"characters/cops/cop1_player_follow1.wav",
			"characters/cops/cop1_player_follow2.wav",
			"characters/cops/cop1_player_follow3.wav",
			"characters/cops/cop1_player_follow4.wav"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"characters/cops/cop1_suppressing8.wav",
			"characters/cops/cop1_idle30.wav",
			"characters/cops/cop1_fight1.wav",
			"characters/cops/cop1_alert8.wav"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"characters/cops/cop1_player_spot1.wav",
			"characters/cops/cop1_player_spot2.wav",
			"characters/cops/cop1_player_spot3.wav"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"characters/cops/cop1_player_unfollow1.wav",
			"characters/cops/cop1_player_unfollow2.wav",
			"characters/cops/cop1_player_unfollow3.wav"
		}
		self.SoundTbl_Suppressing = 
		{
			"characters/cops/cop1_suppressing1.wav",
			"characters/cops/cop1_suppressing2.wav",
			"characters/cops/cop1_suppressing3.wav",
			"characters/cops/cop1_suppressing4.wav",
			"characters/cops/cop1_suppressing5.wav",
			"characters/cops/cop1_suppressing6.wav",
			"characters/cops/cop1_suppressing7.wav",
			"characters/cops/cop1_suppressing8.wav",
			"characters/cops/cop1_suppressing9.wav",
			"characters/cops/cop1_suppressing10.wav",
			"characters/cops/cop1_suppressing11.wav",
			"characters/cops/cop1_suppressing12.wav",
			"characters/cops/cop1_suppressing13.wav",
			"characters/cops/cop1_suppressing14.wav",
			"characters/cops/cop1_suppressing15.wav",
			"characters/cops/cop1_suppressing16.wav",
			"characters/cops/cop1_suppressing17.wav",
			"characters/cops/cop1_suppressing18.wav",
			"characters/cops/cop1_suppressing19.wav",
			"characters/cops/cop1_suppressing20.wav"
		}
	end
end

local sdCCPD_Chatter = 
{
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter1.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter2.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter3.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter4.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter5.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter6.wav",
	"shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter7.wav"
}
-- Custom
ENT.CCPD_ChatterT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
-- Credit to HLR
function ENT:OnPlayCreateSound(sdData, sdFile)
	if VJ_HasValue(self.SoundTbl_Pain, sdFile) or VJ_HasValue(self.DefaultSoundTbl_MeleeAttack, sdFile) or VJ_HasValue(sdCCPD_Chatter, sdFile) then return end
end
---------------------------------------------------------------------------------------------------------------------------------------------
-- Credit to HLR
function ENT:CustomOnThink_AIEnabled()
	-- Random background radio sounds
	if self.CCPD_ChatterT < CurTime() then
		if math.random(1, 2) == 1 then
			self.CCPD_ChatterSd = VJ_CreateSound(self, sdCCPD_Chatter, 60, 90)
		end
		self.CCPD_ChatterT = CurTime() + math.Rand(20, 40)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
-- Credit to HLR. (right now, needs more work)
--[[function ENT:CustomOnAlert(ent)
	if math.random(1, 2) == 1 then
		if ent:IsNPC() then
			if math.random(1, 2) == 1 then
				for _,v in ipairs(ent.VJ_NPC_Class or {1}) do
					if v == "CLASS_MANHUNT_CASH_FRIENDLY" or "CLASS_MANHUNT_CASH" or ent:Classify() == CLASS_MANHUNT_CASH then
						-- Plays Spot Cash sound when seeing npc_vj_cash or it's hostile variant.
						self:PlaySoundSystem("Alert", {"characters/cops/cop1_spot_cash.wav","characters/cops/cop1_alert2.wav","characters/cops/cop1_alert14.wav","characters/cops/cop1_alert15.wav"})
						return -- Skip the regular alert sounds for Cash specific sound
					end
				end
			end
			self:PlaySoundSystem("Alert", {"characters/cops/cop1_alert1.wav","characters/cops/cop1_alert2.wav","characters/cops/cop1_alert3.wav","characters/cops/cop1_alert4.wav","characters/cops/cop1_alert5.wav","characters/cops/cop1_alert6.wav","characters/cops/cop1_alert7.wav","characters/cops/cop1_alert8.wav","characters/cops/cop1_alert9.wav","characters/cops/cop1_alert10.wav","characters/cops/cop1_alert11.wav","characters/cops/cop1_alert12.wav","characters/cops/cop1_alert13.wav","characters/cops/cop1_alert14.wav","characters/cops/cop1_alert15.wav"}) -- make sure it plays this specific sound if the regular alert snds dont.
		end
	end
end--]]
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetSkin(math.random(0,2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/cop1.mdl" then
			self:SetBodygroup(1,1)
		end
		if self:GetModel() == "models/manhunt/npc/cop3.mdl" then
			self:SetBodygroup(1,2)
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
function ENT:CustomOnRemove()
	VJ_STOPSOUND(self.CCPD_ChatterSd)
end