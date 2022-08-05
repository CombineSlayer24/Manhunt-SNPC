/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Undead Random Runner"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Manhunt - Undead"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
-- chances of them spawning is based on how many where killed in Manhunt 1
-- < means more chances
-- > means less chances
local entsList = {
	"npc_vj_mh_undead_hood_run:6",
	"npc_vj_mh_undead_hood_wlk:6",
	"npc_vj_mh_undead_swat_run:5",
	"npc_vj_mh_undead_swat_wlk:5",
	"npc_vj_mh_undead_skin_run:4",
	"npc_vj_mh_undead_skin_wlk:4",
	"npc_vj_mh_undead_cop_run:4",
	"npc_vj_mh_undead_cop_wlk:4",
	"npc_vj_mh_undead_innocent_run:3",
	"npc_vj_mh_undead_innocent_wlk:3",
	"npc_vj_mh_undead_smiley_run:2",
	"npc_vj_mh_undead_smiley_wlk:2",
	"npc_vj_mh_undead_wardog_run:2",
	"npc_vj_mh_undead_wardog_wlk:2",
	"npc_vj_mh_undead_cerberus_run:2",
	"npc_vj_mh_undead_cerberus_wlk:2"
}
ENT.EntitiesToSpawn = {
	{SpawnPosition = {vForward=0, vRight=0, vUp=-27}, Entities = entsList},
}
/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/