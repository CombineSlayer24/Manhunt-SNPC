AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/cop1.mdl","models/manhunt/npc/cop3.mdl"}

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
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 0 then
		self.WaitForEnemyToComeOut = true
		self.MoveOrHideOnDamageByEnemy = true
	end
	if GetConVarNumber("vj_manhunt_aggressive_tactics") == 1 then
		self.WaitForEnemyToComeOut = false
		self.MoveOrHideOnDamageByEnemy = false
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 0 then
		self.VJ_NPC_Class = {"CLASS_UNITED_STATES","CLASS_AMERICA","CLASS_MANHUNT_CCPD"}
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 1 then
		self.VJ_NPC_Class = 
		{
			"CLASS_MANHUNT_CCPD",
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

-- Custom
ENT.CCPD_ChatterT = 0

function ENT:CustomOnPreInitialize() -- Picks random voices once a SNPC is spawned, however, they will all have Footsteps, Pained and Death sounds.
self.CCPD_ChatterT = CurTime() + math.Rand(1, 30)
	local voices = math.random(1,4)
	if voices == 1 then --  Cop voiceset 1
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ds6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur11.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1sub1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1sub2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1sub3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1tyd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1tyd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1tyd3.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc6.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin5.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh6.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja6.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1dbs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur10.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sur5.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr1.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic4.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tsz3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic2.mp3",
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
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1rti6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wti6.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ncr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1nsr6.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc2.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur8.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v1jur6.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v1bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc3.mp3", -- Shirt CCPD
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v1wea6.mp3"
		}
	elseif voices == 2 then --  Cop voiceset 2
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2sub2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur5.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sur5.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ds6.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh5.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur11.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2dbs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur4.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tsz3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wic6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sur4.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2sub4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2sub5.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2sub3.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p2v2jur8.mp3",
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
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2rti6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sal6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wti6.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ncr6.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc5.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic6.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2gic10.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p2v2bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2ptc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p2v2wea5.mp3"
		}
	elseif voices == 3 then --  Cop voiceset 3
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ds6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v1jur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v1jur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v1jur5.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur6.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc6.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh5.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea4.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sur3.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic3.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cse3.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic5.mp3",
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
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1rti6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sal6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wti6.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tpd6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tsz3.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ncr6.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp6.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic3.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1gic4.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ja6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1ptc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v1wem6.mp3"
		}
	elseif voices == 4 then --  Cop voiceset 4
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ds6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wea6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2jur3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2jur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2tyd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2tyd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2tyd3.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur6.mp3",
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh4.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cse2.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cse3.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2dbs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2sub1.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ptc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sin6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2jur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2jur2.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2pln1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2pln2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2pln3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sur3.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cin3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst9.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cin1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cin2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2sub2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2sub3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/scripted/p3v2sub4.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cnr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cst10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic7.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic8.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic10.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2nsr6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tse6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsz1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsz2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tsz3.mp3",
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
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfa6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2rti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2rti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2rti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2rti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2rti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2sal6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wti6.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr6.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp3.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gr1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gr2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic3.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2gic9.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ncr6.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2bp6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2cfh6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2ntc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2prs6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2tc6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wem6.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic1.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic2.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic3.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic4.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic5.mp3",
			"vj_manhunt/vocals/characters/ccpd_police/p3v2wic6.mp3"
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
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/cop1.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
		if self:GetModel() == "models/manhunt/npc/cop3.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	VJ_STOPSOUND(self.CCPD_ChatterSd)
end
---------------------------------------------------------------------------------------------------------------------------------------------