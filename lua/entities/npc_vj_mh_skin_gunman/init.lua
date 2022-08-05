AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:CustomOnInitialize()
	self:SetSkin(math.random(0,2))
	if self:GetModel() == "models/manhunt/npc/skin3.mdl" then
	self:SetSkin(math.random(0,3)) end
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
		self.VJ_NPC_Class = {"CLASS_MANHUNT_SKINZ_FRIENDLY","CLASS_PLAYER_ALLY"}
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

--[[ function ENT:CustomOnIdleDialogueAnswer() 
self:VJ_ACT_PLAYACTIVITY({"open_door_towards_left","trader_idle2"},true,1,false)
end
function ENT:CustomOnIdleDialogue() 
self:VJ_ACT_PLAYACTIVITY({"bandit_idle2","lineidle02","motionright"},true,1,false)

end ]]

function ENT:CustomOnPreInitialize() -- This will pick a random voiceset for the npc to use. Death/Pain/Gib/Footstep sounds are shared.
    local voices = math.random(1,6)
    if voices == 1 then -- Skinz voiceset 1
    	self.Model = {"models/manhunt/npc/skin2.mdl"}
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc5.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k1v1dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs6.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur5.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds5.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs3.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst9.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1bp6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsz3.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sur3.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst7.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti2.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic7.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic8.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic9.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gic10.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsz2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti2.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k1v1bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1rti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tse6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tsz1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1wti5.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1dbs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tb3.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ct5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1sal3.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cst9.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc4.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v1bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1prs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1ptc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v1tc6.mp3"
		}
	elseif voices == 2 then -- Skinz voiceset 2
		self.Model = {"models/manhunt/npc/skin2.mdl"}
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti6.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur6.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr3.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti5.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal2.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k1v2dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sur3.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse5.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse6.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic7.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic8.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic9.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gic10.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse4.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k1v2cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2wti6.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2dbs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd5.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2bp6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tc6.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2ct5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ntc5.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse2.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2nsr2.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k1v2scb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tse3.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k1v2bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tpd6.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsz1.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsz2.mp3",
			"vj_manhunt/vocals/characters/skinz/k1v2tsz3.mp3"
		}
	elseif voices == 3 then -- Skinz voiceset 3
		self.Model = {"models/manhunt/npc/skin3.mdl"}
		self.SuppressingSoundChance = 6
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsz3.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v1sca2.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v1sca5.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v1sca6.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v1sca7.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti2.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1ct5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse4.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti4.mp3",
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tb3.mp3",
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k2v1dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sur6.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cse3.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic6.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic7.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic8.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic9.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gic10.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti4.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k2v1cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1rti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti5.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v1sca1.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs5.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ntc3.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tb2.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsz2.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v1bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1bp6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1ptc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1tsz1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v1wti6.mp3"
		}
	elseif voices == 4 then -- Skinz voiceset 4
		self.Model = {"models/manhunt/npc/skin3.mdl"}
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur1.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur2.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ptc6.mp3"
		}
		self.SoundTbl_MedicBeforeHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc2.mp3"
		}
		self.SoundTbl_MedicReceiveHeal = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja4.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k2v2dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur6.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sur3.mp3"

		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsz1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsz3.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic7.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic8.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic9.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gic10.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tse6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti6.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k2v2cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tsz2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2wti5.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2nsr2.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc6.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ct5.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ptc4.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k2v2bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2bp6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2ntc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2prs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k2v2tc6.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v2scb1.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k2v2scb2.mp3"
		}
	elseif voices == 5 then -- Skinz voiceset 5
		self.SuppressingSoundChance = 6
		self.Model = {"models/manhunt/npc/skin1.mdl"}
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k3v1sca1.mp3",
			"vj_manhunt/vocals/characters/skinz/scripted/k3v1sca2.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1sur3.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc5.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k3v1dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1prs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tsh1.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tsh2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tsh3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tsh4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tsh5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tsh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tsz3.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1sur6.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1prs4.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst10.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic7.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic8.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic9.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gic10.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1nsr2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1nsr3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1nsr4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1nsr5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse6.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1wti2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1wti3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1wti4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1wti6.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k3v1cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1rti1.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1rti2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1rti3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1rti4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1rti5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1rti6.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal1.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tsz2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1wti5.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1tpd1.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tpd2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tpd3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tpd4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tpd5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ncr1.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1ncr2.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1ncr3.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1ncr4.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1ncr5.mp3",
            "vj_manhunt/vocals/characters/skinz/k3v1ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tsz1.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1bp6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc2.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1gr3.mp3"
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cin1.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tb1.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v1cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ct5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1prs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v1tc6.mp3"
		}
	elseif voices == 6 then -- Skinz voiceset 6
		self.Model = {"models/manhunt/npc/skin1.mdl"}
		self.SoundTbl_Alert = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfa5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ct1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ds6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tb3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsz3.mp3"
		}
		self.SoundTbl_MoveOutOfPlayersWay = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur6.mp3"
		}
		self.SoundTbl_BecomeEnemyToPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh6.mp3"
		}
		self.SoundTbl_AllyDeath =
		{
			"vj_manhunt/vocals/characters/skinz/k3v2dbs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2dbs2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2dbs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2dbs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2dbs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2dbs6.mp3"
		}
		self.SoundTbl_CombatIdle = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2cfa1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfa2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfa4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2prs3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2prs4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2prs5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2prs6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsh6.mp3"
		}
		self.SoundTbl_OnGrenadeSight  = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2pln1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2pln2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2pln3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sur3.mp3"
		}
		self.SoundTbl_IdleDialogueAnswer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2cnr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cnr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr2.mp3"
		}
		self.SoundTbl_IdleDialogue = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2cin1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cin2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cin3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ct6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsz2.mp3"
		}
		self.SoundTbl_Idle = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2cnr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cnr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cnr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst7.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst8.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst9.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cst10.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gic6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tse6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti6.mp3",
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
			"vj_manhunt/vocals/characters/skinz/k3v2cfa3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cfa6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2rti6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tb2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tsz1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2wti5.mp3"
		}
		self.SoundTbl_OnKilledEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2tpd1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tpd2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tpd3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tpd4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tpd5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tpd6.mp3"
		}
		self.SoundTbl_LostEnemy = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2bp5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cnr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ncr6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2nsr5.mp3"
		}
		self.SoundTbl_DamageByPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2bp1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2bp2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2bp6.mp3"
		}
		self.SoundTbl_OnPlayerSight = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2ct2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ct4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ct5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gr1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gr2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2gr3.mp3"	
		}
		self.SoundTbl_FollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2sal6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cse1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2cin2.mp3"
		}
		self.SoundTbl_UnFollowPlayer = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2prs1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2prs2.mp3"
		}
		self.SoundTbl_Suppressing = 
		{
			"vj_manhunt/vocals/characters/skinz/k3v2bp3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2bp4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ct3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ja6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ntc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc2.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc3.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc4.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc5.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2ptc6.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tb1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc1.mp3",
			"vj_manhunt/vocals/characters/skinz/k3v2tc4.mp3"
		}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gibs(gType)
	if gType == "headgib" then
		if self:GetModel() == "models/manhunt/npc/skin1.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
		if self:GetModel() == "models/manhunt/npc/skin2.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
		if self:GetModel() == "models/manhunt/npc/skin3.mdl" then
			self:SetBodygroup(1,math.random(1,3))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------