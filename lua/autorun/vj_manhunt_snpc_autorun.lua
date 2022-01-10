/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------
*/
------------------ Addon Information ------------------
local PublicAddonName = "Manhunt SNPC Pack"
local AddonName = "Manhunt"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_manhunt_snpc_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vManhunt_Hunters_Cat = "Manhunt - Hunters"
	local vManhunt_Misc_Cat = "Manhunt - Misc"
	local vManhunt_EntityCat = "Manhunt - Entities"
	
	VJ.AddCategoryInfo(vManhunt_Hunters_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_Misc_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_EntityCat, {Icon = "vgui/mh_logo.png"})

--[[	Weapon Notes : (If your digging in here!)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	Hoods = (VANILLA: Fist, Bat (Wooden), Blackjack, Crowbar | BETA: Hammer, Fire Axe | CUSTOM: Light Pistol, Revolver)
///	Skinz =  (VANILLA: Fist, Bat (Metal), Knife, Nailgun | BETA: Revolver, Sawn-off Shotgun | CUSTOM: Machete, Light Pistol)
///	Wardogs = (VANILLA: Machete, Shotgun, Sniper Rifle, Revolver | BETA: PSG-1, Hunting Knife | CUSTOM: Fist, Bat (Wooden), Assault Rifle)
///	Innocentz = (VANILLA: Fist, Revolver, Sawn-off Shotgun, Knife, Sickle, Axe, Bat (Wooden) | BETA: Bat (Spiked), Shotgun | CUSTOM: Heavy Pistol)
///	Smileys = (VANILLA: Fist, Meat Cleaver, Revolver, Shotgun, Light Pistol, Sawn-off Shotgun, Knife, Bat (Metal)| BETA: Hammer, Bat (Spiked), Blackjack, Sickle)
///	CCPD = (VANILLA: Revolver, Nightstick, Shotgun, Light Pistol, Heavy Pistol, Sub-Machine Gun, Sniper Rifle | CUSTOM: Bat (Wooden), Fist)
///	CCPD Swat = (VANILLA: Shotgun, Heavy Pistol, Sub-Machine Gun | CUSTOM: Nightstick, Fist, Assault Rifle)
///	Cerberus = (VANILLA: Assault Rifle, Shotgun, Heavy Pistol | CUSTOM: Fist, Nightstick, Bat (Wooden), Light Pistol)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	James Earl Cash = (All)
///	Rameriez (Boss) = (VANILLA: Sniper Rifle, Shotgun | CUSTOM: Assault Rifle, Heavy Pistol)
///	Bunny (Boss) (?)
///	Cerberus Leader (Boss) (Same loadout as Cerberus)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	Item Rarites = 5 (very common), 4 (common), 3 (somewhat common), 2 (rare), 1 (extremely rare)
///	Striker = Melee welder (325)
///	Gunman = Gun welder (150)
--]]

	local ManHunt_Hoods_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		--"weapon_vj_manhunt_melee_crowbar",
		--"weapon_vj_manhunt_melee_crowbar",
		--"weapon_vj_manhunt_melee_crowbar",
		--"weapon_vj_manhunt_melee_crowbar",
		--"weapon_vj_manhunt_melee_fire-axe",
		--"weapon_vj_manhunt_melee_fire-axe",
		--"weapon_vj_manhunt_melee_fire-axe",
		--"weapon_vj_manhunt_melee_hammer",
		--"weapon_vj_manhunt_melee_hammer",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists"
	}

	local ManHunt_Hoods_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light"
	}

	local ManHunt_Skinz_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		--"weapon_vj_manhunt_melee_knife",
		--"weapon_vj_manhunt_melee_knife",
		--"weapon_vj_manhunt_melee_knife",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists"
		--"weapon_vj_manhunt_melee_machete",
		--"weapon_vj_manhunt_melee_machete",
	}

	local ManHunt_Skinz_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2"
		--"weapon_vj_manhunt_shotgun_sawnoff",
		--"weapon_vj_manhunt_shotgun_sawnoff"
	}

	local ManHunt_CCPD_Cop_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w"
	}

	local ManHunt_CCPD_Cop_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		--"weapon_vj_manhunt_shotgun_pump",
		--"weapon_vj_manhunt_shotgun_pump",
		--"weapon_vj_manhunt_shotgun_pump",
		--"weapon_vj_manhunt_shotgun_pump",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_smg",
		--"weapon_vj_manhunt_pistol_smg",
		"weapon_vj_manhunt_rifle_sniper"
	}

	---------- Hunters ---------------------
	VJ.AddNPC_HUMAN("Skinz Member (Friendly)","npc_vj_skin",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Member","npc_vj_skin_h",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)

	VJ.AddNPC_HUMAN("Hood Member (Friendly)","npc_vj_hood",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hood Member","npc_vj_hood_h",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)

	VJ.AddNPC_HUMAN("CCPD Officer (Friendly)","npc_vj_ccpd_cop",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD Officer","npc_vj_ccpd_cop_h",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)

	---------- Misc ------------------------
	VJ.AddNPC_HUMAN("James Earl Cash (Friendly)","npc_vj_cash",ManHunt_Hoods_Striker_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("James Earl Cash","npc_vj_cash_h",ManHunt_Hoods_Striker_Weapons,vManhunt_Misc_Cat)

	---------- Weapons ---------------------
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light", "weapon_vj_manhunt_pistol_light")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light (PS2)", "weapon_vj_manhunt_pistol_light_ps2")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Revolver", "weapon_vj_manhunt_pistol_38r")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Nailgun", "weapon_vj_manhunt_pistol_nailgun")
	VJ.AddNPCWeapon("VJ_Manhunt_Rifle_Sniper (Bolt)", "weapon_vj_manhunt_rifle_sniper")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Blackjack", "weapon_vj_manhunt_melee_blackjack")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Bat (Metal)", "weapon_vj_manhunt_melee_bat_m")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Bat (Wood)", "weapon_vj_manhunt_melee_bat_w")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Nightstick", "weapon_vj_manhunt_melee_nightstick")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Fists", "weapon_vj_manhunt_melee_fists")

	VJ.AddEntity("Painkillers", "sent_vj_pills_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Shotgun Ammo", "sent_vj_shotgun_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Pistol Ammo", "sent_vj_pistol_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Pistol + SMG Ammo", "sent_vj_pis_smg_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Rifle Ammo", "sent_vj_rifle_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	-- VJ.AddEntity("Sniper Ammo", "sent_vj_pistol_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
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
	util.PrecacheModel("models/manhunt/npc/skin1.mdl")
	util.PrecacheModel("models/manhunt/npc/skin2.mdl")
	util.PrecacheModel("models/manhunt/npc/skin3.mdl")
	util.PrecacheModel("models/manhunt/npc/hood1.mdl")
	util.PrecacheModel("models/manhunt/npc/hood2.mdl")
	util.PrecacheModel("models/manhunt/npc/hood3.mdl")
	------------------------------------------------------------------------------------------------------------------------------------------------------
	-- // Add this later //
	-- local AddConvars = {}
	-- AddConvars["vj_gtalcs_additional_voicesets"] = 0
	-- for k, v in pairs(AddConvars) do
	-- 	if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	-- end
	
	-- if CLIENT then
	-- local function VJ_MANHUNT_MAIN(Panel)
	-- 	if !game.SinglePlayer() then
	-- 	if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
	-- 		Panel:AddControl( "Label", {Text = "You are not an admin!"})
	-- 		Panel:ControlHelp("Notice: Only admins can change this settings")
	-- 		return
	-- 		end
	-- 	end
	-- 	Panel:AddControl( "Label", {Text = "Notice: Only admins can change this settings."})
	-- 	local vj_manhunt_cmdreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "1"}
	-- 	vj_gtalcs_cmdreset.Options["#vjbase.menugeneral.default"] = { 
	-- 	vj_gtalcs_additional_voicesets = "0",
	-- 	--vj_gtalcs_additional_meleesounds = "0",
	-- 	}
	-- 	Panel:AddControl("Header", {Description = "NOTICE!: Newly spawned SNPC's will take affect to the changes you made!"})
	-- 	Panel:AddControl("Checkbox", {Label = "Can Peds use additional voices? (GTA III voices)", Command = "vj_gtalcs_additional_voicesets"})
	-- 	Panel:ControlHelp("If unchecked, peds will only have LCS voicesets. (Limited to certain peds)")
	-- 	--Panel:AddControl("Checkbox", {Label = "Melee weapons use additional sounds?", Command = "vj_gtalcs_additional_meleesounds"})
	-- 	--Panel:ControlHelp("If unchecked, melee weapons will only have classic GTA sfx. If checked, melee weapons will use Bully CCE sfx + classic GTA sfx.")
				
	-- end
	-- function VJ_ADDTOMENU_MANHUNT()
	-- 	spawnmenu.AddToolMenuOption( "DrVrej", "SNPC Configures", "MANHUNT SNPC", "MANHUNT SNPC", "", "", VJ_MANHUNT_MAIN, {} )
	-- end
	-- 	hook.Add( "PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT", VJ_ADDTOMENU_MANHUNT )
	-- end
	-- ConVars --
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end