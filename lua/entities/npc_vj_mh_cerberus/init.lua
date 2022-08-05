AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/manhunt/npc/cerberus.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
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
	self:SetBodygroup(2,math.random(0,1))
	if math.random(1,15) == 1 then self.IsMedicSNPC = true end
	if GetConVarNumber("vj_manhunt_hunters_ply_allied") == 0 then
		self.FriendsWithAllPlayerAllies = false 
	end
	if GetConVarNumber("vj_manhunt_hunters_ply_allied") == 1 then
		self.FriendsWithAllPlayerAllies = true 
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 0 then
		self.VJ_NPC_Class = {"CLASS_MANHUNT_CERBERUS_FRIENDLY","CLASS_MANHUNT_SMILIES_FRIENDLY","CLASS_MANHUNT_WARDOGS_FRIENDLY","CLASS_PLAYER_ALLY"}
	end
	if GetConVarNumber("vj_manhunt_hunters_allied") == 1 then
		self.VJ_NPC_Class = 
		{
			"CLASS_PLAYER_ALLY",
			"CLASS_MANHUNT_HOODS_FRIENDLY",
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

function ENT:CustomOnPreInitialize() -- Picks random voices once a SNPC is spawned, however, they will all have Footsteps, Pained and Death sounds.
    local voices = math.random(1,3)
	if voices == 1 then --  Cerberus voiceset 1
        self.SoundTbl_Alert = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v1ds1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1sal4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tsh6.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1ds3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ds6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea1.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/cerberus/c1v1cst6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst1.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/cerberus/c1v1gic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic4.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v1prs1.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v1prs2.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v1prs3.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1pln1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1pln2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1pln3.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1cse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr2.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1cin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst1.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cnr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cst9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gic10.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tse6.mp3"
        }
        self.SoundTbl_Investigate = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1cfa6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1rti6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1sal6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1wti6.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tpd6.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v1tsh6.mp3"
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1gr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1wic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v1man1.mp3",
        }
        self.SoundTbl_UnFollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1wem2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sal3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1ncr4.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1sin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sin4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sin5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1sin6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1tc6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wea6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wem6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1wic6.mp3"
        }
    elseif voices == 2 then --  Cerberus voiceset 2
        self.SoundTbl_Alert = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v2ds1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ds2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ds3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ds4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ds5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ds6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh6.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc3.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs5.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh6.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tsh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc6.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v1pln1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1pln2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v1pln3.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2cse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst7.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2cin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr5.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfa6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cnr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cst9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic10.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wem6.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est1.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est2.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est3.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est4.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est6.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est7.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est8.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2est9.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2man1.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2man2.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2man3.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2man4.mp3",
			"vj_manhunt/vocals/characters/cerberus/scripted/c1v2man5.mp3"
        }
        self.SoundTbl_Investigate = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v2rti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2rti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2rti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2rti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2rti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2rti6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2sal6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2wti6.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c1v2tpd6.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2ncr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tsh6.mp3",
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2gr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2tse5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tc4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic3.mp3"
        }
        self.SoundTbl_UnFollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2tse4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2tse6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2gic10.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2cfh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2sin6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wea6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c1v2wic6.mp3"
        }
    elseif voices == 3 then --  Cerberus voiceset 3
        self.SoundTbl_Alert = 
        {
            "vj_manhunt/vocals/characters/cerberus/c2v1ds1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ds2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ds3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ds4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ds5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ds6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa6.mp3"
        }
        self.SoundTbl_MoveOutOfPlayersWay = 
        {
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh6.mp3"
        }
        self.SoundTbl_BecomeEnemyToPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc1.mp3"
        }
        self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs6.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
            "vj_manhunt/vocals/characters/cerberus/c2v1cst1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs5.mp3"
		}
        self.SoundTbl_AllyDeath =
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1dbs6.mp3"
        }
        self.SoundTbl_CombatIdle = 
        {
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc1.mp3"
        }
        self.SoundTbl_OnGrenadeSight  = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1pln1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1pln2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1pln3.mp3"
        }
        self.SoundTbl_IdleDialogueAnswer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst6.mp3"
        }
        self.SoundTbl_IdleDialogue = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr3.mp3"
        }
        self.SoundTbl_Idle = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cnr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cst9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic7.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic8.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic9.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic10.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tse6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wem6.mp3"
        }
        self.SoundTbl_Investigate = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfa2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1rti6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1sal6.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1wti6.mp3"
        }
        self.SoundTbl_OnKilledEnemy = 
        {
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tpd6.mp3"
        }
        self.SoundTbl_LostEnemy = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr6.mp3"
        }
        self.SoundTbl_DamageByPlayer = 
        {
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh1.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh2.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh3.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh4.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh5.mp3",
            "vj_manhunt/vocals/characters/cerberus/c2v1tsh6.mp3"
        }
        self.SoundTbl_OnPlayerSight = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1gr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gr2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gr3.mp3"
        }
        self.SoundTbl_FollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1wea2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1ncr1.mp3"
        }
        self.SoundTbl_UnFollowPlayer = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1gic3.mp3"
        }
        self.SoundTbl_Suppressing = 
        {
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1cfh6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1sin6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1tc6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wea6.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic1.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic2.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic3.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic4.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic5.mp3",
			"vj_manhunt/vocals/characters/cerberus/c2v1wic6.mp3"
        }
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/cerberus.mdl" then
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