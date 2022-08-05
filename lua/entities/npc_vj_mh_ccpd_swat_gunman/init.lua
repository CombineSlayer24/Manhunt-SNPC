AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/swat1.mdl","models/manhunt/npc/swat2.mdl"}

local sdCCPD_Chatter = 
{
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter1.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter2.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter3.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter4.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter5.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter6.wav",
	"vj_manhunt/vocals/shared_sfx_hunters/ccpd_shared_radio/radio_idle_chatter7.wav"
}

function ENT:CustomOnInitialize()
	self:SetSkin(math.random(0,2))
	if math.random(1,15) == 1 then self.IsMedicSNPC = true end
	if GetConVarNumber("vj_manhunt_hunters_ply_allied") == 0 then
		self.FriendsWithAllPlayerAllies = false 
	end
	if GetConVarNumber("vj_manhunt_hunters_ply_allied") == 1 then
		self.FriendsWithAllPlayerAllies = true 
	end
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 0 then
		self.WaitForEnemyToComeOut = true
		self.MoveOrHideOnDamageByEnemy = true
	end
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 1 then
		self.WaitForEnemyToComeOut = false
		self.MoveOrHideOnDamageByEnemy = false
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 0 then
		self.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY","CLASS_AMERICA_FRIENDLY","CLASS_MANHUNT_CCPD_FRIENDLY","CLASS_PLAYER_ALLY"}
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 1 then
		self.VJ_NPC_Class = 
		{
			"CLASS_PLAYER_ALLY",
			"CLASS_MANHUNT_CCPD_FRIENDLY",
			"CLASS_MANHUNT_SKINZ_FRIENDLY",
			"CLASS_MANHUNT_WARDOGS_FRIENDLY",
			"CLASS_MANHUNT_INNOCENTZ_FRIENDLY",
			"CLASS_MANHUNT_SMILIES_FRIENDLY",
			"CLASS_MANHUNT_CERBERUS_FRIENDLY",
			"CLASS_MANHUNT_CCPD_FRIENDLY",
			"CLASS_MANHUNT_MONKEY_FRIENDLY"
		}
	end
end

-- Custom
ENT.CCPD_ChatterT = 0

function ENT:CustomOnPreInitialize() -- Picks random voices once a SNPC is spawned, however, they will all have Footsteps, Pained and Death sounds.
self.CCPD_ChatterT = CurTime() + math.Rand(1, 30)
	local voices = math.random(1,3)
	if voices == 1 then --  SWAT voiceset 1
		self.SoundTbl_OnDangerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tsh6.mp3"
		}
        self.SoundTbl_Alert = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ds6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v1bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1bp3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur6.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh6.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja3.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc6.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea5.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sur3.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr4.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic8.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tsz3.mp3",
            "vj_manhunt/vocals/shared_sfx_hunters/whistle1.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle2.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle3.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle4.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle5.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle6.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle7.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle8.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle9.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle10.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle11.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle12.wav"
        }
        self.SoundTbl_Investigate = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1rti6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1sal6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1wti6.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v1tpd6.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ncr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v1bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1bp6.mp3"
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1cst8.mp3"
        }
        self.SoundTbl_UnFollowPlayer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic5.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v1wic6.mp3"
        }
    elseif voices == 2 then --  SWAT voiceset 2
		self.SoundTbl_OnDangerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur6.mp3"
		}
        self.SoundTbl_Alert = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ds6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur3.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh5.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh2.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
            "vj_manhunt/vocals/characters/ccpd_police/p1v2ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc5.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic2.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sur6.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr6.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr5.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2tsz3.mp3",
            "vj_manhunt/vocals/shared_sfx_hunters/whistle1.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle2.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle3.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle4.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle5.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle6.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle7.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle8.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle9.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle10.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle11.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle12.wav"
        }
        self.SoundTbl_Investigate = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2rti6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2sal6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2wti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2wti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2wti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2wti4.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v2tpd6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2bp1.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ncr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v2bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2bp6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc6.mp3"
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst9.mp3"
        }
        self.SoundTbl_UnFollowPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v2bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin3.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v2bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2ptc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v2wic6.mp3"
        }
    elseif voices == 3 then --  SWAT voiceset 3
		self.SoundTbl_OnDangerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur6.mp3"
		}
        self.SoundTbl_Alert = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ds6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc3.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3bp6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa6.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cin2.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p1v3rti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs2.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc6.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sur6.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst4.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic3.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tsz3.mp3",
            "vj_manhunt/vocals/shared_sfx_hunters/whistle1.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle2.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle3.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle4.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle5.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle6.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle7.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle8.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle9.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle10.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle11.wav",
			"vj_manhunt/vocals/shared_sfx_hunters/whistle12.wav"
        }
        self.SoundTbl_Investigate = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3rti6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3sal6.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3wti6.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd1.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd2.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd3.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd4.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd5.mp3",
            "vj_manhunt/vocals/characters/ccpd_police/p1v3tpd6.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ncr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3bp3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tsh3.mp3"
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic7.mp3"
        }
        self.SoundTbl_UnFollowPlayer = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wti5.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
            "vj_manhunt/vocals/characters/ccpd_police/p1v3bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p1v3wic6.mp3"
        }
    end
end
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
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Since a SWAT officer uses a helmet, take half damage.
	if hitgroup == HITGROUP_HEAD then
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self, "vj_manhunt/vocals/zmb_vocals/zomb_hel_headgush"..math.random(1,12)..".wav", 70) end
		if self:GetModel() == "models/manhunt/npc/undead/swat1.mdl" then
			dmginfo:ScaleDamage(1.2) -- Face is exposed, deal %20 more damage
		elseif self:GetModel() == "models/manhunt/npc/undead/swat2.mdl" then
			dmginfo:ScaleDamage(0.5) -- Face is covered, deal %50 less damage
		end	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/swat1.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
		if self:GetModel() == "models/manhunt/npc/swat2.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	VJ_STOPSOUND(self.CCPD_ChatterSd)
end
---------------------------------------------------------------------------------------------------------------------------------------------