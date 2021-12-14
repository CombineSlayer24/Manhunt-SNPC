
/*--------------------------------------------------
	=============== Dummy Spawn ===============
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to load spawns for Dummy
--------------------------------------------------*/
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

if SERVER then
	local npcWepList = list.GetForEdit("NPCUsableWeapons")

	hook.Add("PlayerSpawnNPC", "VJCheckNPCWeapon", function(plyv, npcclassv, wepclassv)
		if type(wepclassv) ~= "string" or wepclassv == "" then return end

		if not npcWepList[wepclassv] then -- do not copy the table
			local wep = weapons.GetStored(wepclassv)

			if wep and (wep.Spawnable and not wep.AdminOnly) and weapons.IsBasedOn(wep.ClassName, "weapon_vj_melee_base_v2") then
				npcWepList[wepclassv] = {
					["class"] = wep.ClassName,
					["title"] = wep.PrintName or wep.ClassName
				}
			end
		end
	end)
end
