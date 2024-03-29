/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------
*/
------------------ Addon Information ------------------
local PublicAddonName = "Manhunt SNPC Pack"
local AddonName = "Manhunt SNPC Pack"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_manhunt_snpc_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
local LNRExists = file.Exists("lua/autorun/vj_lnrhl2_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vManhunt_Hunters_Cat = "Manhunt - Hunters"
	local vManhunt_Misc_Cat = "Manhunt - Main Characters"
	local vManhunt_EntityCat = "Manhunt - Entities"	
	VJ.AddCategoryInfo(vManhunt_Hunters_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_Misc_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_EntityCat, {Icon = "vgui/mh_logo.png"})
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	Item Rarites = 5 (very common), 4 (common), 3 (uncommon), 2 (rare), 1 (extremely rare)
	local ManHunt_Hoods_Striker_Weapons =
	{
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_crowbar",
		"weapon_vj_mh_melee_crowbar",
		"weapon_vj_mh_melee_crowbar",
		"weapon_vj_mh_melee_crowbar",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_hammer",
		"weapon_vj_mh_melee_hammer",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_fists"
	}

	local ManHunt_Hoods_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light"
	}

	local ManHunt_Skinz_Striker_Weapons =
	{
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_machete"
	}

	local ManHunt_Skinz_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_nailgun",
		"weapon_vj_mh_pistol_nailgun",
		"weapon_vj_mh_pistol_nailgun",
		"weapon_vj_mh_pistol_nailgun",
		"weapon_vj_mh_pistol_nailgun",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff"
	}

	local ManHunt_CCPD_Cop_Striker_Weapons =
	{
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick"
		//"weapon_vj_mh_melee_bat_w"
	}

	local ManHunt_CCPD_Cop_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_rifle_sniper"
	}

	local ManHunt_CCPD_Swat_Striker_Weapons =
	{
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_bat_m"
	}

	local ManHunt_CCPD_Swat_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_rifle_assault"
	}

	local ManHunt_Ramirez_Weapons =
	{
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_rifle_assault"
	}

	local ManHunt_Smiley_Striker_Weapons =
	{
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_meat_cleaver",
		"weapon_vj_mh_melee_meat_cleaver",
		"weapon_vj_mh_melee_meat_cleaver",
		"weapon_vj_mh_melee_meat_cleaver",
		"weapon_vj_mh_melee_hammer",
		"weapon_vj_mh_melee_hammer",
		"weapon_vj_mh_melee_hammer",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_blackjack",
		"weapon_vj_mh_melee_fists"
	}

	local ManHunt_Smiley_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_pistol_light_ps2",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff"
	}

	local ManHunt_Cerberus_Striker_Weapons =
	{
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_nightstick",
		"weapon_vj_mh_melee_bat_w"
	}

	local ManHunt_Cerberus_Gunman_Weapons =
	{
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_smg",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper"
	}

	local ManHunt_Starkweather_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_smg"
	}

	local ManHunt_CerbT_Weapons =
	{
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_rifle_assault",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_pistol_smg"
	}

	local ManHunt_Wardogs_Striker_Weapons =
	{
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_machete",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m",
		"weapon_vj_mh_melee_bat_m"
	}

	local ManHunt_Wardogs_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_rifle_sniper",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_rifle_assault"
	}

	local ManHunt_Innocentz_Striker_Weapons =
	{
		"weapon_vj_mh_melee_sickle",
		"weapon_vj_mh_melee_sickle",
		"weapon_vj_mh_melee_sickle",
		"weapon_vj_mh_melee_sickle",
		"weapon_vj_mh_melee_sickle",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_knife",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_fireaxe",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_bat_w",
		"weapon_vj_mh_melee_fists",
		"weapon_vj_mh_melee_fists"
	}

	local ManHunt_Innocentz_Gunman_Weapons =
	{
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_pistol_38r",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_shotgun_sawnoff",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_pistol_heavy",
		"weapon_vj_mh_shotgun",
		"weapon_vj_mh_pistol_smg"
	}

	---------- Hunters ---------------------
	-- Listed in order of apperance in Manhunt 1
	-- First seen in Born Again
	VJ.AddNPC_HUMAN("Hoods Member (Friendly)","npc_vj_mh_hood",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Member","npc_vj_mh_hood_h",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Gunman (Friendly)","npc_vj_mh_hood_gunman",ManHunt_Hoods_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Gunman","npc_vj_mh_hood_gunman_h",ManHunt_Hoods_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen in White Trash
	VJ.AddNPC_HUMAN("Skinz Member (Friendly)","npc_vj_mh_skin",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Member","npc_vj_mh_skin_h",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Gunman (Friendly)","npc_vj_mh_skin_gunman",ManHunt_Skinz_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Gunman","npc_vj_mh_skin_gunman_h",ManHunt_Skinz_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen in Grounds For Assault
	VJ.AddNPC_HUMAN("Wardogs Member (Friendly)","npc_vj_mh_wardog",ManHunt_Wardogs_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Wardogs Member","npc_vj_mh_wardog_h",ManHunt_Wardogs_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Wardogs Gunman (Friendly)","npc_vj_mh_wardog_gunman",ManHunt_Wardogs_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Wardogs Gunman","npc_vj_mh_wardog_gunman_h",ManHunt_Wardogs_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen in View Of Innocence
	VJ.AddNPC_HUMAN("Innocentz Member (Friendly)","npc_vj_mh_innocent",ManHunt_Innocentz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Innocentz Member","npc_vj_mh_innocent_h",ManHunt_Innocentz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Innocentz Gunman (Friendly)","npc_vj_mh_innocent_gunman",ManHunt_Innocentz_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Innocentz Gunman","npc_vj_mh_innocent_gunman_h",ManHunt_Innocentz_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen in Doing Time
	VJ.AddNPC_HUMAN("Smileys Member (Friendly)","npc_vj_mh_smiley",ManHunt_Smiley_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Smileys Member","npc_vj_mh_smiley_h",ManHunt_Smiley_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Smileys Gunman (Friendly)","npc_vj_mh_smiley_gunman",ManHunt_Smiley_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Smileys Gunman","npc_vj_mh_smiley_gunman_h",ManHunt_Smiley_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen Road To Ruin (Cutscene), first seen in scene Kill The Rabbit (Gameplay)
	VJ.AddNPC_HUMAN("Cerberus Unit (Friendly)","npc_vj_mh_cerberus",ManHunt_Cerberus_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Cerberus Unit","npc_vj_mh_cerberus_h",ManHunt_Cerberus_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Cerberus Armed Unit (Friendly)","npc_vj_mh_cerberus_gunman",ManHunt_Cerberus_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Cerberus Armed Unit","npc_vj_mh_cerberus_gunman_h",ManHunt_Cerberus_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- First seen in Press Coverage
	VJ.AddNPC_HUMAN("CCPD Officer (Friendly)","npc_vj_mh_ccpd_cop",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD Officer","npc_vj_mh_ccpd_cop_h",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD Armed Response (Friendly)","npc_vj_mh_ccpd_cop_gunman",ManHunt_CCPD_Cop_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD Armed Response","npc_vj_mh_ccpd_cop_gunman_h",ManHunt_CCPD_Cop_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD SWAT Officer (Friendly)","npc_vj_mh_ccpd_swat",ManHunt_CCPD_Swat_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD SWAT Officer","npc_vj_mh_ccpd_swat_h",ManHunt_CCPD_Swat_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD SWAT Armed Response (Friendly)","npc_vj_mh_ccpd_swat_gunman",ManHunt_CCPD_Swat_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD SWAT Armed Response","npc_vj_mh_ccpd_swat_gunman_h",ManHunt_CCPD_Swat_Gunman_Weapons,vManhunt_Hunters_Cat)
	-- Monkeys can be found in the scene Monkey See, Monkey Die (No melee variant because they only use firearms)
	VJ.AddNPC_HUMAN("Monkey (Friendly)","npc_vj_mh_monkey",{"weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun","weapon_vj_mh_shotgun"},vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Monkey","npc_vj_mh_monkey_h",{"weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun_sawnoff","weapon_vj_mh_shotgun","weapon_vj_mh_shotgun"},vManhunt_Hunters_Cat)
	---------- Misc ------------------------
	VJ.AddNPC_HUMAN("James Earl Cash (Friendly)","npc_vj_mh_cash",ManHunt_CerbT_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("James Earl Cash","npc_vj_mh_cash_h",ManHunt_CerbT_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Ramirez (Friendly)","npc_vj_mh_ramirez",ManHunt_Ramirez_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Ramirez","npc_vj_mh_ramirez_h",ManHunt_Ramirez_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Lionel Starkweather (Friendly)","npc_vj_mh_director",ManHunt_Starkweather_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Lionel Starkweather","npc_vj_mh_director_h",ManHunt_Starkweather_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Cerberus Team Leader (Friendly)","npc_vj_mh_cerberus_l",ManHunt_CerbT_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Cerberus Team Leader","npc_vj_mh_cerberus_l_h",ManHunt_CerbT_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("White Rabbit (Friendly)","npc_vj_mh_wrabbit",ManHunt_Starkweather_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("White Rabbit","npc_vj_mh_wrabbit_h",ManHunt_Starkweather_Weapons,vManhunt_Misc_Cat)
	---------- Weapons ---------------------
	VJ.AddNPCWeapon("VJ_MH_Pistol_Light", "weapon_vj_mh_pistol_light")
	VJ.AddNPCWeapon("VJ_MH_Pistol_Light (PS2)", "weapon_vj_mh_pistol_light_ps2")
	VJ.AddNPCWeapon("VJ_MH_Pistol_Heavy", "weapon_vj_mh_pistol_heavy")
	VJ.AddNPCWeapon("VJ_MH_Pistol_Revolver", "weapon_vj_mh_pistol_38r")
	VJ.AddNPCWeapon("VJ_MH_Pistol_Nailgun", "weapon_vj_mh_pistol_nailgun")
	VJ.AddNPCWeapon("VJ_MH_Pistol_SMG", "weapon_vj_mh_pistol_smg")
	VJ.AddNPCWeapon("VJ_MH_Rifle_Sniper (Bolt)", "weapon_vj_mh_rifle_sniper")
	VJ.AddNPCWeapon("VJ_MH_Rifle_M16", "weapon_vj_mh_rifle_assault")
	VJ.AddNPCWeapon("VJ_MH_Melee_Blackjack", "weapon_vj_mh_melee_blackjack")
	VJ.AddNPCWeapon("VJ_MH_Melee_Bat (Metal)", "weapon_vj_mh_melee_bat_m")
	VJ.AddNPCWeapon("VJ_MH_Melee_Bat (Wood)", "weapon_vj_mh_melee_bat_w")
	VJ.AddNPCWeapon("VJ_MH_Melee_Nightstick", "weapon_vj_mh_melee_nightstick")
	VJ.AddNPCWeapon("VJ_MH_Melee_Fists", "weapon_vj_mh_melee_fists")
	VJ.AddNPCWeapon("VJ_MH_Shotgun_Sawnoff", "weapon_vj_mh_shotgun_sawnoff")
	VJ.AddNPCWeapon("VJ_MH_Shotgun", "weapon_vj_mh_shotgun")
	VJ.AddNPCWeapon("VJ_MH_Melee_Crowbar", "weapon_vj_mh_melee_crowbar")
	VJ.AddNPCWeapon("VJ_MH_Melee_Machete", "weapon_vj_mh_melee_machete")
	VJ.AddNPCWeapon("VJ_MH_Melee_Knife", "weapon_vj_mh_melee_knife")
	VJ.AddNPCWeapon("VJ_MH_Melee_Hammer", "weapon_vj_mh_melee_hammer")
	VJ.AddNPCWeapon("VJ_MH_Melee_Meat_Cleaver", "weapon_vj_mh_melee_meat_cleaver")
	VJ.AddNPCWeapon("VJ_MH_Melee_Sickle", "weapon_vj_mh_melee_sickle")
	VJ.AddNPCWeapon("VJ_MH_Melee_SmallAxe", "weapon_vj_mh_melee_fireaxe")
	---------- Entities ---------------------
	VJ.AddEntity("Painkillers", "sent_vj_mh_pills_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Shotgun Ammo", "sent_vj_mh_shotgun_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Pistol Ammo", "sent_vj_mh_pistol_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Revolver Ammo", "sent_vj_mh_revolver_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("SMG Ammo", "sent_vj_mh_smg_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Rifle Ammo", "sent_vj_mh_rifle_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	--VJ.AddEntity("Light Pistol", "sent_vj_mh_pistol_light_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu // WORK IN PROGRESS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Decals ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Blood
	game.AddDecal("VJ_Manhunt_Blood_Red",{"decals/manhunt/blood1","decals/manhunt/blood2","decals/manhunt/blood3"})
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Precaches ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	util.PrecacheModel("models/manhunt/gibs/1.mdl")
	util.PrecacheModel("models/manhunt/gibs/2.mdl")
	util.PrecacheModel("models/manhunt/gibs/3.mdl")
	util.PrecacheModel("models/manhunt/gibs/4.mdl")
	util.PrecacheModel("models/manhunt/npc/cash.mdl")
	util.PrecacheModel("models/manhunt/npc/cerberus.mdl")
	util.PrecacheModel("models/manhunt/npc/cerberusleader.mdl")
	util.PrecacheModel("models/manhunt/npc/cop1.mdl")
	util.PrecacheModel("models/manhunt/npc/cop3.mdl")
	util.PrecacheModel("models/manhunt/npc/hood1.mdl")
	util.PrecacheModel("models/manhunt/npc/hood2.mdl")
	util.PrecacheModel("models/manhunt/npc/hood3.mdl")
	util.PrecacheModel("models/manhunt/npc/innocent1.mdl")
	util.PrecacheModel("models/manhunt/npc/innocent2.mdl")
	util.PrecacheModel("models/manhunt/npc/innocent3.mdl")
	util.PrecacheModel("models/manhunt/npc/monkey.mdl")
	util.PrecacheModel("models/manhunt/npc/rabbit.mdl")
	util.PrecacheModel("models/manhunt/npc/ramirez.mdl")
	util.PrecacheModel("models/manhunt/npc/skin1.mdl")
	util.PrecacheModel("models/manhunt/npc/skin2.mdl")
	util.PrecacheModel("models/manhunt/npc/skin3.mdl")
	util.PrecacheModel("models/manhunt/npc/smiley1.mdl")
	util.PrecacheModel("models/manhunt/npc/smiley2.mdl")
	util.PrecacheModel("models/manhunt/npc/smiley3.mdl")
	util.PrecacheModel("models/manhunt/npc/starkweather.mdl")
	util.PrecacheModel("models/manhunt/npc/swat1.mdl")
	util.PrecacheModel("models/manhunt/npc/swat2.mdl")
	util.PrecacheModel("models/manhunt/npc/wardog1.mdl")
	util.PrecacheModel("models/manhunt/npc/wardog2.mdl")
	util.PrecacheModel("models/manhunt/npc/wardog3.mdl")
------------------------------------------------------------------------------------------------------------------------------------------------------
	VJ.AddConVar("vj_manhunt_lnr_alert", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_manhunt_hunters_allied", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_ply_allied", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_aggressive_tactics", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_headshot_sound", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Manhunt", "Manhunt", "", "", function(Panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
				return
			end
			Panel:AddControl("Header", {Description = "NOTICE!: Newly spawned SNPC's will take affect to the changes you made!"})
			Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
			Panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_manhunt_hunters_allied 0\nvj_manhunt_hunters_ply_allied 0\nvj_manhunt_aggressive_tactics 0"})
			Panel:ControlHelp(" ")
			Panel:AddControl("Checkbox", {Label = "Should Hunters be allied together?", Command = "vj_manhunt_hunters_allied"})
			Panel:ControlHelp("If enabled, All hunters will be friendly to all")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("Effects Friendly and Hostile Manhunt SNPCs")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("If disabled, All hunters will revert to their default class relations")
			Panel:AddControl("Checkbox", {Label = "Should Hunters be allied to other Friendly Hunters?", Command = "vj_manhunt_hunters_ply_allied"})
			Panel:ControlHelp(" ")	
			Panel:ControlHelp("If enabled, All hunters will be friendly to different gang Hunters")
			Panel:ControlHelp("Effects Friendly Manhunt SNPCs")
			Panel:ControlHelp("NOTE: This CMD is meant to extend allies without affecting the Hostile variants, such as Hoods as they do not have any allies.")
			Panel:ControlHelp(" ")
			Panel:AddControl("Checkbox", {Label = "Should NPCs be aggressive?", Command = "vj_manhunt_aggressive_tactics"})
			Panel:ControlHelp("If enabled, Hunters with firearms will aggressively hunt down their enemies, and will not run to cover if being attacked.")
			Panel:AddControl("Checkbox", {Label = "Enable headshot sounds for Human Hunters?", Command = "vj_manhunt_hunters_headshot_sound"})
		end)
	end)
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT_RELATIONSHIPS", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Manhunt (zClass Allies)", "Manhunt (zClass Allies)", "", "", function(Panel)

			Panel:AddControl("Header", {Description = "This table shows which group of Hunters are friendly towards."})
			Panel:ControlHelp("NOTE: If 'vj_manhunt_hunters_allied' is set to 1, then ALL Hunters/Bosses will be allies to each other.")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("NOTE: If 'vj_manhunt_hunters_ply_allied' is set to 1, only friendly Hunters/Bosses will be allies to friendly SNPCs in this pack")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Hoods")
			Panel:ControlHelp("• Hoods")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Skinz")
			Panel:ControlHelp("• Skinz")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Wardogs")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp("• Skinz")
			Panel:ControlHelp("• Innocentz")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Innocentz")
			Panel:ControlHelp("• Innocentz")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Smileys")
			Panel:ControlHelp("• Smileys")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Cerberus")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp("• Smileys")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("The Carcer City Police / SWAT")
			Panel:ControlHelp("• CCPD / SWAT")
			Panel:ControlHelp("• America")
			Panel:ControlHelp("• United States")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("NOTE: America / United States relationship makes CCPD friendly to other VJ Cop/Military addons")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("(BOSS) Ramirez")
			Panel:ControlHelp("• Skinz")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp("• Innocentz")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("(BOSS) White Rabbit")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp("• Smileys")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("(BOSS) Cerberus Team Leader")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp("• Smileys")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("(BOSS) Lionel Starkweather")
			Panel:ControlHelp("• Cerberus")
			Panel:ControlHelp("• Wardogs")
			Panel:ControlHelp("• CCPD")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("James Earl Cash")
			Panel:ControlHelp("• Journalist (SOON)")
		end)
	end)
end

// If Lethal Necrotics Reanimated: Half-Life 2 is installed and detected, opens the Undead menu category and pester the player, knowing that its installed and working
if LNRExists == true then
	local vManhunt_Undead_Cat = "Manhunt - Undead"
	VJ.AddCategoryInfo(vManhunt_Undead_Cat, {Icon = "vgui/mh_zmb_logo.png"})
	
	if GetConVarNumber("vj_manhunt_lnr_alert") == 1 then
		if CLIENT then
			hook.Add("Initialize","LNRTRUE",function()
				local vjorange = Color(255,100,0)
				local lightblue = Color(0,199,255)
				local green = Color(0,255,0)
				local white = Color(255,255,255)
				timer.Simple(10,function()
					chat.AddText(vjorange,"---------- MANHUNT ----------")
					chat.AddText(lightblue,"• LNR Detected!")
					chat.AddText(green,"• You can use Manhunt Undead NPCs")
					chat.AddText(white,"• To disable this message, set vj_manhunt_lnr_alert to 0")
					chat.AddText(vjorange,"-----------------------------")
					//local dingaling_sound = CreateSound(game.GetWorld(), "weapons/pickup_hel.wav")
					local dingaling_sound = CreateSound(game.GetWorld(), "vj_manhunt/dingaling_good.mp3")
					dingaling_sound:SetSoundLevel(0)
					dingaling_sound:Play()
				end)
			end)
		end
	end

	---------- Undead ----------------------
	VJ.AddNPC("Undead Hood Walker","npc_vj_mh_undead_hood_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Hood Bolter","npc_vj_mh_undead_hood_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Skinz Walker","npc_vj_mh_undead_skin_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Skinz Bolter","npc_vj_mh_undead_skin_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Cop Walker","npc_vj_mh_undead_cop_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Cop Bolter","npc_vj_mh_undead_cop_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead SWAT Walker","npc_vj_mh_undead_swat_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead SWAT Bolter","npc_vj_mh_undead_swat_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Smiley Walker","npc_vj_mh_undead_smiley_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Smiley Bolter","npc_vj_mh_undead_smiley_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Wardog Walker","npc_vj_mh_undead_wardog_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Wardog Bolter","npc_vj_mh_undead_wardog_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Innocentz Walker","npc_vj_mh_undead_innocent_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Innocentz Bolter","npc_vj_mh_undead_innocent_run",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Cerberus Walker","npc_vj_mh_undead_cerberus_wlk",vManhunt_Undead_Cat)
	VJ.AddNPC("Undead Cerberus Bolter","npc_vj_mh_undead_cerberus_run",vManhunt_Undead_Cat)
	
	--Main Characters Undead
	--VJ.AddNPC("Undead James Walker","npc_vj_mh_undead_james_wlk",vManhunt_Undead_Main_Cat)
	--VJ.AddNPC("Undead James Bolter","npc_vj_mh_undead_james_run",vManhunt_Undead_Main_Cat)
	
	-- ENT Spawns or Spawners
	VJ.AddNPC("Random Undead (Runner)","sent_vj_mhundead_randrun",vManhunt_Undead_Cat)
	VJ.AddNPC("Random Undead (Walker)","sent_vj_mhundead_randwal",vManhunt_Undead_Cat)
	VJ.AddNPC("Random Undead","sent_vj_mhundead_rand",vManhunt_Undead_Cat)
	VJ.AddNPC("(Undead Map Spawner)","sent_vj_mh_undead_mapspawner",vManhunt_Undead_Cat)

	-- Used for testing the eye sprites 
	--VJ.AddNPC("EYE TEST Walker","npc_vj_mh_undead_test_wlk",vManhunt_Undead_Cat)
	--VJ.AddNPC("EYE TEST Bolter","npc_vj_mh_undead_test_run",vManhunt_Undead_Cat)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Decals ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Blood
	game.AddDecal("VJ_Manhunt_Blood_DarkRed",{"decals/manhunt/blood_zmb1","decals/manhunt/blood_zmb2","decals/manhunt/blood_zmb3"})
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Precaches ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	util.PrecacheModel("models/manhunt/npc/undead/cerberus_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/cop1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/cop3_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/hood1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/hood2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/hood3_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/innocent1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/innocent2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/innocent3_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/skin1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/skin2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/skin3_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/smiley1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/smiley2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/smiley3_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/swat1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/swat2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/wardog1_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/wardog2_undead.mdl")
	util.PrecacheModel("models/manhunt/npc/undead/wardog3_undead.mdl")
-----------------------------------------------------------------------------------------------------------------------------------------------------
	VJ.AddConVar("vj_manhunt_hunters_zmb_eyeglow", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_zmb_faster", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_zmb_riser", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	--VJ.AddConVar("vj_manhunt_hunters_zmb_deathanim", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	--VJ.AddConVar("vj_manhunt_hunters_zmb_humanallegiance", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_zmb_map_music", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_zmb_map_spooky_snds", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	VJ.AddConVar("vj_manhunt_hunters_zmb_map_delete", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
------------------------------------------------------------------------------------------------------------------------------------------------------
	if CLIENT then
		hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT_UNDEAD", function()
			spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Manhunt (Undead)", "Manhunt (Undead)", "", "", function(Panel)
				if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
					Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
					Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
					return
				end
				Panel:AddControl("Header", {Description = "NOTICE!: Newly spawned SNPC's will take affect to the changes you made!"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
				Panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_manhunt_hunters_zmb_eyeglow 1\nvj_manhunt_hunters_zmb_riser 1\nvj_manhunt_hunters_zmb_map_music 1\nvj_manhunt_hunters_zmb_map_delete 1\nvj_manhunt_hunters_zmb_map_spooky_snds 1\nvj_manhunt_hunters_zmb_faster 0"})

				Panel:AddControl("Checkbox", {Label = "Eneble eyeglow for Undead Hunters?", Command = "vj_manhunt_hunters_zmb_eyeglow"})
				Panel:ControlHelp("NOTE: Having too many Undead SNPCs may lag your computer with eyeglow on.")
				
				Panel:AddControl("Checkbox", {Label = "Eneble dirt spawns for Undead Hunters?", Command = "vj_manhunt_hunters_zmb_riser"})
				Panel:ControlHelp("If enabled, Undead hunters can use the rise sapwn animation.\n\nAim at the ground of the available materials to have the zombie do the rising animation.\n\nWorks only on 'soft' materials such as Grass, Snow, Dirt, Sand and Foliage")

				--Panel:AddControl("Checkbox", {Label = "Should Undead be conscience?", Command = "vj_manhunt_hunters_zmb_humanallegiance"})
				--Panel:ControlHelp("If enabled, Undead Hunters will have friendly relationship based on what their model is")
					
				Panel:AddControl("Checkbox", {Label = "Undead Hunters move faster", Command = "vj_manhunt_hunters_zmb_faster"})
				Panel:ControlHelp("If enabled, Walkers will move at 'running' speed & Bolters will super sprint.")

				Panel:AddControl("Header", {Description = "Undead Map Spawner Commands"})
				Panel:ControlHelp("Navigate to LNR (MapSp) to tinker settings for the Manhunt Undead Map Spawner.")
				
				Panel:AddControl("Checkbox", {Label = "Map Spawner: Enable starting music?", Command = "vj_manhunt_hunters_zmb_map_music"})
				Panel:AddControl("Checkbox", {Label = "Map Spawner: Enable spooky sounds?", Command = "vj_manhunt_hunters_zmb_map_spooky_snds"})
				Panel:AddControl("Checkbox", {Label = "Map Spawner: Remove all undead NPCs upon deleting Map Spawner?", Command = "vj_manhunt_hunters_zmb_map_delete"})
			end)
		end)
	end
end

// If Lethal Necrotics Reanimated: Half-Life 2 is not installed and not detected, dont load the spawnmenu and pester the player with a message
if LNRExists == false then
	if GetConVarNumber("vj_manhunt_lnr_alert") == 1 then
		if CLIENT then
			hook.Add("Initialize","LNRFALSE",function()
				local vjorange = Color(255,100,0)
				local yellow = Color(255,255,0)
				local red = Color(255,0,0)
				local white = Color(255,255,255)
				local lightblue = Color(0,199,255)
				timer.Simple(10,function()
					chat.AddText(vjorange,"---------- MANHUNT ----------")
					chat.AddText(yellow,"• LNR isn't Detected!")
					chat.AddText(red,"• You cannot use Undead NPCs.")
					chat.AddText(red,"• Install LNR to use Undead NPCs")
					chat.AddText(white,"• To disable this message, set vj_manhunt_lnr_alert to 0")
					chat.AddText(vjorange,"-----------------------------")
					local dingaling_sound = CreateSound(game.GetWorld(), "vj_manhunt/dingaling_bad.mp3")
					dingaling_sound:SetSoundLevel(0)
					dingaling_sound:Play()
				end)
				timer.Simple(15,function()
					chat.AddText(vjorange,"---------- MANHUNT ----------")
					chat.AddText(lightblue,"•       LNR Download:")
					chat.AddText(white,"• https://steamcommunity.com/sharedfiles/filedetails/?id=1879776316")
					chat.AddText(vjorange,"-----------------------------")
					local dingaling_sound = CreateSound(game.GetWorld(), "vj_manhunt/dingaling_bad.mp3")
					dingaling_sound:SetSoundLevel(0)
					dingaling_sound:Play()
				end)
			end)
		end
	end
end
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
AddCSLuaFile(AutorunFile)
VJ.AddAddonProperty(AddonName,AddonType)
else
if CLIENT then
	chat.AddText(Color(0, 200, 200), PublicAddonName,
	Color(0, 255, 0), " was unable to install, you are missing ",
	Color(255, 100, 0), "VJ Base!")
end

timer.Simple(1, function()
	if not VJBASE_ERROR_MISSING then
		VJBASE_ERROR_MISSING = true
		if CLIENT then
			// Get rid of old error messages from addons running on older code...
			if VJF && type(VJF) == "Panel" then
				VJF:Close()
			end
			VJF = true
			
			local frame = vgui.Create("DFrame")
			frame:SetSize(600, 160)
			frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
			frame:SetTitle("Error: VJ Base is missing!")
			frame:SetBackgroundBlur(true)
			frame:MakePopup()

			local labelTitle = vgui.Create("DLabel", frame)
			labelTitle:SetPos(250, 30)
			labelTitle:SetText("VJ BASE IS MISSING!")
			labelTitle:SetTextColor(Color(255,128,128))
			labelTitle:SizeToContents()
			
			local label1 = vgui.Create("DLabel", frame)
			label1:SetPos(170, 50)
			label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
			label1:SizeToContents()
			
			local label2 = vgui.Create("DLabel", frame)
			label2:SetPos(10, 70)
			label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
			label2:SizeToContents()
			
			local link = vgui.Create("DLabelURL", frame)
			link:SetSize(300, 20)
			link:SetPos(195, 100)
			link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
			link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
			
			local buttonClose = vgui.Create("DButton", frame)
			buttonClose:SetText("CLOSE")
			buttonClose:SetPos(260, 120)
			buttonClose:SetSize(80, 35)
			buttonClose.DoClick = function()
				frame:Close()
			end
		elseif (SERVER) then
			VJF = true
			timer.Remove("VJBASEMissing")
			timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
				print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
			end)
		end
	end
end)
end